Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2DBCD4F2F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 05:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814510E05A;
	Thu, 13 Nov 2025 05:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEvUzN/q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED15810E05A;
 Thu, 13 Nov 2025 05:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763011716; x=1794547716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xPUnzWca8xmqWxPxe1jKKtNiwDmvK0gBMZ1lbz9hKbM=;
 b=NEvUzN/qtPoW/coB4ohCdEzwMq6KgDjxVSyyxyj97kVIINp6CznFCzxr
 2Z7aVkXlAjvjnBxkMgJM1+AHfIKfbkdV5OdVtvmeruxPSGSbY5bZj92V2
 Tx5lpFHSJsnmJhLf98dPWrBd0f68QvBWgFbjVzCbOY2mROq/lpr3MpHUi
 /bsQ7/OMf94zr2QjFJ6EXwlAKUQoXs6ZFTuqXVy3lZiWVjhnA3B7NvbN9
 CP8jUGdpnSSHF1xGCcrLtJriHouIYQEVKEihibM4F20eoufUkPE0gofyq
 A95vXdicKR7E7N3lAttm2Dx5yuxwOz1VG0r/ezLb8Kd0NMVyb8zZn+grO g==;
X-CSE-ConnectionGUID: YYKb+P/sRAGypUvaOAK5Fg==
X-CSE-MsgGUID: slOmXKnZRXCoNzLkYxBn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68935935"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="68935935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:28:36 -0800
X-CSE-ConnectionGUID: wBhj8NX7QVK2LE8hwzsMCw==
X-CSE-MsgGUID: T56zMTCIRc6d8mDKYLpfKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188659880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:28:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:28:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 21:28:35 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltN3ZLe8roS15nJNlljH8gCZAIO+c0/ikH3pww3dm+qs7exsVvjhMonO77ecl2eMR+m8fVIENTdIwRQfjqcFlCIWAvAITRImE/2NL/SYWW3AfzDDrmgA2AoNPXDQ0nlP2/od89mKTBAXTTDsqECsr0DqDLj3H7Oa6pRS+qyQWXfxYa9YZ1X67rH1Uf9s4+nLbuLP5weRYqa+Y/x6exH9qlPGdqDaLGD0TkpN77CFHhlBDDEq2tV8X3pR5MrKFf8dRKkxK7oRAEo9eHJ45c3VdeeLWtLj/15DYAnNhwXD6Lg1atyGReEbgi5DsLSO2ZQPC7OKUCd2tVp0/bBuZCr9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPUnzWca8xmqWxPxe1jKKtNiwDmvK0gBMZ1lbz9hKbM=;
 b=ndn4LyflzgCBxwHPpWv6xQliGSbjPGNkBM793IaAyjmkvQb+oRkIt3gBotNiB+dzJmg8Tu95l6eJ1vgSKzaoFUMvvjCHCukVaTLLYDlTkiLib+wKhhld2TM+taM9NBwolqFMohzGTIae2DZBHIEGndJRKbI6V049uMDZW5sa2uorQ2qI/e2lACiehvagkJBYH2uCbOSUK1KhcFakgQQkKMzNDwiHHMfilDRJZLrmap8x1OiFCUTtoYZP0aHDJtWaeGvyp6AMzdHXlf1x396B5D7Ms6Ijl5PzjUfLUBAFnxX+L7eEFdSo8vqLO5hhdCL/uy4cJekXGmuCCahTli0Aog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 05:28:28 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:28:27 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvZ2VtX2xt?=
 =?utf-8?B?ZW1fc3dhcHBpbmc6IFJ1biBzbWVtLW9vbSBoZWxwZXIgbG9vcCBpbiBiYWNr?=
 =?utf-8?Q?ground?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9nZW1fbG1lbV9z?=
 =?utf-8?Q?wapping:_Run_smem-oom_helper_loop_in_background?=
Thread-Index: AQHcU9XaizA29jNTbkq6NcTc2HWov7TwEqfw
Date: Thu, 13 Nov 2025 05:28:27 +0000
Message-ID: <CH0PR11MB5491F792890BE5CDD25E8A06EFCDA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251112104913.701052-2-janusz.krzysztofik@linux.intel.com>
 <176294958941.45329.12366520535453748445@10055242dc62>
 <2769487.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <2769487.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH8PR11MB7991:EE_
x-ms-office365-filtering-correlation-id: 8122926e-3b73-4e0e-439e-08de22757994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|13003099007|7053199007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dG40aTNnWEdja1lXbVg3b0t6RHhrUGVBVkNoekNwT3FYYkNsaVN0YkY4Nlho?=
 =?utf-8?B?Nys2aVNmbktTeG84b0xmc3plOXhvMHM1QjYwTkdPVE9YM2pPcjZ0eFJoZFcv?=
 =?utf-8?B?RGxpTXlGd1VFMjdKUEo2MGlGWEZ5cHM3SWRwZGxKdTlSQTU1WnlrNnNobndW?=
 =?utf-8?B?czM3cE9PZjdINXZ3QTAyTExhSkE3ZlJpS1F3OHArWFpRTElHeHRqVEI2TmZC?=
 =?utf-8?B?eUZGVVJKQVV2bWdDYnNTSm1SMnNVaUYyY2hoMDVBZTR2M0kyZkNLSUVzVG1S?=
 =?utf-8?B?RGZRVHlKRHlQazFzWVdFNllsdVVtbGlqbUJYRXIyQmNkbHV6UktuUlI0Um1y?=
 =?utf-8?B?cjhHT0lxWFVHS3dHTC8xNmlGUVpRTnNlcGVUSHNyUUxuRHNUaEd4bzlicklG?=
 =?utf-8?B?L29wRTV3K3p4T2pZNzQ0SlB2MlRRYW9DWm43WUx1VVNGYzlLQnVGWlNVZnBs?=
 =?utf-8?B?NUpIVmg0Rjlzdm8wSEhyd0NWYkR1OHRJQ2M3VGZHSEZVUXc1K1h1MmVKY041?=
 =?utf-8?B?Y3d6ekJqNzNRWWtrZTZGRmViUmNPMmZWcmxGYitsY2pqNm5aMEtFdk5yeG1p?=
 =?utf-8?B?NWx6N0dJSXhzQTgvQkdsblZLbUIrOW1UcktBQ0dnWFFTNUUyVlVsY1J0Z2w5?=
 =?utf-8?B?Q1BxM3FRYjlXWWJuZDJQZk1wdm9NR0pMQkZMUHRLZ25NWGJuaDIxVEZLSW1U?=
 =?utf-8?B?c1JNcmNyeGRLSlpUaU56elUzRGR0QkQ2czV6L3VkdEhPY1Y4RVFoakcrMEt0?=
 =?utf-8?B?cjVhSG1tc1J4Z1RQdGdHYW5GZy92UHZkUTVrT21ON0c0Tmk4am5WMTdsdEYw?=
 =?utf-8?B?RWZXKzRmVGFJcytDeTYrSGhpY3lSY1RZSUNUbXJ4NzIvSDVVeG5MMm56U1VW?=
 =?utf-8?B?SHBQWDFOZUJaeSt5c2JSUkFmc0RXa3YrMVVLNmtwMml2UDlQYmRNSFdLVEpC?=
 =?utf-8?B?QXkxMlYyTThqZVd1empuNWtwRjNCZzZrTGNiR09wVDZoaVR2WWlPbFI0Um5s?=
 =?utf-8?B?QWlXMEg0NzAvUFFncjJLK2lFSFhXbnJNb3NnU1lKYTJZdW9lclU4Z2xTQ1Bv?=
 =?utf-8?B?anVsRHhpS3grdUZVUkgzOTBrbitaRU1sYWtwVnBDRkY2QXdieXRLeXJQN1ZE?=
 =?utf-8?B?ZW9pME1yd214c0lpUjhPY2RnZklBdjhDTUZLclBXOThIL1ZsTTgwVXZRVW9W?=
 =?utf-8?B?VlhZdzQrYysvRzBiaXNZQ0VqMGQwelA1WGVTZFFMOFVaOG5xdFE4U2kvQSt4?=
 =?utf-8?B?UjZVelRQVmcvZFRMY1pPWlN5bUUvWTMvalpZU2dtVEpHTk5Lbyt2OE9KYmMy?=
 =?utf-8?B?dnJGbHdRMXBKYXRQQ2x3TVlNTFg0MENHZG1FMUIwM2tZY3Z3aG1WS0dOQXgz?=
 =?utf-8?B?RDdlbGR2YU95Q3ZmWUJEYmErVWJ5ZFk0TmN3a2NmWHcxY2xJcWdybjY3cEtN?=
 =?utf-8?B?a3FacDgza1VPb1h3RDQ3UUJ6dkFuMXF5akFGeFpOenRqdUtjYzNEYlZTU3h1?=
 =?utf-8?B?Z3Q1RHB5ZWRWOFZiYVNyLzQ0S3BGNHlnV2tvSHBTdUQyZ2Z4OFpvKyszTGZ2?=
 =?utf-8?B?ZEpSRHN3TWlOdWNzemsrRXdLZitZSFhoalhNWXlnYnY4UThxcks3QytMOEtP?=
 =?utf-8?B?d1REVUF2MlVKdGVxY05PN3JNM1hSQVM3WVNKSXhhMlo1UUZuL29jUWQ5N3Bz?=
 =?utf-8?B?OWIveEh6V01RdW53UWYzaElUOXFWU0FrbituaWsyak5jWFk5QW1OUFFuc1hV?=
 =?utf-8?B?UTFlRUZyZGZsRzB1NVVMWmE2K1NQOWxWbE5tU2ZaTExNUTlpUHNvcmlvSWtF?=
 =?utf-8?B?cDJBdWlFWnZXa1JTYVJxKzNVMHFIeFI1a0x1Um9kSTduSVVWelROdUhDS041?=
 =?utf-8?B?NDV0ZXh4OEJlR2dYRHE2QSthS1dFWnYvMUZLVzhZU2w0ZFpNUnJQSGhvWjA3?=
 =?utf-8?B?cFdndEplSmdMQVBmbThaYmdVMW5PUG5xRkowZTBTRktwNmdnby9FNVFHT09T?=
 =?utf-8?B?UHJjOGU0ellnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(13003099007)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEQzM1hhbkZ1S3NxUVNYMFRLOE1pck1nd1VBN0szb3BBY1ZEYmtGOEdUQzM4?=
 =?utf-8?B?QVFEVE5yNkNudjdLTGNNUCttekExWHhhN01LNEN1MFVrRy9RczRWWExyaUNr?=
 =?utf-8?B?eFp4OUZBYWNpTkd2SGtvVFJiU1kxbjc5d1NzTXF6TkZKV3pQOTFCcWxFM0lq?=
 =?utf-8?B?TU43L2lLVkxhVW9CVWpCMWUzWVZTQjR1TUZPblIrOGN4SnE3YzFVSTErQ0JY?=
 =?utf-8?B?aXAzeElZL0dmU0I2RVRuREprRy9yTjd0bWIxdGJXTW5xYWkwV1d3cEhlK0Fn?=
 =?utf-8?B?SStWQVNNZS9xNjlyckx0d21YSU1oSS9Zck0ybml3M0VCVFhxMFdLc016UVVU?=
 =?utf-8?B?TEtCa0hHb0pFelArYWJqWU5DRTdqYVFjZ1UxaE5OUGs5Q0M3VXV0NUhHdFBl?=
 =?utf-8?B?eGFLR3A3Y2oyVmhVV2RHZkxFWTB3bXEvaWRKOXJxejJtbzVlcGhEQ0RYRlpY?=
 =?utf-8?B?dyszQVpQbm9BaFNCVWRCbjV2bUkrbUl2dmtqOWJNcVRROHBETlB3dTFHL0JD?=
 =?utf-8?B?ZE9saytJVWpOMUI3VkNrS21lYkgyMzJ0dUZOU2dtc0ZiRkhxSlFQSEVpa3VQ?=
 =?utf-8?B?RjhubTNKOWlSL0RHVzJYbmk3Qm4rWnE5ZmYvQ3BGSHlkVWJFcWhpazlrUGpq?=
 =?utf-8?B?elpXOVFqV2M1ZUdKbTQ0MHBkZzBnU0JUQU5laS9GOGtFL2loa2lwaVdZT2Fq?=
 =?utf-8?B?L294VDFMeGs4aEZxYklZcDJqc3BXWFlMV1BhR2hsTHl1VDFIWnBGejJ5cnNB?=
 =?utf-8?B?ajR2OFBnczhDQjZCbE9DRWIwVUIwVUZaOGR6dE5sTmxGQmpKR3lrVHp4WmJk?=
 =?utf-8?B?VU5ZbzQ1ZzR5QmF1bVpFSStvTGwwd21SS01ZWFVQQThva2VKWjVKYkh6QWd1?=
 =?utf-8?B?YXFrWmg4aWxYZ1FQYktIYVBoMVk4S1FIZXNjQXpsWW8vQVNMNHYrSVpxNE1j?=
 =?utf-8?B?Y2tVc1pldFFoUHp5YnJsQkFteE16ejB2ckc2d0pMdjl6bVpjY1hzVEZIWm1W?=
 =?utf-8?B?RTY1YklyZEJRQjUzMU1LLytYVHRqL3NkNUY1ZEJyOERLenQxemJmbmRYczhG?=
 =?utf-8?B?Z2ZhcmRpYm41V3JaYTk2dTBiNUlvLzlvQWt3ZThrQzgrRitjMnQ0YjlFb01y?=
 =?utf-8?B?d0pWQXBwMzNmTFNKZytyT1FHaSsvcTdHNmwwSUVzWWlwMi9Mc29oMWpxVWVa?=
 =?utf-8?B?d3U4eHJFMmZCZnUxOStKQjIrdklDbUtiMFBhdkw3OFFPY1kxNVhTM0Qva25o?=
 =?utf-8?B?LzlKNUpwTjZBREYybSszbXpqd1ZwajlvZGdFK0dSdlJNWjk4TnV4LytPa0gx?=
 =?utf-8?B?blpKV2hEK21icFkzU2ZVbTg4b3QrNEJnVjl6VVhmQ0pwbmJGanpvSXkxM2xz?=
 =?utf-8?B?R09BU2FoSXFJQytFUEJxTUxjRFZUdjhDU3JsVmNxNjBseGRsQ1BqdnE3LzBu?=
 =?utf-8?B?bWlXQ1N0MWVWZFFwZFlUT3ZKSU1jV0syK2NTczdiK2FUSVA4VXZ6cnl3VWkr?=
 =?utf-8?B?ejR1OFI1MWRUSjg4c3NnSXZlbmsxbG9DREFjbzNBS1RkN2ZEenJ1YUlJeEt6?=
 =?utf-8?B?dVdoYkVFaGxPWVV0OTJTYW9TMWJrdFJQeSsyUC9UbEw1U2lBMWFmL2JGeTMr?=
 =?utf-8?B?T3o1dUVVMmo5dkhPcVU3RUZxTmh2azBmS09vZkNSUGJnaERIcWdSdHU4MjZC?=
 =?utf-8?B?QndXZDlWR0gxeld2Yk12ejRRV1hqbk92RXhaeXZJRXVrUURsQUI4cWtwbGdt?=
 =?utf-8?B?OVpyUVhYYnlvdzVwd0JXeG1DMktDK0FpQ25HNDhQYll5VnJEQ2RyQTdSZm93?=
 =?utf-8?B?cEFLV2h6cU9KNWRPWm5ENlFGdVh4ZTMrVGVHVjI3bWlEclM0ZHBzMjkwaEsw?=
 =?utf-8?B?SXZkMVVlV2dLd1J0cmZtM0RLUTZZN2hManZyZldaR1Z5RzBRZjhSeFVvQ1JQ?=
 =?utf-8?B?a0F6TlhRM2dVN3pHQW9XUW5JOGRkb3RIM1R5QisrcEdLYWdpQ0habm5uUkNk?=
 =?utf-8?B?ZUJ1d0FRRTEzWElacHB3VmRXTnZ6SzZLbE55MW9zTXIzK0oveGNOa2xwUitP?=
 =?utf-8?B?U2tudUhVQnh3S3p5d0ZQMGlMZGlFNDVNT3lROGUzRmlYYTdKdFk4cTVVRHdi?=
 =?utf-8?B?T2F0RE83WE91a2JpOUJ1Y2I1ZHpBN1BpUmRsNVBSSzByR04vTTlZaUxPNG5J?=
 =?utf-8?Q?ss6jXwl4etWqKDf3CbY67QXnJCEj9+3prc6M9yBfO89y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8122926e-3b73-4e0e-439e-08de22757994
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 05:28:27.8995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cC8uohJzed9MLHfhokRQ+k14PYsZRA6IbzbC4tjpkErublGI+Nca5oqFf+hqfnznqfqSwWixfyJDQJrxnZQZo+cS2gD3jDETs5ODwl88JsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NDI5Lw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFpbHVy
ZXMsIFhlIGNhbm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZy
YS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEphbnVzeiBLcnp5
c3p0b2Zpaw0KU2VudDogMTIgTm92ZW1iZXIgMjAyNSAxODo0MQ0KVG86IEk5MTUtY2ktaW5mcmFA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
ClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2dlbV9sbWVt
X3N3YXBwaW5nOiBSdW4gc21lbS1vb20gaGVscGVyIGxvb3AgaW4gYmFja2dyb3VuZA0KDQpIaSBJ
OTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gV2VkbmVzZGF5LCAxMiBO
b3ZlbWJlciAyMDI1IDEzOjEzOjA5IENFVCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBE
ZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2dlbV9sbWVtX3N3YXBwaW5nOiBSdW4gc21l
bS1vb20gaGVscGVyIGxvb3AgaW4gYmFja2dyb3VuZA0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NDI5Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4g
DQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzg2
MjEgLT4gSUdUUFdfMTQwNDQgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZB
SUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQ
V18xNDA0NCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4g
ICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRv
IGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzE0MDQ0LCBwbGVh
c2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2Rl
LCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVy
bmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTQwNDQvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoNDQgLT4gNDMp
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBBZGRpdGlvbmFsICgx
KTogYmF0LWFkbHMtNiANCj4gICBNaXNzaW5nICAgICgyKTogZmktc25iLTI1MjBtIGJhdC1tdGxw
LTYgDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50
cm9kdWNlZCBpbiBJR1RQV18xNDA0NDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+
ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0
ZXN0QGxpdmVAZXZpY3Q6DQo+ICAgICAtIGZpLWtibC1ndWM6ICAgICAgICAgW1BBU1NdWzFdIC0+
IFtJTkNPTVBMRVRFXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvSUdUXzg2MjEvZmkta2JsLWd1Yy9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGV2
aWN0Lmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xNDA0NC9maS1rYmwtZ3VjL2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZl
QGV2aWN0Lmh0bWwNCg0KTG9va2luZyBhdCByZXN1bHRzIGZyb20gaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZSwgb25lIGNhbiBzZWUgQGV2aWN0IGR5bmFtaWMgc3ViLXN1YnRlc3QgY29tcGxldGVkIHN1
Y2Nlc3NmdWxseSwgdGhlbiBAaHVnZXBhZ2VzIGRpZG4ndCBjb21wbGV0ZS4gIEJ1dCBhbnl3YXks
IHRoYXQncyBvdXQgb2Ygc2NvcGUgb2YgdGhlIGNoYW5nZSB1bmRlciB0aGlzIHByZS1tZXJnZSB0
ZXN0aW5nLCB3aGljaCBtYXkgb25seSBhZmZlY3QgaWd0QGdlbV9sbWVtX3N3YXBwaW5nQHNtZW0t
b29tLCB0aGVuIG5vdCByZWxhdGVkLiAgUGxlYXNlIHVwZGF0ZSBDQkwgZmlsdGVycyBhbmQgcmUt
cmVwb3J0Lg0KDQpUaGFua3MsDQpKYW51c3oNCg0KDQo+IA0KPiAgIA0KPiBLbm93biBpc3N1ZXMN
Cj4gLS0tLS0tLS0tLS0tDQouLi4NCg0KDQo=
