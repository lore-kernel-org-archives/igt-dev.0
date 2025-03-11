Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD33C28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 09:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D584010E557;
	Tue, 11 Mar 2025 09:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrIyhYFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A010E557;
 Tue, 11 Mar 2025 09:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741686706; x=1773222706;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EgRR4RHNu1lTZCkenvnUP/IcIYPWR/r4wWtnlRsYPMQ=;
 b=PrIyhYFSuGSVVnQ7T8/NnRspgCOI1QHp+oSWmAlnEJG4Z0rxk40hSOwS
 +hBnSXbSl7ELbHEVnkn73hsZDcAcwIV1jq7PDQGrrPPw6X9eu+CV+D1eM
 e47Iu0A70WR8ULaqz43uYgu5ifeYooAoujCjQHvBSHVXMpDxg9uqvm7K8
 JM6SYOk0ca/zc24tUljnH7v4ybRJJ6203Z8w0fIDzBvryv0uJsI1h+p85
 QI7p7YXCrzu+lxxl5db/yqir04nMlh7XuhgmrxXLl52mkX3zUk4LtfJL2
 iWsgmnW9tdpJDQhp6AWtfe+is71LP+PhnlP+LvgFNvmb1LuIN414OgPS3 A==;
X-CSE-ConnectionGUID: Hqtd9NCJR6enZMMM0jFqsQ==
X-CSE-MsgGUID: Syad3u+cSl+5W9ZaHvFQpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42593177"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42593177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:51:45 -0700
X-CSE-ConnectionGUID: /397n0tLQk2PwDoWp1Yl5g==
X-CSE-MsgGUID: HWD9CA4vSKiQuMSr9yNR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120300504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:51:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 02:51:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 02:51:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 02:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZJspafgywHP+W11niYGvFEbQ5Y2lLHkXuFvY5Dyvpm4fAdFGc91TVR32S9IJFgg7LTnmhEUNSVXI9EKlF0fsiMfW/+/zFChJNFBCIDreNIMU5qRsD5Q0M4gaXsx5asvPeVpsg09qM6WVM7HMJ6x4cmmgW4P3sNAq3x0C5u7NciQ9XS9BQvwvzJbXypEv/DfrjQ/+dPThcdsVE+cRx16PNNK5ZLc4dzwEDFmAi3BLJf+K6rlNRs9lNE8p+eUmdZdF/lnd1alTZLkuh+7YlMvf8CHXiQL2KKMSwZVd/NdkT5nS1FAOVeDCorDKJulIB4RCHm/H8cB9flmTctSKX/HoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgRR4RHNu1lTZCkenvnUP/IcIYPWR/r4wWtnlRsYPMQ=;
 b=M19BdT+Xxc4ClPI+APrrtuTOlMttq/POu21DXOKCUckUiAW70eVt7YWJ/GZ2fGW0h17+R2O8RTouea2rlUcNMwyAiP/elU/XVZ4DE8cgmhJP6CwuE/Hs9ATbB2pFkmLjyo9x53Sgq5AjMkihs/2k1aNPRop6UE5apP7G41hKwmkokFx7PGStSLAT0+x7GTOcimGqQMo32yTD8MLeLsSxLQiEWssHt28XYrSkmolsv9OxE3JMuL3OVFrNS32hqzVeSSPpHznWnqiaO4vYLsvEM0QCbaNJ+wTnD0QHQl7XJEImwbkSYqLcYoQnTfdYEoIe69utxD2J+u9M2l5GCpu6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:51:40 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:51:40 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgcnVubmVyL2ttZW1s?=
 =?utf-8?Q?eak:_Remove_unnecessary_lseek()_calls?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBydW5uZXIva21lbWxlYWs6?=
 =?utf-8?Q?_Remove_unnecessary_lseek()_calls?=
Thread-Index: AQHbklSyc8mGFj+gNUiB8EMJn6L107Ntsr6g
Date: Tue, 11 Mar 2025 09:51:40 +0000
Message-ID: <CH0PR11MB5491927A4F2468A949EB1C4EEFD12@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
 <174165762026.16386.5400280116303969337@18a75f3d1eae>
 <cbfc6f23-16f7-4c9c-9000-0c1d57356f51@linux.intel.com>
In-Reply-To: <cbfc6f23-16f7-4c9c-9000-0c1d57356f51@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS0PR11MB7998:EE_
x-ms-office365-filtering-correlation-id: 9d76268f-79da-4fc0-1462-08dd608252ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?SytqaWlSdHRzMW02cFFISytyMHR5TlNpdnRhLzgvTmJpUlQ0QVRBZzRXdzVB?=
 =?utf-8?B?Y0s0UjlHcmlsaG40Q3B3SmJTbEZuc1ROT3VIWlFPbnVxMm9uWE1CMWFYWFRa?=
 =?utf-8?B?RlU2Ym1VZjYwdTlLaE9LKzV6bFI0TldlamQrWHdSRXl6cm40WHhiOSttM2ts?=
 =?utf-8?B?d2hGa2ZqaDNna0ROYVg3Z251eHBKZURJcHZoTU5DQmhRd1kyK1Z1bnNpa0ZX?=
 =?utf-8?B?T1c1WjFSZVppK1l4ek9jYWxMRmVrMnY3YXZ4eENFalJTaFAyeUpvNXdvakor?=
 =?utf-8?B?NUU4MXhXVllXV3ZIa01EQnZkUDhRWDdZOTBnRlloSEJpSUZ0V245ZG1nWHVT?=
 =?utf-8?B?Q2ZrWmRSbE9LRTZmV0c3VC9PUm5NektMOEx5UFpmYjRXLytyVVlEbjdHYXBh?=
 =?utf-8?B?T1BtY0ZobGdUUWRKNk9tUGFkSnF2VnBTVktTTkx4SmFOUGx2MVlQWmJqU0hm?=
 =?utf-8?B?aVdjc3JOT2ZBbDUrdTFtbWJnLzhuSVRqWko0M1E4UjJDNDlvWGl1R0c1cXdl?=
 =?utf-8?B?Y2VBcVpwMWkwVUllZDF5NjNTUjhPclJFZHFwNjFpZmgwZWpGc1IwelNOUG5u?=
 =?utf-8?B?S2UvclJZcy93YVpqdjg1bDNmbStlTTNLRUIzWC9QbDgzNWZoWStCR0YvWHIy?=
 =?utf-8?B?K2FFWjVMdDVLc2t1L1U0ODZtRU9vL082T1ZGZzMvdVpkZWh3YkRGQ1hWNkxR?=
 =?utf-8?B?L2k0UFBaLzdaU1JsZlBaOTREZ0JwbEdHblNaeUU5Vkh2RkJxNWNnckxqZE92?=
 =?utf-8?B?VHZMMjh1MXllV3A2RXNqRnJQVnZrWUZLYzVKZGZRVlFEbzNOaVdEYlEvM2VP?=
 =?utf-8?B?ZXljcFVUNDcvbnIwTWQ1K3E2dllFTHMrd3Fzb1RGMEcrUCtJV2MvRjRiYWlh?=
 =?utf-8?B?TTRwcFQ2ZGhnOElwTjE2SERGWmduZkRIcXZUc29ZQVREY3FZbVIvS2tZbDha?=
 =?utf-8?B?SW84ekFYYkRtdlVLZytTNFhFK0lvUWJiS0Iyc1RlT3VOY1p0d003YmJhdG1F?=
 =?utf-8?B?MjdqSUYrd3lvZWNrdHUxQW5KUE01b3VPS1c5SXc2RkMwTDRQZzZmNEpmZHVS?=
 =?utf-8?B?anJFaURTQWYwdVMwYW1COTJOQlBnSHhUN0JzUkgzYXppTnhxNk1lQ1I2RWFh?=
 =?utf-8?B?Q2tTeXh4allNS0xreTArUGJITWduTGtpSTBiTC9NcDgzdENqNGc1VTZiczVk?=
 =?utf-8?B?WEtXb2dkMUZIYml1RVVMM1ZUUmdnUlV2ZzIxaFJ6QzVSRUNWZTUvN1hLRTRv?=
 =?utf-8?B?ZUFnSzlaRG93NG5sM2NjTmp6ai8zQnUxNWQ5ZkZKM3hybnYrMHF5dEpsbnhX?=
 =?utf-8?B?QjRETUs2RGtyWHRLSmVPVU0vTEpDblhCcDhNVVJQU05JYWNhTlJjbStyb1c4?=
 =?utf-8?B?WUZHeThqRHNncTl1cDJIZ0VhdlNuRm5OZ2R1UFo5eHE5Y0dya0cvZVpCMFor?=
 =?utf-8?B?ck1kWnlpVG5YWFNmWTVTTVA2MWtid2VjbFZjaDVST1NSME1kd2ZSTGpwYnRN?=
 =?utf-8?B?OVBzMmhOcHZNKy9JbXdIN2w0bWZOenZYK2kxek5nM3YwVXkzUXhOaW5UN1NE?=
 =?utf-8?B?WkxMWGhiaXhRUVZrV3FJM2FsN3pKd29tQXhjSG1RNS9NeUthZzVFbGdRUXdy?=
 =?utf-8?B?QVErSG1Dc2QzdU01Z1QyVXZCcU5DM0hEdC8zTGEyRVV0NzN6dUNNWlFmTGdI?=
 =?utf-8?B?SzYwTXg4VEdicVd0d1h0NEI3bEN0THdlS0VHREd0eXA4ZjUrYW1mVU4rOUp3?=
 =?utf-8?B?VkMwVnI1NWFFM0JnYzNDR3JTV3d2TDFYQnFUaUdrZzdYN1NwUUNUdEFPN1Ey?=
 =?utf-8?B?Ulhid1JOY3l3N2lJSTZJL3lYQ2dSTlZVNEcybEhSRVczTjlKc2E1dU5YQ2Nm?=
 =?utf-8?B?TnlsejU0SmFtRjBKZkJjM0hwVUsxSVB1Wm8ybzNBa0VQekE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cStEbzRRS0pac2RKQlJqNjhRc29TdmNuZHlLUVpxcG1GUlRDSTY3ZUd1UHBH?=
 =?utf-8?B?aTdSNmhOdlhDR241NWhYMng0ZHBWVFIzTzdBY3BkNi95dSsyK3NkMXhOSFJ3?=
 =?utf-8?B?Smx6czV5a2czOTlNb1NlRXRyc2F5b3JHbTVmejJpTXpNZEJuN0wwVUQwS3FJ?=
 =?utf-8?B?LzU2bFdJaENHeGdSZXJIaFZIVXAyY3NidmR5T3BKZzh6ZXRLY2taSTFrR1Aw?=
 =?utf-8?B?VU9DZGVCVDZtLzY2V0hndWlGSWp2ZTBYRDZoeVk5TmV2ZXNZeHRCTUlWcDho?=
 =?utf-8?B?bmZmNThGcGdXRmRLeEZYcHJ1clhIU2J5NHFYd0ZPUmpZaENyT2JlMjR6QWxx?=
 =?utf-8?B?N00zUE5STXA3YWE3YjAvRFVBeldvNUQyenJvQXZrdlBIQ28rdGxwQU4zN21X?=
 =?utf-8?B?OGhZdUxRWEFxblRGTHJEUFREbnprcjVsd05QR2JURlBMT1BwOHVGSDllamU0?=
 =?utf-8?B?YjhQa1FXeUNUUklGMUdkLy9pbUthcXl6TVl0bHZ1UmVYY1JKV1lseThKQ0Q0?=
 =?utf-8?B?OWVjU0JyNHNGUFVTRFNrZytzSmdPTTlNbjR1Snd1TldGZEdtZ05mb3BBM0hu?=
 =?utf-8?B?aDR3ckpWcnpDYzN3aS9SdTVsSnBkYjM3bkkzQkVQN3dqNFU3UnhWOVVGYXh2?=
 =?utf-8?B?blY2MTYzTlNPZmQrS3F4QThxaGRKSVJJMS9WZUhRbXVNcVZJZWVKSzQrMWJi?=
 =?utf-8?B?M2JvRGF2WEtvbzVLbzBnc0VsUkpHVmI0SlR5cVArRjl2WVNhQzh0TmdvU2k1?=
 =?utf-8?B?RE42TGtJblhpQTJ1N3lXMUY0ZUJXK09FeTVtajJrVTkvYVhHVTBKZ2tuZ2NH?=
 =?utf-8?B?N1p6WkdFVEVpQjBGOTF5K2Yrd3U2NXBLT1dwQ0tqN2NTbEVyVWcvTjI2UzJu?=
 =?utf-8?B?bEZzRmhKZXpGbXp3M1hpRnk3LzVmTEFHMC9hcnZhWndqb25WdUd1RGk1SjVT?=
 =?utf-8?B?ZmgxcFRXUTI3OWJrS2MrRjFzUVdLWWs2Y2RVNE56QjBUZ3Nnam94bHA0WGVC?=
 =?utf-8?B?TnV5SGdwVDhLSzFtZjRPUmY0LzhZT3dDTlJIUTNlanVZbUtLN0NYUVJSR2lu?=
 =?utf-8?B?QTY3M3c3V2hGenYyR1lBWngxcG03WU9NWHVVWTQyd3RZUGZUV29MazJHUmI0?=
 =?utf-8?B?cDRTc2JNOFRxWG8yU2QvdGIvSUZKelBZc3c3dEg3bHM5WmUrSS8vQjYwMTV2?=
 =?utf-8?B?ZDJOcHVxVzVPYURzaCtCTW1BQlFWa1pKZVJVK0Q2aENhREJKb1UwaGdIK0Va?=
 =?utf-8?B?QWwrbXA4dFplUlQvd1FIbFZxS0E4S2tSRUxOL3Z6TU1TOXJvLzdKNlJRK3px?=
 =?utf-8?B?OHBOb1hIRDVJTy9CcTRpbDV6TGJFMC9EWld2OVNseXdPUXprTm5hWlJGNUNY?=
 =?utf-8?B?bG5mRVJEcDRGeVFaWDV3bUJwdDh5WVhpdXEwQ3poVXJHbkEwVCtrbWtjdXA0?=
 =?utf-8?B?bVNTY1ZrQzRjYVl2Ky9DMFhIWGxJOTRPd2Q0cElQS1dBMkJGYU5jWUs4dnow?=
 =?utf-8?B?Y2V6SzA2QXNPL25WNHRxTW9tV2VoaTk1c1V5aWh5dEpSdWJ2dGwzdDFrRWlu?=
 =?utf-8?B?QlNPUTVVOUdwYzdJdGhHTXFVQ0JQaHFJYTFmdEVjODJGZDl3OUtkeHRBNHcv?=
 =?utf-8?B?bzFRc29YN3V5eDJuajN4UzFYbTU3eDd6eG9Zb3lnU3ErNXd4cHh1ZW5KUTRq?=
 =?utf-8?B?UkNXc3ltWXJicGpGdW93b3VJbGZKaWhINFNHZ0NIeTN1Y1pKSnpMNmU5bEw2?=
 =?utf-8?B?RjRYcFdpR2tkWEdkdXpJOFJKRDZFSFRBU1JiZlhONFBHZlVYTDVaSUlWYzBm?=
 =?utf-8?B?Ris1NWt0ajMwcnRvUDZiKzJpSFN5UkhMRDBxanZzb0MzT1M3U1lwbDdXZk51?=
 =?utf-8?B?VkJaSDNHZTZRNjJNb2RrdlU4Q04zRTUyektwVUs3dWJ2dzlUaHVBUXhac1Ix?=
 =?utf-8?B?dEJRMTcrS2VobVUxQjhxVzJRRURqSkFoTzRuQ3FtVVhNUG5VZGl0SHNwa016?=
 =?utf-8?B?TzE5NUdiNVVGaXpsdHcyVVp0bnhyQmFVTlhtNjdSZ3poNzdJNjQzK0RaVmFt?=
 =?utf-8?B?aXNyNDdaSkNsVGUyMmd6QTZLcjNMbjNGTWQwOGw1d1NaTUl3NzduaFE1UnN2?=
 =?utf-8?Q?KIkfB5JShET9wsI8LKVx6NShY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d76268f-79da-4fc0-1462-08dd608252ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 09:51:40.5398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQpC7RIeoUhpL1hxUVPfVpwrZeGhz/PnULe24tvFFuDcODklJQpnOcTInZoK1aKdF22SsEGZj3tm5hJxE7yqDO4Dw+/Z7EjdkN+iuBl2Tac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ2MTA1LyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2
YWxpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8
aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAxMSBNYXJjaCAyMDI1IDEyOjQwDQpUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBydW5uZXIv
a21lbWxlYWs6IFJlbW92ZSB1bm5lY2Vzc2FyeSBsc2VlaygpIGNhbGxzDQoNCkRlYXIgSTE1LA0K
DQpPbiAxMS4wMy4yMDI1IDAyOjQ3LCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRh
aWxzID09DQo+IA0KPiBTZXJpZXM6IHJ1bm5lci9rbWVtbGVhazogUmVtb3ZlIHVubmVjZXNzYXJ5
IGxzZWVrKCkgY2FsbHMNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzE0NjEwNS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09
DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MjcwIC0+IElHVFBXXzEyNzM5
IA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAg
U2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTI3MzkgYWJzb2x1dGVs
eSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRo
aW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFu
Z2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjczOSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1
ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhl
bQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1
Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNzM5L2luZGV4Lmh0
bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQ0IC0+IDQzKQ0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IGZpLXNuYi0yNTIwbSAN
Cj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4g
ICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1
Y2VkIGluIElHVFBXXzEyNzM5Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMj
IyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZToNCj4gICAgIC0gZmktdGdsLTExMTVnNDogICAgICBbUEFTU11bMV0gLT4gW0RNRVNHLUZB
SUxdWzJdICsxIG90aGVyIHRlc3QgZG1lc2ctZmFpbA0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgyNzAvZmktdGdsLTExMTVnNC9pZ3RAaTkx
NV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjczOS9maS10Z2wtMTExNWc0L2lndA0KPiBAaTkx
NV9zZWxmdGVzdEBsaXZlLmh0bWwgVGhlc2UgYXJlIHVucmVsYXRlZC4gUGxlYXNlIGZpeCBhbmQg
cmVzdWJtaXQuDQoNClRoYW5rIHlvdSwNCg0KUGV0ZXINCg0KDQoNClsuLi5dDQo=
