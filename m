Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2FD73E84
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 19:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5410E33D;
	Thu, 29 Jan 2026 19:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMn6RAMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B8C10E2AB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769714810; x=1801250810;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZpoucOQ6vVcZ46f123T7QaqsA1U/bXDZrAi7UQbXeYo=;
 b=JMn6RAMhpbpH2tD44jl0d+5vvdO7Gm94b/rY1qcZSTSAHSg45KJaRQuG
 ZOhop5Rz7hy5F+51R3w1M/cpEkjhGR7TMi1MXFOWzG+DHMw/rBkhUDMBs
 oI6UhWLDEYRrRlmOnoQCih5iOIQ3kCe8aIx9aHzy1MzgPdNTLjrpZifJJ
 QjH5f+ZiGdrWC+ttAgnsXEbE48/T0A/LTHeBauAk+7jA5Guje1C5BnMXa
 BnF5FZygD8mBlJs+Gowl+d/NO7Il/UAlJAkVMimP+VQ0b4dkcoTI+ZHNT
 1Dd24f1llZm86oytHs2EN3UwQIVDw/5tNevVUM86rS4nn48hr04VhxrLb w==;
X-CSE-ConnectionGUID: N9wSAEzhS6iW5vxTpFcx8A==
X-CSE-MsgGUID: mOnvQEttQ02LGE5mK3srxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74830319"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="74830319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:26:50 -0800
X-CSE-ConnectionGUID: gDi+Hsw2Rki+3HLT8Liepw==
X-CSE-MsgGUID: x6+yUlJgR5i5HUvHAyXfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239906792"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:26:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:26:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 11:26:49 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:26:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSa23G3C9a9CDOBRxJh0rkVJ7MlHGHJDydNfSiUJ/iM6M4UBUE+7UEQO4HwxHc9dVxMHYU+LsLwSgxpvqH5ULgESDD3WI7qePN4XYrwJY6Y4wPTI2Tje5OCMpBJAdbLaR1hX81eqzkkl1X7d3rMzpma44LD0GqU9CH6TQdMOulKQ4yWvc+6RkgrU2DY/FuOSQ9KWum3n9Cy07bVEVRxQII7KlkK9eX9j1N5I97llnOYocAUUb1fgGxCmKiNGyJx6Dt+zjrxpeS6F1ewgxwC4h/k9wC7RdSP+yZA+JO1Ms5jVH968/XFe+GdqCq3noE6amxcGf+LAPAvfTkOfqB8pMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJUAaUctZtVV1SHTA9gX9aFsOMeATFo20WzSueMtWho=;
 b=Q4EGKbIGaj88/8bHNbPYAwgyRx1aO03c4ibC9BYu4tB6mMgPD/JSQ77XxCUbgU2sRfixDanBWZSOnA0QcH2HkRgX1QoEjvmK+BkZd+7hRReCwm1J+C66o2cvlhjNQg7Jr8VWHxeDrbdlV2G7xgfoq+S/z7eTANtvyRoftOi1LpiX2V4N5bewJUptNm/Fw2Ya2DLeThsZyHfJVJkXzmzATw5lV3qltw9tv2YzrFlK0Hll6sH1whoXytN07SP6v2c5f4lk7Ike/UUsBsVoBQI+uIQrINixIRYul/n8daEW/hhp3IWiyLYrvm8DJLYSAYSG9i3tvSgjrPfYXsJl7wuJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 19:26:46 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 19:26:46 +0000
Message-ID: <71d5d776-989f-4906-9500-94dbb7446211@intel.com>
Date: Thu, 29 Jan 2026 11:26:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
To: <igt-dev@lists.freedesktop.org>
References: <20260129003146.340181-1-jia.yao@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260129003146.340181-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf229af-b1f3-43b2-014c-08de5f6c57b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTJhT0g1SGEvTmp0aXZaMXBHaVZScllFOFFkRVFHV3NRTzVQRTJwS0o1RWV2?=
 =?utf-8?B?WWQrZmNBeTE1SzN4Zm1od0tIUkJhTFFPZTRWU1NRMys4NVZ5UlpNRFRjYzc1?=
 =?utf-8?B?cFN1cnQvamhjcWxrWnN1SklDVitQMkt1bmttejFzdkRZRDViK2dUamdWM0Rr?=
 =?utf-8?B?azFndExXT2FXU201LzlwK3dpZHZub0xqWGk0YTVvZTQySWQzQzNzZEhqUmdK?=
 =?utf-8?B?a2VUU1JhSUR0YXoyNnFBenFodnVCZjVTMzVtYytyNWF1M3FMSyt0SEF1TGFa?=
 =?utf-8?B?V1NhWEkzMTZzNW90bkRFUCtLbTZDZkxpSk9ZVVBXREZnNUkvUnN4MzJNYlU1?=
 =?utf-8?B?a2xyUVhDMGVIQ0V0VXM1alRjUWZLaDBpWXIwQ05YQVhrUWdneFEvK2ZqWjlH?=
 =?utf-8?B?amo3elJROUtrZmNxUlpMTFBIdzY4dnI3VjNiZ2NoWG5VZ0t4cjVKOFR4YWI0?=
 =?utf-8?B?RmJpQ1N3cTRIblJkQjlYcGl5VHVNZUN5WklROWp1ZERwRG1sMmFDem9mT3FY?=
 =?utf-8?B?ZHM5N3BvOU1nT1BTMnpMVC9BTlBrMFhrSDJIU2dTd0tqNmVtMG9mRXZuYUtJ?=
 =?utf-8?B?NENpYkNQMnlpL082K0VoOGVFK0VxckNqMExkMk9sNmxsQkFJcGgzN1NSQXBr?=
 =?utf-8?B?Y2txYjhrZGFPamVoS1hZTW5QdEl3bVI1TXhBc2EwdWFtdmtaOTg4U25HYWRq?=
 =?utf-8?B?ZmsrTmtSRHdMc2ZidTBLZXU3RWpDeCtzY0xWU0loK3Rzd1oxbGtaSDdmOGs2?=
 =?utf-8?B?Z0NjNE9iakppUVQ3c0pJZnlyRVFTanpONllLT2NKY29qRUJRSEFjcG1KUFJq?=
 =?utf-8?B?N3MyWE1tRmhyenZnZm11bkRVcGtwMEwydk9DRkt4b2FZUDBTdktoN0hqUldi?=
 =?utf-8?B?eDM4Mk1VL1dxMHQxVkVFdDl1c1ZicXRZWGZlTkszNUxTb2RFc0YrNkVvdEJO?=
 =?utf-8?B?bnhsbCtRMGNzS0FWUnh1Z2gwdGpTa2NpYTJBekpra3Ntano1cENhZHp4K3Ur?=
 =?utf-8?B?UHlPZnFRaTBFbnFCSmdlb0FLb2t2NktlUGRMSml4bzB1TG9mRytCeS9HVjgy?=
 =?utf-8?B?ZFV3WnZZMUlhTEpkK0tBSlAzd0NMZ0l3YjBFdDE0ZStDOFMxK1JjTDVEeTZG?=
 =?utf-8?B?Y3E0U2crRDl4ZUVzUkhmUC8vV2k1eEJGNVZTSklWU09BRHNVVSthMEU5c25N?=
 =?utf-8?B?a0d1dXREWEhUaHBTVk1iN0IrazRHZW41T3d5MXdIK01KTFVJZFdxdlMweXJp?=
 =?utf-8?B?NEc4dnN2YnJhSTdWTElEM2VmY3pNR2VoYnFRK3BKd2VBZFAxazJxeDNmeUI0?=
 =?utf-8?B?SStTZHN5MVN1VUk3VDI0Y3ZNMG9FMm9GdnBZYmRDTVNiOWdFb0xBSVFybnk3?=
 =?utf-8?B?QXV6ZHpYMXJvalpod0FacjNIY3VBUDhBc3g2UUhkWFU1T2R5V0Y2ZEJxZjBR?=
 =?utf-8?B?TWVZL3k4SURrdXYzbEhxNzZ4bUJCcGhkSVM3VDJiUHhUTTR2M0diQVVITUVn?=
 =?utf-8?B?SkxRai9aMWxZb0QxbnhUQUdIS2o3Y0VDUGtheHdzdElFejU2bUxtV3EyczFX?=
 =?utf-8?B?RHJNTGJDUUNxNXovNWMrVyt5bFZKZXlTNXFwWmFjNjVrUkVSVlQ1NEJnRmRJ?=
 =?utf-8?B?T3NOU25XK1gzaTVJMVRkd3pJYlZOSjUvaEUrRWNpbklCZGRVbDZwL3EvMWJm?=
 =?utf-8?B?c0k0MEM4WUd1eW05V0RHc2prRGJORzJnU3pIMm45ZHFvWmtlUjRMM0I1dmZw?=
 =?utf-8?B?NUpWTGIxd2JFNXY1QWtLc1VnOWFCNklQMVA4QVdtbkNGRUlJU1h4Q2s4QUcy?=
 =?utf-8?B?QitvVmxRVXFKY21wSzd0NFFUWVFOVnRlRWJQOFk5c3dWVGVZUGQ4c1ltblVh?=
 =?utf-8?B?VmlMUTZzczR2M3prQ05sUVBJbVd5VnpGaEJtWVZ2bDZQTEJwaGovemZJUEFO?=
 =?utf-8?B?cmJzYUJhTzB1Nk54My9UTmEzZHRBcm1PZmQ2V1VWWitlNWw3Z0d5bUo0U1VI?=
 =?utf-8?B?SUw3YSs2a3h1ZHM0ZzJUTlRzYVFXUVFmdTJJdzVNVkNNZUw4bmR5RjJ5dDlL?=
 =?utf-8?B?TmU3TUt3TUhudlRrM0NlaXI3SEFBYTE3ZStxSTNxUzFEcXk2WDQ3UVppL21G?=
 =?utf-8?Q?lrUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZndHRTYlJWZEVpU1dLNWRja3Z6VzRTZExlcWdDZVRqM2tCbFF2c00rNjg5?=
 =?utf-8?B?MzB1SUtiRkg4aUU1Mm95bjhacXlhL0tBaitvbHdtWjJpeW02ZDRBa3UrdUl4?=
 =?utf-8?B?M0tkV2tVNTc0K1kwR1hGeFo5Y0swdkQrQmFvUlpySDE3TE9OdElkY2h6MGNG?=
 =?utf-8?B?SUZta1hBR3FEWm0yL0k2Z3pOZG9UdmVLRDlEVXcyUnRSOFoxYTV0b1lENTlm?=
 =?utf-8?B?dzAvTHkwL0lWaWhRKzhqaEhXNVR2RlRMeVMrL3krTUJ0dlM2clZNRFJiaUd4?=
 =?utf-8?B?dUZLbEs4T2xaRFpYYVc4TTlOSjdHSGRMQ2xZb1ErdEdJdDFLUmhQNXJQNEh4?=
 =?utf-8?B?WjhBdG12aFNYQnI1QlJadEN3OEcvT25ZalpDaHNrd2JGbFdLcmtVYTlzNldL?=
 =?utf-8?B?Z0pHOHZaSnBOZFllMmY2SGpEVkpsNG9aRFVNUjlYcERZbUlLanNyU3oxM0FP?=
 =?utf-8?B?RXN0Zm1LTXRRSkJnNGJBcTlQSGp3cFRXYmluMWxnSGRyNjhRSVJ3emFIVUVs?=
 =?utf-8?B?bU90NGRDTGVKY2lvblhoYkVwK0NuUkwrdkJRWllNUHNsNEFRNkt3TWp1WWk0?=
 =?utf-8?B?YzZOazBjRXhZczBReTNzTHg1ZmV0enRrUy9yb0ZlL1EzUmhpbkhHMkRGb3lZ?=
 =?utf-8?B?WkNVa3lLb2pnV3c5anpzSmM3bFNxaUZHNkRpQU9uaVZ6YXJyb3FXVUVXOXhr?=
 =?utf-8?B?VHhoQktOSkh4R21RSmZrRnJnVmJWUFcrSlVPbnBHZEdaWmZKZlVvV0xRVnBs?=
 =?utf-8?B?RGIxc2R2SFAzai8zN1dUbXVWajBDRHFEU05MR0kxQ3orVFcyZFg4TFp0VVJQ?=
 =?utf-8?B?bU5uaXkyVnl0cFFwaHVDY3ZKamJIOEdrV2NBZ2ZkNFpFT0Flb21ubFR3dERr?=
 =?utf-8?B?VVhUV1lVQWRaN1ltSjVqYStqcHBzN3ZwYXNwbHJSdTRvc0N0elluSi92Uk1R?=
 =?utf-8?B?ajh4RXZhM1NUMnkwc0JPU2RUbCt3S3IyWXhPQXZERUkzN3dVd3VjQzZxWm9E?=
 =?utf-8?B?Yi9CaFhTYWFEaGpSUitUT3JpSGNESFp1VTBDMldOT1hMQTVUa3ZHOVVBaUs1?=
 =?utf-8?B?UkM2VTF0dWR0MDVWQXM3QUNkTEdaN0tPRTBlNkhUM3BiVFVqd3ZZVFArL0d3?=
 =?utf-8?B?cG5aWk5hWVJjcDh1R1hic2xRVHgxSTZpNng0S2liRzk4S2dYQ0h0S0FMbnRU?=
 =?utf-8?B?Y3BReHhrN1UzMVdOaWhNTzdoZm9ZUXl0M3ZZMldXQVpUeFNhUTZXZytpbklF?=
 =?utf-8?B?S3h3bjRqYnhBUmhjcnVCVE0rRk0vLzJmdEYvN3cveURrZWZJME1yMk01T1BJ?=
 =?utf-8?B?WDB3RTh0SGU2UW16UnJvTUNqODc1bFRtRTRkNzB1b2RPcXNxT3QyMk9yN3ky?=
 =?utf-8?B?R0E4WjJmWGdMVWlLS2Nkd0MyOWtyYytSdjAySGpqVHl0bXRhVUZMd0xmZ2JY?=
 =?utf-8?B?NDVVMU8zV2FDSEtJRDNtMlpoRTVzNlRrODhKQnQwMTBxQUtlVEVkUXlNRzkv?=
 =?utf-8?B?cWtGbjkyeCt2cXF6YmdWYndnVU44NmVlakJnaUhIMWhrRFR3Y1Ruek5Ja2J3?=
 =?utf-8?B?VndMQnAzSXdwelNZNVlCMkVldnVJMUs1YWZ3U29WRUU0Y045RGd1ZjJmSzJC?=
 =?utf-8?B?RWJxRUxJOEVrUEhpL1RkUWExa2tTUENEUVZtb25VWEw0VE1rdVFVamNpazRm?=
 =?utf-8?B?ZVFPN0J4cERBTUoxU21tN2VNbE5vRmFlTlpCYnA5MWxzaDVVQmZNMG9EcU84?=
 =?utf-8?B?NHBRb3JWZTBTYXkxb3FKd2YzejRhVTI5bFpBNy9VSVlzaE1hSDNsc203L25n?=
 =?utf-8?B?RWhYd3djQnR3S2IzT3ZmM05tOFhRRlhUUEN0YVVsVnppa1pxcnh3R3lCTHA0?=
 =?utf-8?B?UkYyRjg5bnF5dU1JZk9VK1QzcTlkUElkWVFwNkxtY1JzcXRCU0hYejlJNHZv?=
 =?utf-8?B?aFJhaHp1N25WeU5iTDI1Z0hmSU1ub3g1VzVYUWFKZ1lvbzFVUW1qMkU2WWFn?=
 =?utf-8?B?ZmhMWCs5cUc1SUZCMDE5WGRWQ1pHS3ZwVW5CSXRERGxsVlY1UngzdFZuV1U5?=
 =?utf-8?B?VmFZOGU4MGF5MUFQU1oycmhEc3Y1YUZNUTBoTkt6VFFPYWhoV0VRc2taRUxF?=
 =?utf-8?B?TXQ5dSt1QlFwcVM5VzBFTmVGbGRvdDAwejd0MzFNOGt2QjJoRnk3dHUzSHRw?=
 =?utf-8?B?NnFmQXZZTWNuQ0wrK0xwR2d5bmt3T2UxTzZGNEU0a1ZSM0g3SEYzSGh1dWtN?=
 =?utf-8?B?NHdEZlpsOUJRUkpvOHBKRlBTY2tST2RPWElRQW5PVHVqcTZCT1J0dVdZbXhy?=
 =?utf-8?Q?FsVAUpm6SvecO0vziT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf229af-b1f3-43b2-014c-08de5f6c57b0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:26:46.6773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81JjEvVEp6GXHr2Mnsss+uB88USf77YOQh3PtEny+T8mIQ6ZUpzU7nFWyjrtvypsKFegwg0iiv8MzmGbyLY3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
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


On 1/28/2026 16:31, Jia Yao wrote:
> UC PAT index with CPU cached memory (system allocator) is now rejected
> by kernel to prevent security issues where GPU could bypass CPU cache
> and read stale sensitive data from DRAM.
>
> Modify UC PAT index tests to verify kernel correctly rejects the madvise
> call with -EINVAL, instead of attempting to execute batch buffers.
>
> UC_COMP tests are not affected as they require VRAM which uses different
> caching.
>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 44 ++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 20282fe8a..41194e460 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2604,6 +2604,50 @@ int igt_main()
>   			     !xe_has_vram(fd)) {
>   				igt_skip("Skipping compression-related PAT index\n");
>   			}
> +
> +			/*
> +			 * UC PAT index with CPU cached memory (system allocator)
> +			 * is rejected by kernel to prevent security issues.
> +			 * Only verify madvise returns -EINVAL.
> +			 */
> +			if (strstr(s->name, "madvise-pat-idx-uc-")) {

This if () will also include the UC_COMP tests, if the issue is only 
happened with UC PAT index, maybe you can just use

s->fn == intel_get_pat_idx_uc.

> +				struct drm_xe_sync sync[1] = {
> +					{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +					.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +				};
> +				uint64_t addr;
> +				uint32_t vm;
> +				void *data;
> +				int err;
> +				uint64_t bind_sync = 0;
> +
> +				vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +						  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +				data = aligned_alloc(SZ_4K, SZ_4M);
> +				igt_assert(data);
> +				memset(data, 0, SZ_4M);
> +				addr = to_user_pointer(data);
> +
> +				/* Bind memory to create VMA first */
> +				sync[0].addr = to_user_pointer(&bind_sync);
> +				sync[0].timeline_value = 1;
> +				__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, SZ_4M,
> +						    DRM_XE_VM_BIND_OP_MAP,
> +						    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +						    sync, 1, 0, 0);
> +				xe_wait_ufence(fd, &bind_sync, 1, 0, FIVE_SEC);
> +
> +				/* Now madvise should fail with -EINVAL */
> +				err = __xe_vm_madvise(fd, vm, addr, SZ_4M, 0,
> +						      DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      s->fn(fd), 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +
> +				free(data);
> +				xe_vm_destroy(fd, vm);
> +				continue;
> +			}
> +

This code should ideally be placed inside a function, rather than 
directly in igt_main.

Xin

>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>   		}
