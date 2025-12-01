Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1274DD111A8
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 10:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48AD10E35D;
	Mon,  1 Dec 2025 10:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwp7Rao6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F09B10E35D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764586086; x=1796122086;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Hl8S1vsS6DIkBYbng9nLIjT7ZOFycPhJYiGTUWORzJs=;
 b=Jwp7Rao6oibUyWYd2G2N82XLdNAQuw57GtJGJ0PpEE1cSLMlfRKdqIxm
 40pQQ2g0ZLBfMhEAozL8eT5i5mlXLAATl9GLIyVYUt0hnW4KW7AAGjI1D
 XeODjHWS5I7pi1nCnk9od9wUoMeizZJHaKSEtsdOZFUvwQxVMyf1m6W03
 F2xnLIB5rijcNjsWOrs4HQJs1QRGwk39SNarHEENquoUFaRSiaYAFDc4b
 /j4ulE60OOA+kXeEGAYUC8ffXTA7ErOPifgijO3MLJV7emkJzy0jIk87D
 /XX5GBTEOhnk+1anpab1hfrNHPWWl4uZGIL7+46ydC9l90XnB4XqPRUX4 g==;
X-CSE-ConnectionGUID: yyFLsMSwSLiumLK2DuFqHg==
X-CSE-MsgGUID: TuECwr3gQDO/pBVVAS1PgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70132342"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70132342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:48:06 -0800
X-CSE-ConnectionGUID: cO/kbrE3Sti3r+s17AMPAA==
X-CSE-MsgGUID: jhvirVaOSnGSYUeE/Vr+Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193857655"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:48:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 02:48:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 02:48:05 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 02:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHG2hWwBakwwdgfMp+3cDB15cZOHjqoh7RDDS2YlkKQutK1GxcVMf6K4CkTb/DWvy9OerOiVCpNeCrVVTZOZp/82J/q+QFiGCjolwU2ED/UDimU4TbkhblyLeeGFmzNy59nIRw6+BWOV8C6suBvFUqJQMlpl+BUI6WV0UIloRETMbVpLSn1QvPmjoItrMlu1OdtHTTFL6NotNbBS8zY3LOVTcISwwkaXyn/U4iGwW65kF+pItiwLBiMj6okGms/6DQNvf4scvkbOjU1SxLmvnw/1gqc1/hDUYziYtg89wEM9K8iBtUWn1xI7PDJ/ytMLiqyOzDq6moBL7knaCfO3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl8S1vsS6DIkBYbng9nLIjT7ZOFycPhJYiGTUWORzJs=;
 b=DwQp98O8AktzOEIfJk9mT5g3RbqF5NiNzVPWJx1N0ZLyGzAJseMy4WQkvMALgiBZpHVN0LgwmfJOTI1cqR6jtIVKqIKmCTmhAObw1sqLgfzOijP9J2OzGHOvAs6X4RE09v5zV3d/fk4RdiMmC8sHoU8mHmdb3kYB+Omg+JCo7qj7OeoLj3+3Ul9vdyIxrnR6fTnO0jQ+flDYMoH6HXjtjwO+JY+QAyxS7uWAla7x4aBoxzYi7dVfz7V78SNQAMV5XyFvo2icXePCHdsHKtptnL+nb2JWrTo6JauP6aap0cYaGCUxVPTMg3i1tW9QdNh9eCvzqnAnlM6L8yD2CH3m2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by IA3PR11MB9399.namprd11.prod.outlook.com (2603:10b6:208:577::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:48:03 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 10:48:03 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug
 before running SR-IOV test
Thread-Topic: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug
 before running SR-IOV test
Thread-Index: AQHcYq4NlGQBWSJNH0+Stwad3P81XLUMl9cAgAACJpA=
Date: Mon, 1 Dec 2025 10:48:03 +0000
Message-ID: <BL1PR11MB552592BEAF149985538BC9A084DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201104303.2438191-1-pravalika.gurram@intel.com>
 <58708ef2-0b4d-48cd-ae92-a0e174ee3068@intel.com>
In-Reply-To: <58708ef2-0b4d-48cd-ae92-a0e174ee3068@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|IA3PR11MB9399:EE_
x-ms-office365-filtering-correlation-id: 7830a78b-2c47-404b-00f4-08de30c71aa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QzM5RU04TG1oaStTbWcyWW9ndWdjemg5RTVsVVdld20zWlNSQ0tCNG9nTFZY?=
 =?utf-8?B?aFY1eHZiS1VlNklhU01KdG9PRnVvcTZ3TGtsWXBvK1JIZ2F6bmFIbnlVRUl2?=
 =?utf-8?B?bmhWVGJLR0ZvdTZEVHE0eFNRR3hpak5OYitJMFRvRk1hbFh2aHB6b3JGNm5M?=
 =?utf-8?B?NDZyMzZvbk1ENFJmd1Z5bEJCbDZMemdUVGtyZG9aWDREVStZbE1vaXB6NThP?=
 =?utf-8?B?NkNWOUhHMmlibDZiYzFWWTBvbExUb2tNbnVmUm5WZ0F4ckQ0ME1qTUtpMzhr?=
 =?utf-8?B?dEljVlU1djVoTzh5d0JIVCs0ZWJQWC85a2YzVWxKR3VONXFVOWdTUkVjTEtW?=
 =?utf-8?B?NzNwTStYdE1McTM4VTBsblFoY1V4bFVSNTAyZGtyRkZhRGxjN2gzaUFmeXN0?=
 =?utf-8?B?VVE4UUNTUXZsOHpTWWZlY2xVc3pZVUdtaWZKYi9zbm52UWp2MUh3UnRhRGxK?=
 =?utf-8?B?UUY4NUNKelhSMVVlTzU4YmJ0ZWxrZ3ZnNWNyOUVhNGtuS04wYUhNUnlYRkNk?=
 =?utf-8?B?TjdYQUJGWTlQeXhRdjkzanZ0SHpLRGQvOWoxQlYwaTdLdlZ2cEx6UDJtWFhX?=
 =?utf-8?B?cTRYTVd1Qlk5ZXlaOWp5WTk3Y3l1VUIwekZrMkhlWnNjQ3YyMk50R2JCdXg4?=
 =?utf-8?B?eEhqYjB0b1pjbmQzbC9wcjFnZTRnZVc3VjBYdUVBYlNBb1k0MjFnUFZOUU1H?=
 =?utf-8?B?KzRHaGRoVWZYV21PK2pFZnh3Nm15eGwwUVRFb0ZEcFo0dDVDb203K0p4ZEoz?=
 =?utf-8?B?d2U1eXlvZ0ZKMDFRa2llQzA2RzNrYmFoSG1XNkp1bzVXZXFiSEgvc3hQeWR3?=
 =?utf-8?B?R2Q5bGFVUWQxcCtDMTVLSXNjWnhWNk5rN1owTStTcHRUZ0JaU3RrNkFyUUR1?=
 =?utf-8?B?TUdtdGFRSVZ4aWI5cDFxSEpMTzlBRTl3UWlqektDbWdFVGxGQ2IrM01Fem1j?=
 =?utf-8?B?V3pwTDlLdUlHNmE4WlNuQlRUQ0pQYWlTZ3o2aUkrVnF1OTJTZjRCdE11Y0ZN?=
 =?utf-8?B?RmNMd2lNQ0FGenFMZDh3cE1KUlh3WlhoM2xIREFPNllSRzY3NUNWNVhVQVVs?=
 =?utf-8?B?OXc5bklhUjJHeC9NY2o4bFVrY1ZRR2ErdTM3WUo4VzdDOWNLNlZsWTcvR1ZV?=
 =?utf-8?B?VVlpeldRVk9BWDJ0RWcyNC9acHFGcmplSG9Da09PT3E3N3owRDlYMFlYOXBi?=
 =?utf-8?B?NHN5di9VVWNRT2tCK3RpNTZmdlBOWnh0U1U0V3NyVThMRW1vaTRVKy9wMEdQ?=
 =?utf-8?B?NVBYc3g5aFNYNzI2cUd0cjdFRVdsM0JwRVFFMERRWlIxV0dDbkEwaHVhbDEz?=
 =?utf-8?B?Z0p2U1V1K0l6VEZEMFlyTDVDUVdmL2pQUkRJcVZiYjJkR3VGcFMrWWJ4SUNF?=
 =?utf-8?B?SG56eFVnSWgvOEtHNUxzTCtROVZzalFPTE4vUW4wVGVtdFYwQmM5Nkt5OG9W?=
 =?utf-8?B?ZTR2WUN3UlNYTUtwWXlhN0t1TmZrenBmU29KYktTUzZXT2Vjb0hNYlkyQVVM?=
 =?utf-8?B?K2ZKeVU1NUswNUY3TGVHbnp4a0w3TDIvSkFQU003aTFzOTBSRGtJdWd4SkZO?=
 =?utf-8?B?alZmM0JBUDNNL0VmRVpQdEo5RUE4UnVwT3ltQzlBQ05QOU5DQlRFbjMwZ2Vl?=
 =?utf-8?B?OGM4R0tqbWVPSzhNOVlZRmdFSHFTeEcweWUvVENudkhkWU1pb0dwMWp0Wk5v?=
 =?utf-8?B?TW1xVitjb3lvRWFKMy9QZTRmdG54cEdkLytRM2hid3VyMmVDa01JYmMwUVFj?=
 =?utf-8?B?dHhTL0NBRFhERTdscWdjOWhEWlNWQmhaMzVmNHZua3VSMWk5WGdDdDFZVzI2?=
 =?utf-8?B?NlA5THA2bzBCbDdKUVBuSmJyblQ5REpZYzZnSWhnTzhqdUJMSkxYUUxNSmh6?=
 =?utf-8?B?OWxxbURsTWdLNk9uS2FkWEpxZnRMUDIwd1NSYkhySVh4ZTdNNmI2OFNhYkVQ?=
 =?utf-8?B?UmtBK1g1a21GOW9Qa0kxb28vQlFRV3dVZEtvQnFCclBjQThFYVJnY0k0SXl6?=
 =?utf-8?B?ZEhrWjc4ZTdTU3dscXJRZG1uTjhNLzV3anJSQ1d4SmxtTTBHOC91b2c0Yzlp?=
 =?utf-8?Q?THlGuk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVNKS3F2SnVQaG5teERYRjI0dlIrZDErRzIwdUFWOHJRdlk1TjJZcFZOQUlw?=
 =?utf-8?B?UjVGdWRla0R6UDN5SllpMVlqWlRZVFRKNDdzZVVCQWNXeUh1SSsrbFlpUmNq?=
 =?utf-8?B?bFVjRkNERzV5dkdiSjhRcmlnZ0JvZTBjRlE3WjBsZ1AwazRyU0JIWTJlejNx?=
 =?utf-8?B?eXYzdjV0bHBkZ3hwTkxyQ013Ny9UOFVDRUF0QVJ2dXcwSWpOcERPTkUycGwr?=
 =?utf-8?B?MkpONkJaWlhlS0lpWjc0cVlMQnQ0UGQzWHhwUFA1TVFZVFFCUXE4SzJCQXd6?=
 =?utf-8?B?Um82OURMZ2JzVk5vekFwcEFtc3ZlbDVYS0VpbWcyZWIvMXhVMGRGRDRYa21l?=
 =?utf-8?B?ZjJMUjRkT3Jqb2VVQ3drVVRFbnVQOHFQUTJKWW9sNUdtNzhUc2RJajlxd3ZM?=
 =?utf-8?B?VWRGRmV4UkM1Q2VnM2VnOS82QnNrNGl0YkNPUVJZY2txa0NPTm9rQUpsYW12?=
 =?utf-8?B?RVAyclJ1aXcxSVdPL0VvWXE2anRiZ3RaYzQrQ3dDUTV5WHZSNjNqTktNZkFW?=
 =?utf-8?B?SDFTUUdKOVJ0enpzQzdrR2UxWGtPejcyamhMVTVQOUdiM20xeURvMkVodUJj?=
 =?utf-8?B?ZFJxS1BFTkRGNkZpaXFqTndMbWlxQ0h4QkJHWi96VERJbHNaWTE5QUhROU1G?=
 =?utf-8?B?dGZhZXJYRmd0bzI3Y2JIOUlsd1hVcWIzaG9Fd1dQNndyUUdwZGNrZWI2QXdJ?=
 =?utf-8?B?ZTZCblhJVElvNm9jdWt1TFFWZS9QZTI0ZEIxZXBIWGtKQzJ1UkE5VWVQaGRt?=
 =?utf-8?B?c3h5UEYvR0laRHJ4YlREOXZPRDg2NStreDduNHZIaXpCd1RCY0pMQlRUbmlw?=
 =?utf-8?B?cFpOdmtGcElUYjdKRHVnUEhhUVNiT1l5eHJHZlV2MVk5SVFjOWhuVGZOQjlC?=
 =?utf-8?B?bWxXRGxKd1dQZm9tTUNYRjNWdnZGTFVoeUJwTVpuYU54QTJlNitNWjh6UmJL?=
 =?utf-8?B?cHppU2FjdkRrZy9TOGVVRllLaUEzYnBaVlpRY3ZBTEs0SEdMdkpramxnN0Y2?=
 =?utf-8?B?MmlPYzAwOXFzMGpJeXlEalJXU3dIc3UvWHBFT3FGcnFwNTl2YmdRZkM5RmxF?=
 =?utf-8?B?aUhLenlnc0l3T0YzL1cvZnc0WFV4OVZOclFEYXdqVnBhUzlrV3ZhZVIyWGtl?=
 =?utf-8?B?cmdwTExQdmQ4ZXlkTHg4UGk4QzBoNjFaVGxTZTJOWVI5UDN4Mm84ay9IQS92?=
 =?utf-8?B?YXB4NXNsdlNwb0FHZEMzdi9WUXZoVEpJRUl6aGNONUFWbTJMblRFSkNEZUdC?=
 =?utf-8?B?NG02YU9Vc3ZMRXZMT0w3VlFpWnltZnVHZnZVK0lVQW1OZzZjUkYxc2ZtU0NW?=
 =?utf-8?B?TlNneENwY3ZFaWFOM1MxTDlvVHNKbjNJRi90cURFVnZEOXNHZlBqSmx4WjB2?=
 =?utf-8?B?THVkdHdLRkp1d1dhMFF5RWJiV0RJMk5xTDV3bXFPTlJxU2VxcVUvQkdSbmZL?=
 =?utf-8?B?dm14NHJ4Ui92V3lvZ0ptS2Zuai85akFoNjNYZGhSOTlnelhCYmtCdzdTemVC?=
 =?utf-8?B?emo3dGpoNUVEUkozZjZOSkFxcXp5UVkrTG5pUkc1eXpvZDREUXlUeFAzcnZi?=
 =?utf-8?B?ZjgvWlFMMkhBbHRhU2RWSmNVSDREaWZpb09rK0FNNHNCL2N4WUQwSDdpMkJE?=
 =?utf-8?B?K3kvcGVGWkZXbWlvU3Z4VHBtcmx4Vm1aaGZJNVltck9vUXVaVW10eXVVVW9w?=
 =?utf-8?B?QjZmeHBiemVXUUkyc1l2RlE0R2swcmNFYkxxdzdmMjN3cS9hMlZ3RlduZ09w?=
 =?utf-8?B?ZHJPeFRyazd2aVZ3bzVlYVpMWFR1b2paOUtlQU1vSzZvQitPVVhiUHFZN0k2?=
 =?utf-8?B?WUx5TUJvdVFLK1haNnZaZm92NXBzQXdtSTROZGZBY29uRDQzVmpFU2F4UFNB?=
 =?utf-8?B?TUMyS1IrUlJpcDlyUkRNKzJaWEp2M3k1OWxrMDZJcWxwcElLVjUxWWphVUtT?=
 =?utf-8?B?ejk5b3A3LzZTSzNQM2lJR05sVDlmem9GVXJMc2x5Z0JabmFseTV2MXg1TDJU?=
 =?utf-8?B?dWlOVGFkVjlybllQNlV6L0U3S3BFYkErMmVJN3V4djVoWm81OGxuTCt0Y2Vl?=
 =?utf-8?B?T1lpWkFYSDZ2ckg0SjBJSGkvOFNpS2xWcGcxb09YYzd0OXI4SnhxbVNEYURZ?=
 =?utf-8?Q?Ig8EotWVh0BXL/SOSi6aYdKPa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7830a78b-2c47-404b-00f4-08de30c71aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 10:48:03.6433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TkwcElulio1qm7mKpbnrVxUuwIwTfE6ueXviDQ23zWjJpcgOmIXXodOpZ/IdpsZQoN5IFsyL3JtTZj7A1l0Wks4UIe7TnSPWVWaq2OLXStg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9399
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSyBWIFAsIFNhdHlhbmFy
YXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEsIDIwMjUgNDowOCBQTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlr
YS5ndXJyYW1AaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsL3hlX3NyaW92KjogRm9yY2Ug
ZGlzYWJsZSBFVSBkZWJ1Zw0KPiBiZWZvcmUgcnVubmluZyBTUi1JT1YgdGVzdA0KPiANCj4gDQo+
IE9uIDAxLURlYy0yNSA0OjEzIFBNLCBQcmF2YWxpa2EgR3VycmFtIHdyb3RlOg0KPiA+IEVVIGRl
YnVnIGFuZCBTUi1JT1YgY2Fubm90IGJlIGVuYWJsZWQgdG9nZXRoZXIuDQo+ID4gRmFpbGVkIEVV
IGRlYnVnIHRlc3RzIG1heSBsZWF2ZSB0aGUgZmVhdHVyZSBlbmFibGVkLCBibG9ja2luZyBTUi1J
T1YNCj4gPiB0ZXN0cy4gRXhwbGljaXRseSBkaXNhYmxlIEVVIGRlYnVnIHRvIGVuc3VyZSBjbGVh
biBzdGF0ZSBiZWZvcmUNCj4gPiBydW5uaW5nIFNSLUlPViB0ZXN0Lg0KPiANCj4gQ2FuIHdlIGlt
cHJvdmUgZXJyb3IgaGFuZGxpbmcgaW4gRVUgZGVidWcgdGVzdHMgdGhhbiBkaXNhYmxpbmcgRVUg
ZGVidWcgaW4NCj4gU1JJT1YgdGVzdHM/DQo+IA0KPiAtU2F0eWEuDQpldWRlYnVnIHRlc3RzIGFy
ZSBhbHJlYWR5IGRpc2FibGluZyB0aGUgc3RhdGUgIGluIHRoZSBmaXh0dXJlLCBidXQgdGhlcmUg
YXJlIA0KQSBmZXcgY29ybmVyIGNhc2VzIHdoZXJlIEVVIGRlYnVnIHRlc3QgY2FzZXMgYXJlIGZh
aWxpbmcsIGFuZCB0aGUgc3RhdGUgaXMgbm90IA0KR2V0dGluZyBkaXNhYmxlZCwgd2hpY2ggaXMg
bGVhZGluZyB0byBzcmlvdiB0ZXN0IGZhaWx1cmUuIGhlbmNlLCBhZGRlZCB0aGlzIGNoZWNrIGlu
IFNSLUlPViBhbHNvLg0KDQotUHJhdmFsaWthDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFByYXZh
bGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAg
dGVzdHMvaW50ZWwveGVfc3Jpb3ZfYXV0b19wcm92aXNpb25pbmcuYyB8IDIgKysNCj4gPiAgIHRl
c3RzL2ludGVsL3hlX3NyaW92X2Zsci5jICAgICAgICAgICAgICAgfCAyICsrDQo+ID4gICB0ZXN0
cy9pbnRlbC94ZV9zcmlvdl9zY2hlZHVsaW5nLmMgICAgICAgIHwgMiArKw0KPiA+ICAgdGVzdHMv
aW50ZWwveGVfc3Jpb3ZfdnJhbS5jICAgICAgICAgICAgICB8IDIgKysNCj4gPiAgIHRlc3RzL3Ny
aW92X2Jhc2ljLmMgICAgICAgICAgICAgICAgICAgICAgfCAyICsrDQo+ID4gICA1IGZpbGVzIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC94ZV9zcmlvdl9hdXRvX3Byb3Zpc2lvbmluZy5jDQo+ID4gYi90ZXN0cy9pbnRlbC94ZV9zcmlv
dl9hdXRvX3Byb3Zpc2lvbmluZy5jDQo+ID4gaW5kZXggNDUxYzNjNWNhLi5jMGQwMzhhZmEgMTAw
NjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfYXV0b19wcm92aXNpb25pbmcuYw0K
PiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3NyaW92X2F1dG9fcHJvdmlzaW9uaW5nLmMNCj4gPiBA
QCAtMTIsNiArMTIsNyBAQA0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3NyaW92X2RlYnVnZnMuaCIN
Cj4gPiAgICNpbmNsdWRlICJ4ZS94ZV9zcmlvdl9wcm92aXNpb25pbmcuaCINCj4gPiAgICNpbmNs
dWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiA+ICsjaW5jbHVkZSAieGUveGVfZXVkZWJ1Zy5oIg0KPiA+
DQo+ID4gICAvKioNCj4gPiAgICAqIFRFU1Q6IHhlX3NyaW92X2F1dG9fcHJvdmlzaW9uaW5nDQo+
ID4gQEAgLTMzMyw2ICszMzQsNyBAQCBpZ3RfbWFpbl9hcmdzKCIiLCBsb25nX29wdHMsIGhlbHBf
c3RyLA0KPiBvcHRzX2hhbmRsZXIsIE5VTEwpDQo+ID4gICAJCWludCByZXQ7DQo+ID4NCj4gPiAg
IAkJcGZfZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiArCQl4ZV9ldWRlYnVn
X2VuYWJsZShwZl9mZCwgZmFsc2UpOw0KPiA+ICAgCQlpZ3RfcmVxdWlyZShpZ3Rfc3Jpb3ZfaXNf
cGYocGZfZmQpKTsNCj4gPiAgIAkJaWd0X3JlcXVpcmUoaWd0X3NyaW92X2dldF9lbmFibGVkX3Zm
cyhwZl9mZCkgPT0gMCk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3Jp
b3ZfZmxyLmMgYi90ZXN0cy9pbnRlbC94ZV9zcmlvdl9mbHIuYw0KPiA+IGluZGV4IDNlNTgzNTQ4
Ny4uZDc0ZDJlNDg2IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3NyaW92X2Zsci5j
DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfZmxyLmMNCj4gPiBAQCAtMTcsNiArMTcs
NyBAQA0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4gICAjaW5jbHVkZSAieGUv
eGVfc3Jpb3ZfcHJvdmlzaW9uaW5nLmgiDQo+ID4gICAjaW5jbHVkZSAieGUveGVfc3Jpb3ZfZGVi
dWdmcy5oIg0KPiA+ICsjaW5jbHVkZSAieGUveGVfZXVkZWJ1Zy5oIg0KPiA+DQo+ID4gICAvKioN
Cj4gPiAgICAqIFRFU1Q6IHhlX3NyaW92X2Zscg0KPiA+IEBAIC0xMDMwLDYgKzEwMzEsNyBAQCBp
Z3RfbWFpbg0KPiA+DQo+ID4gICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAgCQlwZl9mZCA9IGRybV9v
cGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiA+ICsJCXhlX2V1ZGVidWdfZW5hYmxlKHBmX2ZkLCBm
YWxzZSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9pc19wZihwZl9mZCkpOw0KPiA+
ICAgCQlpZ3RfcmVxdWlyZShpZ3Rfc3Jpb3ZfZ2V0X2VuYWJsZWRfdmZzKHBmX2ZkKSA9PSAwKTsN
Cj4gPiAgIAkJYXV0b3Byb2JlID0gaWd0X3NyaW92X2lzX2RyaXZlcl9hdXRvcHJvYmVfZW5hYmxl
ZChwZl9mZCk7DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3NyaW92X3NjaGVkdWxp
bmcuYw0KPiA+IGIvdGVzdHMvaW50ZWwveGVfc3Jpb3Zfc2NoZWR1bGluZy5jDQo+ID4gaW5kZXgg
NWU4Yzg3NzU1Li5hYjI1MzgzZTIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3Jp
b3Zfc2NoZWR1bGluZy5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfc3Jpb3Zfc2NoZWR1bGlu
Zy5jDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEANCj4gPiAgICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5o
Ig0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3NwaW4uaCINCj4gPiAgICNpbmNsdWRlICJ4ZS94ZV9z
cmlvdl9wcm92aXNpb25pbmcuaCINCj4gPiArI2luY2x1ZGUgInhlL3hlX2V1ZGVidWcuaCINCj4g
Pg0KPiA+ICAgLyoqDQo+ID4gICAgKiBURVNUOiBUZXN0cyBmb3IgU1ItSU9WIHNjaGVkdWxpbmcg
cGFyYW1ldGVycy4NCj4gPiBAQCAtODkxLDYgKzg5Miw3IEBAIGlndF9tYWluX2FyZ3MoIiIsIGxv
bmdfb3B0cywgaGVscF9zdHIsDQo+ID4gc3VibV9vcHRzX2hhbmRsZXIsIE5VTEwpDQo+ID4NCj4g
PiAgIAlpZ3RfZml4dHVyZSB7DQo+ID4gICAJCXBmX2ZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZF
Ul9YRSk7DQo+ID4gKwkJeGVfZXVkZWJ1Z19lbmFibGUocGZfZmQsIGZhbHNlKTsNCj4gPiAgIAkJ
aWd0X3JlcXVpcmUoaWd0X3NyaW92X2lzX3BmKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1aXJl
KGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMocGZfZmQpID09IDApOw0KPiA+ICAgCQlhdXRvcHJv
YmUgPSBpZ3Rfc3Jpb3ZfaXNfZHJpdmVyX2F1dG9wcm9iZV9lbmFibGVkKHBmX2ZkKTsNCj4gPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfdnJhbS5jIGIvdGVzdHMvaW50ZWwveGVf
c3Jpb3ZfdnJhbS5jDQo+ID4gaW5kZXggNmMzYzhlMDMxLi44ZTFhYTJlMDQgMTAwNjQ0DQo+ID4g
LS0tIGEvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfdnJhbS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwv
eGVfc3Jpb3ZfdnJhbS5jDQo+ID4gQEAgLTksNiArOSw3IEBADQo+ID4gICAjaW5jbHVkZSAiaW50
ZWxfdnJhbS5oIg0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3NyaW92X3Byb3Zpc2lvbmluZy5oIg0K
PiA+ICAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4gKyNpbmNsdWRlICJ4ZS94ZV9ldWRl
YnVnLmgiDQo+ID4NCj4gPiAgIC8qKg0KPiA+ICAgICogVEVTVDogeGVfc3Jpb3ZfdnJhbQ0KPiA+
IEBAIC0zNDYsNiArMzQ3LDcgQEAgaWd0X21haW5fYXJncygiIiwgbG9uZ19vcHRzLCBoZWxwX3N0
ciwNCj4gPiBvcHRzX2hhbmRsZXIsIE5VTEwpDQo+ID4NCj4gPiAgIAlpZ3RfZml4dHVyZSB7DQo+
ID4gICAJCXBmX2ZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwkJeGVfZXVk
ZWJ1Z19lbmFibGUocGZfZmQsIGZhbHNlKTsNCj4gPiAgIAkJaWd0X3JlcXVpcmUoeGVfaGFzX3Zy
YW0ocGZfZmQpKTsNCj4gPiAgIAkJaWd0X3JlcXVpcmUoaWd0X3NyaW92X2lzX3BmKHBmX2ZkKSk7
DQo+ID4gICAJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMocGZfZmQpID09
IDApOyBkaWZmIC0tZ2l0DQo+ID4gYS90ZXN0cy9zcmlvdl9iYXNpYy5jIGIvdGVzdHMvc3Jpb3Zf
YmFzaWMuYyBpbmRleCAzNmJjYTQxNDkuLjBhNDM4MTg5Ng0KPiA+IDEwMDY0NA0KPiA+IC0tLSBh
L3Rlc3RzL3NyaW92X2Jhc2ljLmMNCj4gPiArKysgYi90ZXN0cy9zcmlvdl9iYXNpYy5jDQo+ID4g
QEAgLTYsNiArNiw3IEBADQo+ID4gICAjaW5jbHVkZSAiZHJtdGVzdC5oIg0KPiA+ICAgI2luY2x1
ZGUgImlndF9jb3JlLmgiDQo+ID4gICAjaW5jbHVkZSAiaWd0X3NyaW92X2RldmljZS5oIg0KPiA+
ICsjaW5jbHVkZSAieGUveGVfZXVkZWJ1Zy5oIg0KPiA+DQo+ID4gICBJR1RfVEVTVF9ERVNDUklQ
VElPTigiQmFzaWMgdGVzdHMgZm9yIGVuYWJsaW5nIFNSLUlPViBWaXJ0dWFsDQo+ID4gRnVuY3Rp
b25zIik7DQo+ID4NCj4gPiBAQCAtMTI1LDYgKzEyNiw3IEBAIGlndF9tYWluDQo+ID4NCj4gPiAg
IAlpZ3RfZml4dHVyZSB7DQo+ID4gICAJCXBmX2ZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9B
TlkpOw0KPiA+ICsJCXhlX2V1ZGVidWdfZW5hYmxlKHBmX2ZkLCBmYWxzZSk7DQo+ID4gICAJCWln
dF9yZXF1aXJlKGlndF9zcmlvdl9pc19wZihwZl9mZCkpOw0KPiA+ICAgCQlpZ3RfcmVxdWlyZShp
Z3Rfc3Jpb3ZfdmZzX3N1cHBvcnRlZChwZl9mZCkpOw0KPiA+ICAgCQlpZ3RfcmVxdWlyZShpZ3Rf
c3Jpb3ZfZ2V0X2VuYWJsZWRfdmZzKHBmX2ZkKSA9PSAwKTsNCg==
