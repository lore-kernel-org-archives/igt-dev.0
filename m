Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC15C25B7C
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 23:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92F310E8C3;
	Wed, 22 May 2024 23:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBJO7lbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE9E10E8C3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716421259; x=1747957259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iY0beG78vD4NK8RDMvEVVpElBIug4SPp+zBjs9KWfzY=;
 b=TBJO7lbio5xkMt3bSW0JvOAqa1MeXmp52+3sS1I/uGCdCUEMJ3kgCR94
 BN29FYtZY2lNrvUxWMIoehMcbC/h5PQMKfeBNm18uNYrmU4f9QKqAyDFP
 kRmbv5oFPRcXwre9bCLmeVeIGNlT8Y/V0X3jMVQN3wL+DMy4iOIr5ZV8E
 7AZj7IX/fIN0vEn3iOr5PqM88BvVL4O4+7Mr/cuzEwLMsnJg870Vu5qUz
 FpikPRROBYcMGwyfG3TCc5hDqjqU/M981qXpCnLdGlKzd6MkzJyfFYyqR
 PvWxdHbT2brR2/lsXWnrhzQ/bf3TxcxcXWtU63YPvpeyjEOB+w8kJYHbQ w==;
X-CSE-ConnectionGUID: 2vpsqDXET0WQEbIo0tncGA==
X-CSE-MsgGUID: dGr6/czAS4SDGlN7f3egKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30239738"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30239738"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 16:40:54 -0700
X-CSE-ConnectionGUID: C+TyfGOoQoet68SL0l4bsA==
X-CSE-MsgGUID: NGquPn0xR5W7mA48z5SULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38429227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 16:40:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 16:40:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 16:40:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 16:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH7KAwi9F0TjU3aOyTKdY3UguvUXSmklVO5GNbvnYfHVNYgByJtFPxUDTXiTaMTcRxk0buIKCiMdxMY1n1kTZfeJk6QzentJVoTlbeHOtQSNY1l1QIrWt83u/xaCU2JzSZTj4CObe9Oc2YnvDqci4yQO0GloO1eBrFOsTEE366uk4EibDAInWJw00je9YPQQr/YoC0CmOgIrze/TlT7bKorrdzng9Lve6REoab7im5e/TOVOcSd9L9q2dc3azef65zXL+tQVhsviIRjMOw+aOCWlekbxCK14B5FltQB3ijZTAubcV46bfdXQTvAhFjLbyNmyAV+JfoJkUCQ/N6iCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY0beG78vD4NK8RDMvEVVpElBIug4SPp+zBjs9KWfzY=;
 b=TH7EbFaaZ0tJZfYIwVOZSIYGfBx7EuinlFfNZKcBEMmqDUbpD44lWuD7ZEIqo1GfLaAH8dKN+21Riauz7zza0nxP/UC9Mo0tJFqx16QGX1U3Z/EZgVf7eZ67QHPNTyGS+4nJhk3JshW5brYA5r2lajmCV1uLgcQLBcg+1VVYqNSZH1twQk9noFXYJRZsZzo6qjFqP6OzfTOm85Th91ljDfs5azsCuMJk25kDSBsnLGLdKXLJJxHOkieQJr+46LPBRrHkPF0LfIVboUOhom0C7cJiktqplZ+1gsn7/VOn/dcN8Qytd/8fFlFt9LXKfYGAJkFyP2WPgNzAkfiQIar6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 22 May
 2024 23:40:47 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::5b47:1b5a:71b2:4f20]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::5b47:1b5a:71b2:4f20%3]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 23:40:46 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Lee, Shawn C" <shawn.c.lee@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Skip the first detect
Thread-Topic: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Skip the first detect
Thread-Index: AQHaqLsRHuPfjxeg+kKc0VtOBdVvuLGjdTwAgAB7JYA=
Date: Wed, 22 May 2024 23:40:46 +0000
Message-ID: <f2752767bbc50d8979a62171b6d7dbb1caf918bb.camel@intel.com>
References: <20240518003345.203255-1-khaled.almahallawy@intel.com>
 <20240522161606.httnpgasf37tb66y@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240522161606.httnpgasf37tb66y@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4620:EE_|MW6PR11MB8365:EE_
x-ms-office365-filtering-correlation-id: 81aacb7d-adce-4bfb-5da0-08dc7ab89abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?T2EyWmowN1dzTXdsOVBYbmhNUm5TWlc2dXpSczVvaThUdFh6MDUycG02YmZZ?=
 =?utf-8?B?Yzl3RStMRlduOGRWcnV0VFgzNFNJc3JjRGxWSXIxYjk1ejlNcjhuQ1NNSFVI?=
 =?utf-8?B?Y29ON2FJcG1KN0hGTE1tTDFydjFhdnRDdGQrNk5sZnJob2pBdFRDL1lOc0Zn?=
 =?utf-8?B?VU1Fb25JWnllUEw2SGszR1FLeGVlbW1aZUROZXoxOGR2UTNsRXBhd0NLZkJu?=
 =?utf-8?B?cXJ5U3BzeUVNNVBZcEdrenJlRFNFL1BUMFRBeE82eUFQSUNBeFkvV2E1ZWw2?=
 =?utf-8?B?RnBBbnhURytJSExRMTljakMvTlp4MG9sSlpzcDM1aG9tOFI1a2pvZHIrZllM?=
 =?utf-8?B?Z01iMHkwZXE4cS9tV2NUeGQvSlV4aGlJNGpIaHE1MVlhWENuNU1vT2lkRGhp?=
 =?utf-8?B?VTVtckkzSjh1VWh3dTlNbXc4L3VzTDBLS3RhV2JQSFFhSEViVjlibjhMbjNa?=
 =?utf-8?B?djhIZFVRQnQyWGlCdldsWWlKYytRT2pMaFRUb0NkeWdQemV6ckdRVGZuNUsz?=
 =?utf-8?B?QytDc3ZvRXNmek4xYjE0bDFHMnVjdm9jOS9aTFJhQTdYRjRyQTRwb0xvWG50?=
 =?utf-8?B?RmptUE9DMHBKcnFHcTlEb0Rad1dEM0lJc2hjdCtYYU1oK2FqZGYvTnhhZWw5?=
 =?utf-8?B?aVFSbzZQQW5hSUl0UmhDYS9wVGpiSGdCWmoyMG9lMWF5Y2VkeHl5THVPTURU?=
 =?utf-8?B?bGtqQ1hhUTlKOEhhN0ZUcEZWclBOcUxCaU02STg5QzR5M2c1ZStJU2dPZWVX?=
 =?utf-8?B?azl1blUzbnhXbnJOQ2tHa2JxR2NZZXg1emNVZ1ZrNHJUdk9VQThTK0tBQ2JB?=
 =?utf-8?B?MjRoTlBNTG9qaENESHlaWDZ4T05vMXdIQzMxQktTYmVVbXZlSTZmdDIyU3hk?=
 =?utf-8?B?dzJENGVMMWxKb3pNYytJRkhHdU1sY1l3M2tRY1hvb0lCRmNrSjVxRDRlalJM?=
 =?utf-8?B?VFhHam9TMnhZd3R0ZldGUHNWZlAwZ3daNVlwNUZjNkhocDdiUHBFQ29nRTRE?=
 =?utf-8?B?M05kUlBEcVAvS1ZqbmpkYWtYZjRHWGxwaXNTaHJoam5rd0FiSjNQTnVVZDdi?=
 =?utf-8?B?d1hyQ3BKYU94WERYVlFZYkZWQ0kzblRKdXZqZTRpbktBYml2NkhuaWtGY1Fp?=
 =?utf-8?B?dnpOVXQwYngyRTF6UFJJdVB6L0QzMDJUV2lQbW5IY0RVbzZKeHk4RVhzMzVv?=
 =?utf-8?B?VGhTZmt3TzF3S2tGKy9vR0JVMkt5bFFpMHdYVHNsS1B5aFJUamp2T3lYUDFR?=
 =?utf-8?B?K2Rsd2hCU0RFWU8ySjhMdVZJbkFwMEE3REprdFMzVUZ3M0JFanpFd1REMXMr?=
 =?utf-8?B?WGhMb1lXQ2N0N1VSTkViODdSanFlbldMTHM1R3p5RWVFUFByTi9YbjdPYmZJ?=
 =?utf-8?B?QnZFUGhSYzJ1by9vWStFWGVrY2NMTlZzemlDQWFLK3JrejIvVVo4R2oyemZD?=
 =?utf-8?B?Sk8xLzVmSnhIUStvT1A3UnZnTTZCTVdRSmlBVDJ1QjQ1N2l4TldFMVFZalVW?=
 =?utf-8?B?NC9ZT2doSUw2MlpxeGlGaHQyYUNUQm5YSDZTNlVlWVdYbGYrQWQvUGtKOStZ?=
 =?utf-8?B?dmxjTVA3SmVRN010TVprZDNsRE9lOVlCSVB0UWFXeUYrdnBKamdpZkhERTQ2?=
 =?utf-8?B?eGd4M2FXdXhDdTFmZGdOZ3ZqS0Rabk11ZmtTTHhuTFd1bmNSaElVajB4V0la?=
 =?utf-8?B?TUJiU3BiTGx1UkpPSEhhRWwxZ2FnRGRQT2ZEcmprK3ZoYytZdzZWbVJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZEMjhnOTF4TFR3NEdwV1RvRWRZNFYxSUdCcmtCeEhmejUxZGlLVWZRUzBO?=
 =?utf-8?B?S3JITFZDV09hV0kzbHdTSUhaSE5KUms4RmxNYTlCWFRFZ3pNaE5pcm1HcHhn?=
 =?utf-8?B?Vk1vWnZydUlnSDNpSzlxVm1temJ1L2pSRk54WmIvL1c3dDFWYmRuZEhoOGZP?=
 =?utf-8?B?ekxqWkdNYVJmVWlSOGw3SERHdUV1aVdOcWZ6T3UzQ3NrK2tDVXRrT2o1NUli?=
 =?utf-8?B?QnlybmRBU0RWTlJVemI3VkZ0cW13OTZIaWpXSlFSeWFUNXVPK1ZTNkhBR1ox?=
 =?utf-8?B?QzQ4bVBXb0RwUmxSc0lERlAyVTcySTBLbWQzVFJMOE5BNG5hYk9lYXQ4UGFu?=
 =?utf-8?B?VmJZTlVzMjBpRVpjQWp6RTJFWE1aRWhwd29lRWwrVTU2cGpXZXBVcjFLZW1z?=
 =?utf-8?B?Z0NWZldXMGJCcStsZmFhZVltOWNxcjE3V0tEamdORDNKTzBLbmJFUCtnNXlh?=
 =?utf-8?B?b1VHZkI0THpXUHZSaDdGc1R4ZWltbFBtbUIyWnlpK1VRZk85NUNIbVlUeFV6?=
 =?utf-8?B?MVNjV2JycnY0R0RpbFhiN01GV0w1RUtwbmF1ZHVTeUp1V1JZaWFuSlFXQ1dO?=
 =?utf-8?B?dWRMKzluWUg3QXd0WUFNUFY1bmU4aUd2MktEeURnNXhDSGRYeXU4QnlpaFo5?=
 =?utf-8?B?UEVadzllSFV1VXFzTk9CQ2xlamZoemN6dU9icjFQMm1JZDk2T3NjK3FESGVw?=
 =?utf-8?B?alRkakwxdHZxUlZRWURrWEkrekdNVjREcE1iR0l5bGZMbzE3MDZzeXVVNWhN?=
 =?utf-8?B?NlZNVTlUd1VrWFlHbmpZVHBCZjFIZmh3WUM1RlFFVG81UmFyYndLdGZNbDFq?=
 =?utf-8?B?OG8zTU1iaUxtcUs0cGIwbGx2RHFKLzN6K2dpZTJacnRRditGMzlUWENpeWx3?=
 =?utf-8?B?YUhZSnZRM3AwUjNTdkE2aDVpZkUzb1Zjb2dXU3pLZENTcVRCSE8raFhsYWM2?=
 =?utf-8?B?U3ZEcnZaMVlWbTBxRTJOajUwSlo2cmlaM3JrR1paYzlBR3ErUmxyUU10K2FW?=
 =?utf-8?B?RVd0L0pGV0hBTjNjdkQvRnU0dktzaG9aMVJmUEtwbEdZZFJQWUZtaFJGbVQy?=
 =?utf-8?B?czVKWHZselhib3hYNDJpbEpYUFcvT0NxT1FZV2UyV0FzWFNOY1ZUc0c5Smlm?=
 =?utf-8?B?RVowcFJIYytDUHFNUmpSeHpyNTQrNXM2NUw5UUE0MG84ZVd4UlMwZ09ISW13?=
 =?utf-8?B?ZWJ2UjJsajFiTDFyWHJ4S2xlVEl1ZWZWVjd2ZVUyQWExR0NpVGdRUnljMGlj?=
 =?utf-8?B?OUwrQkt4ZFlrSGxPekFyU1o3WHJPL1FFVDlER3U2Mnc3QXJJT0Foai9UR1Z1?=
 =?utf-8?B?VEl2UGxEeUtsR1RzRUZrbzllVHBDTC9vbnppZmtFeHUvaUdCR3pnM25NbWVC?=
 =?utf-8?B?UU9ISVZuNXNUQUR6NUwxWG1NcW41RXB1OFpvZHg0K3dzSTNqS2xic0tuaDZh?=
 =?utf-8?B?cFVwOTZKVm42a1IvVWZEeDlXSmJsZHc0S3YwbldUUmRPazVrOVpBYkJQR2NP?=
 =?utf-8?B?N0ZqeFpET2RsNUZHMEpHNWRlVCtjWmhiZU1zSVFDMzV1TjFWZk00V0ovWDhI?=
 =?utf-8?B?eU91UnY1YjVwbUx5NnVIM3ZRUThqU0svQXdOUUNuQ1l6OTY2Yi9JYlB0bzVl?=
 =?utf-8?B?VUtjSDcvVFNZd2djbEUybkw2SjFUQkhFSGRrVDJOYlMrU1JzU2NTTEFJRklE?=
 =?utf-8?B?ckFaaFJ1Kys5QVhZSGdxb1MvdWVXOWJGT0NSeVpraEo4R0hmWHJzc0tJckU3?=
 =?utf-8?B?bUVRdkM1ZWdNSVVyUzNYMFQ0NkxJWlVVUE9BVjVRdkxidEtGZ01GamN5Um9J?=
 =?utf-8?B?VjhwbU1JelM4ZXZ4N21WTDBTK2xFSGdKeTVEd2pLM1p2UHhUV3FzdVNLN3RV?=
 =?utf-8?B?bHlQMEVIbkdCS2NpMFdNTlF5a0YxbVZqQ1ZLemt2ZndZVzM4UVc3YVFVL2NK?=
 =?utf-8?B?ZUIvUGIrSlMzNVIraEViSGs5OFYxbHllNkNzTVREZXFCMzJ2WWYyV09PRTlY?=
 =?utf-8?B?QlRZQ3A0UjF1YXFJYmZ5aE9md3A1L2NXZm1mTWtTSU03emk5UzN5eXpMQ1lz?=
 =?utf-8?B?OTUvWUxqbEh4WG82ZC9QNGFQWHZZSmlzekM3bmo5TFdBSDRDTGh0N3Y5cmJB?=
 =?utf-8?B?YVBmMVJCSHhIZCtqelJEWDJqeUFFbmIxVGlXSnBKZEVxOXFUQytob1JEM3cx?=
 =?utf-8?Q?Bh8LVsvTWwoLKKv9TFwT7BU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBC8D19A54F7844EA7181C5DE111B2C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aacb7d-adce-4bfb-5da0-08dc7ab89abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 23:40:46.8337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5v10GlEVj++3YOCXNTJGJjkxNIM8zoOI8Nq4/gu2A3ixb+Lpbi2Njv19qN9oViUJvIvfgvUk+wP9UhDqZ15A+k2YNZMySTNAQifcJNIfI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI0LTA1LTIyIGF0IDE4OjE2ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
Cj4gSGkgS2hhbGVkLAo+IE9uIDIwMjQtMDUtMTcgYXQgMTc6MzM6NDUgLTA3MDAsIEtoYWxlZCBB
bG1haGFsbGF3eSB3cm90ZToKPiA+IEl0IGlzIG9ic2VydmVkIGluIHNvbWUgY2hyb21lIGRldmlj
ZXMgdGhhdCB0aGUgZmlyc3QgZGV0ZWN0IHRha2UgYQo+ID4gbG9uZyB0aW1lIGR1ZSB0byBQUFMu
IEluIGFub3RoZXIgZGV2aWNlIGl0IHdhcyBmb3VuZCB0aGUgZURQIHBhbmVsCj4gPiBtaXNiZWhh
dmluZyBhbmQga2VlcCBzZW5kaW5nIG11bHRpcGxlIGxvbmcgSFBEIGR1cmluZyBQUFMgd2hpY2gK
PiA+IHRyaWdnZXIgSFBEIHN0b3JtIHdhcm5pbmcuIFRoaXMgZmlyc3QgZGV0ZWN0IHdpbGwgYWx3
YXlzIGV4Y2VlZHMKPiA+IHRoZQo+ID4gVEhSRVNIT0xEX1BFUl9DT05ORUNUT1IgYW5kIHdpbGwg
Y2F1c2UgdGhlIHRlc3QgdG8gZmFpbC4KPiA+IAo+ID4gQXZvaWQgdGhhdCBieSBza2lwcGluZyB0
aGUgbWVhc3VyZW1lbnQgZm9yIHRoZSBmaXJzdCBkZXRlY3QuCj4gPiBBbHNvIGFkZGluZyBtb3Jl
IGRlYnVnIGxvZ3MgaW4gdGhlIHRlc3QgYW5kIGtlcm5lbCB0byBiZSBhYmxlIHRvCj4gPiBjb3Jy
ZWxhdGUgdGhlIHJlc3VsdHMuCj4gPiAKPiA+IEZpeGVzOiBWTEstNTIwNTIsIFZMSy01Njg2MQo+
IAo+IFBsZWFzZSBkbyBub3Qgd3JpdGUgdGhpcyBpbiBkZXNjcmlwdGlvbi4KCk9LCj4gCj4gQWxz
byBsb29rIGludG8gQ0kgcmVwb3J0IGFuZCByZXBseSB0byBpdCwgaW4gcmVwbGF5IGN1dCBpdCBh
ZnRlcgo+ICdLbm93bicgcmVwb3J0IGJlZ2lucy4KCk9rLCB3aWxsIHNlbmQgVjIgYW5kIHJlcGx5
IGlmIGVycm9ycyBzdGlsbCByZXBvcnRlZAo+IAo+IAo+ID4gQ2M6IFN3YXRpIFNoYXJtYSA8c3dh
dGkyLnNoYXJtYUBpbnRlbC5jb20+Cj4gPiBDYzogTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hy
b21pdW0ub3JnPgo+ID4gQ2M6IFNoYXduIExlZSA8c2hhd24uYy5sZWVAaW50ZWwuY29tPgo+ID4g
Q2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEtoYWxlZCBBbG1haGFsbGF3eSA8a2hhbGVkLmFsbWFoYWxsYXd5QGlu
dGVsLmNvbT4KPiA+IC0tLQo+ID4gwqB0ZXN0cy9rbXNfc3lzZnNfZWRpZF90aW1pbmcuYyB8IDE2
ICsrKysrKysrKysrKystLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfc3lzZnNfZWRp
ZF90aW1pbmcuYwo+ID4gYi90ZXN0cy9rbXNfc3lzZnNfZWRpZF90aW1pbmcuYwo+ID4gaW5kZXgg
ZGJjNjZjODc2Li5iNzgzMmRkODMgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9rbXNfc3lzZnNfZWRp
ZF90aW1pbmcuYwo+ID4gKysrIGIvdGVzdHMva21zX3N5c2ZzX2VkaWRfdGltaW5nLmMKPiA+IEBA
IC01MCw3ICs1MCw3IEBACj4gPiDCoCNkZWZpbmUgVEhSRVNIT0xEX1BFUl9DT05ORUNUT1LCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDE1MAo+ID4gwqAjZGVmaW5lIFRIUkVTSE9MRF9Q
RVJfQ09OTkVDVE9SX01FQU7CoMKgwqAxNDAKPiA+IMKgI2RlZmluZSBUSFJFU0hPTERfQUxMX0NP
Tk5FQ1RPUlNfTUVBTsKgwqAxMDAKPiA+IC0jZGVmaW5lIENIRUNLX1RJTUVTwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDE1Cj4gPiArI2RlZmluZSBDSEVDS19USU1FU8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxNgo+ID4gwqAKPiA+IMKgSUdU
X1RFU1RfREVTQ1JJUFRJT04oIlRoaXMgdGVzdCBjaGVja3MgdGhlIHRpbWUgaXQgdGFrZXMgdG8K
PiA+IHJlcHJvYmUgZWFjaCAiCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJjb25uZWN0b3IgYW5kIGZhaWxzIGlmIGVpdGhlciB0aGUgdGltZSBpdAo+ID4gdGFr
ZXMgZm9yICIKPiA+IEBAIC04OSwxNSArODksMjUgQEAgaWd0X3NpbXBsZV9tYWluCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBDSEVDS19USU1FUzsg
aSsrKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgdGltZXNwZWMgdHMgPSB7fTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCBmZDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3QgY3VycmVudDsKPiA+IMKgCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoKGZkID0gb3Bl
bihwYXRoLCBPX1dST05MWSkpIDwgMCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250aW51ZTsKPiA+IMKgCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9rbXNnKEtN
U0dfREVCVUcgIiVzOiBzdGFydCBkZXRlY3RcbiIsCj4gPiBwYXRoKTsKPiAtLS0tLS0tLS0tLS1e
Xl5eXl5eXgo+IFdoeSBub3QgaWd0X2RlYnVnPwoKSSBhbHJlYWR5IGFkZGVkIGlndF9kZWJ1ZyBi
ZWxvdyB0byBwcmludCBjdXJyZW50LG1heCxtaW4gZm9yIGVhY2ggbG9vcC4KClRoZSBwb2ludCBo
ZXJlIGlzIHRvIGFkZCBsb2dzIGluIGtlcm5lbCBkbWVzZyB0byB1bmRlcnN0YW5kIHdoYXQgaXMK
Z29pbmcgb24gZm9yIGVhY2ggbG9vcCBkdXJpbmcgdGhlIGRldGVjdCBmcm9tIGtlcm5lbCBwZXJz
cGVjdGl2ZS4gRm9yCmV4YW1wbGUgd2UgZm91bmQgaW4gb25lIENocm9tZSBTS1UsIHRoZSBmaXJz
dCBkZXRlY3QgZG8gdGhlIGZvbGxvd2luZwpvbmx5IGZvciB0aGUgZmlyc3QgZGV0ZWN0LiBUaGlz
IGlzIGFuIHVudXN1YWwgYmVoYXZpb3IgZm9yIGVEUCBwYW5lbDoKCgpbIDU4MzcuNTUyOTg5XSBb
SUdUXSAvc3lzL2NsYXNzL2RybS9jYXJkMC1lRFAtMS9zdGF0dXM6IHN0YXJ0IGRldGVjdAouLi4K
WyA1ODM3LjU1NDQ0Nl0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm06aW50ZWxfcHBzX3ZkZF9vbl91
bmxvY2tlZF0KW0VOQ09ERVI6MjM1OkRESSBBL1BIWSBBXSBQUFMgMCB0dXJuaW5nIFZERCBvbgpb
IDU4MzcuNTU0NDY5XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybTp3YWl0X3BhbmVsX3Bvd2VyX2N5
Y2xlXQpbRU5DT0RFUjoyMzU6RERJIEEvUEhZIEFdIFBQUyAwIHdhaXQgZm9yIHBhbmVsIHBvd2Vy
IGN5Y2xlClsgNTgzNy41NTQ1MThdIGk5MTUgMDAwMDowMDowMi4wOiBbZHJtOndhaXRfcGFuZWxf
c3RhdHVzXQpbRU5DT0RFUjoyMzU6RERJIEEvUEhZIEFdIFBQUyAwIG1hc2s6IDB4YjgwMDAwMGYg
dmFsdWU6IDB4MDAwMDAwMDAKUFBfU1RBVFVTOiAweDAwMDAwMDAwIFBQX0NPTlRST0w6IDB4MDAw
MDAwNjAKWyA1ODM3LjU1NDU0Ml0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm06d2FpdF9wYW5lbF9z
dGF0dXNdIFdhaXQgY29tcGxldGUKWyA1ODM3LjU1NDU5Nl0gaTkxNSAwMDAwOjAwOjAyLjA6IFtk
cm06aW50ZWxfcHBzX3ZkZF9vbl91bmxvY2tlZF0KW0VOQ09ERVI6MjM1OkRESSBBL1BIWSBBXSBQ
UFMgMCBQUF9TVEFUVVM6IDB4MDAwMDAwMDAgUFBfQ09OVFJPTDoKMHgwMDAwMDA2OApbIDU4Mzcu
NTU0NjE5XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybTppbnRlbF9wcHNfdmRkX29uX3VubG9ja2Vk
XQpbRU5DT0RFUjoyMzU6RERJIEEvUEhZIEFdIFBQUyAwIHBhbmVsIHBvd2VyIHdhc24ndCBlbmFi
bGVkClsgNTgzNy41NjEzNjddIGk5MTUgMDAwMDowMDowMi4wOiBbZHJtOmludGVsX2hwZF9pcnFf
aGFuZGxlcl0gUmVjZWl2ZWQKSFBEIGludGVycnVwdCBvbiBQSU4gNCAtIGNudDogMTAKWyA1ODM3
LjU2MTQ5N10gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm06aW50ZWxfZHBfaHBkX3B1bHNlXSBpZ25v
cmluZwpsb25nIGhwZCBvbiBlRFAgW0VOQ09ERVI6MjM1OkRESSBBL1BIWSBBXQpbIDU4MzcuNTY0
NDEyXSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybTppbnRlbF9ocGRfaXJxX2hhbmRsZXJdIFJlY2Vp
dmVkCkhQRCBpbnRlcnJ1cHQgb24gUElOIDQgLSBjbnQ6IDIwClsgNTgzNy41NjQ1MThdIGk5MTUg
MDAwMDowMDowMi4wOiBbZHJtOmludGVsX2RwX2hwZF9wdWxzZV0gaWdub3JpbmcKbG9uZyBocGQg
b24gZURQIFtFTkNPREVSOjIzNTpEREkgQS9QSFkgQV0KWyA1ODM3LjYyNTAyNV0gaTkxNSAwMDAw
OjAwOjAyLjA6IFtkcm06aW50ZWxfaHBkX2lycV9oYW5kbGVyXSBSZWNlaXZlZApIUEQgaW50ZXJy
dXB0IG9uIFBJTiA0IC0gY250OiAzMApbIDU4MzcuNjI1MTgzXSBpOTE1IDAwMDA6MDA6MDIuMDog
W2RybTppbnRlbF9kcF9ocGRfcHVsc2VdIGlnbm9yaW5nCmxvbmcgaHBkIG9uIGVEUCBbRU5DT0RF
UjoyMzU6RERJIEEvUEhZIEFdCi4uLgpbIDU4MzcuNzYwNTA3XSBbSUdUXSAvc3lzL2NsYXNzL2Ry
bS9jYXJkMC1lRFAtMS9zdGF0dXM6IGVuZCBkZXRlY3QKCgpGcm9tIGlndC1kZWJ1ZyBhZGRlZCBi
ZWxvdyB3ZSB3aWxsIGJlIGFibGUgdG8gY29ycmVsYXRlL2NvbmZpcm0gdGhlCmtlcm5lbCAoNTgz
Ny43NjA1MDcgLSA1ODM3LjU1Mjk4OSA9IDAuMjA3NTE4ID0gMjA3bXMpOgoKKGttc19zeXNmc19l
ZGlkX3RpbWluZzoyOTY4OCkgSU5GTzogcGF0aD1jYXJkMC1lRFAtMSBpPTAKY3VycmVudD0yMDcu
MTY4NDIyZG1zIG1lYW4ubWF4PSAyMDcuMTY4NDIybXMgbWVhbi5taW49IDIwNy4xNjg0MjJtcyAK
CkFmdGVyIHdlIGlnbm9yZSBsb25nX2hwZCBpbiBzdWJzZXF1ZW50IGl0ZXJhdGlvbnMsIHN1YnNl
cXVlbnQgcHJvYnMKb25seSB0YWtlIDItMyBtcy4gSGVyZSBpcyB0aGUgc2Vjb25kIGl0ZXJhdGlv
biB+MyBtc2VjCgpbIDU4MzcuNzYwOTAwXSBbSUdUXSAvc3lzL2NsYXNzL2RybS9jYXJkMC1lRFAt
MS9zdGF0dXM6IHN0YXJ0IGRldGVjdAouLi4KWyA1ODM3Ljc2NDI3N10gW0lHVF0gL3N5cy9jbGFz
cy9kcm0vY2FyZDAtZURQLTEvc3RhdHVzOiBlbmQgZGV0ZWN0Cgooa21zX3N5c2ZzX2VkaWRfdGlt
aW5nOjI5Njg4KSBJTkZPOiBwYXRoPWNhcmQwLWVEUC0xIGk9MQpjdXJyZW50PTMuMTA1OTg5ZG1z
IG1lYW4ubWF4PSAyMDcuMTY4NDIybXMgbWVhbi5taW49IDMuMTA1OTg5bXMKClNvIGhhdmluZyBr
ZXJuZWwgbG9ncyB3aWxsIGhlbHAgdG8gZGVidWcvZXhwbGFpbiB3aHkgdGhlIHRlc3QgZmFpbHMg
b3IKdGFrZSBsb25nIHRpbWUKCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfaWdub3JlX3dhcm4od3JpdGUo
ZmQsICJkZXRlY3RcbiIsIDcpKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWd0X21lYW5fYWRkKCZtZWFuLCBpZ3RfbnNlY19lbGFwc2VkKCZ0cykp
Owo+ID4gLQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjdXJyZW50ID0gaWd0X25zZWNfZWxhcHNlZCgmdHMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfa21zZyhLTVNHX0RFQlVHICIlczogZW5k
IGRldGVjdFxuIiwKPiA+IHBhdGgpOwo+IC0tLS0tLS0tLS0tLV5eXl5eXl5eCj4gU2FtZSBoZXJl
LCB3aHkgbm90IGlndF9kZWJ1Zz8KPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGNsb3NlKGZkKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogU2tpcCBmaXJzdCBkZXRlY3QgKi8KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYoaSA9PSAw
KQo+IC0tLS0tLS0tLS0tLS0tXgo+IEFkZCBzcGFjZSBhZnRlciAnaWYnLCBzbyBpdCB3aWxsIGJl
Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChp
ID09IDApCj4gCj4gWW91IGNvdWxkIHVzZSBjaGVja3BhdGNoLnBsIGZyb20gTGludXgga2VybmVs
IHRvIGNhdGNoIHNpbWlsYXIKPiBwcm9ibGVtcy4KCk5vdGUsIHRoYW5rIHlvdSBmb3Igc3VnZ2Vz
dGlvbi4gV2lsbCBmaXggaW4gVjIKClRoYW5rcwpLaGFsZWQKPiAKPiBSZWdhcmRzLAo+IEthbWls
Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb250aW51ZTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X21lYW5fYWRkKCZtZWFuLCBjdXJyZW50KTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2RlYnVn
KCIlczogaT0lZCBjdXJyZW50PSUwMmZkbXMKPiA+IG1lYW4ubWF4PSUwMmZtcyBtZWFuLm1pbj0l
MDJmbXNcbiIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkZS0+ZF9uYW1lLCBpLCBjdXJyZW50LzFlNizCoAo+ID4gbWVh
bi5tYXgvMWU2LCBtZWFuLm1pbi8xZTYpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZGVi
dWcoIiVzOiBtZWFuLm1heCAlLjJmbnMsICUuMmZ1cywgJS4yZm1zLCAiCj4gPiAtLSAKPiA+IDIu
MzQuMQo+ID4gCgo=
