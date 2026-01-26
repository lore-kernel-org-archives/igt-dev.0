Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A6CF65CF
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 10:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A1A10E166;
	Mon, 26 Jan 2026 10:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUr+uuLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278C10E166
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769422501; x=1800958501;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RBcmRjpjdmWoSPWhENi8m891ceAqbWmoVCIejiYXDxQ=;
 b=SUr+uuLuILWetzWfbDrv9MY9rh0DK8FuRmwbo9SvepViZEtaq88Z3lw8
 brYPhIjbTrXdo33URpNJGWEz9+quTocpISJSfJUk0mroamGwm9n1WpO49
 S8QBR/FTQ5hScWFIbsH/Zq7gUBK8TkQKPOPYwQdw0Z2M+ZNO03vTJur7e
 bvic2HweIWJtgjSPpN7U2xCG0P9b4OzLy/ogAEf2KlFXbcajAWX2fzdiB
 5Dg6FLpl/MMpen0G2JmZ1pIuStApaNdXyIfAZJ2IaZ8bj2KT1W74YVakg
 /EXGO8cCAOZpinNTJKBuUC7OvnHLMhVb8nFF7xHXxZg2xTe3fpQOKQ+TW w==;
X-CSE-ConnectionGUID: lA0EZQzkSCG8LnlDIRzp5g==
X-CSE-MsgGUID: h0IDR7VwRcyyk507L722tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74439708"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="74439708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 02:15:00 -0800
X-CSE-ConnectionGUID: 0VZJg72DRCmtYIalqyub8w==
X-CSE-MsgGUID: IDw6OcFLSf6R7g5xAi4lsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207893160"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 02:15:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 02:14:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 02:14:59 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 02:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKAzqokyTzoTkWlkRIClf/rhOdFfK7uxX28JPTrnw0eoI5J8blRYZuPxtsNl6lmfCwU4cEAgR7KrQCFbGMNnkh0cwrpdVfxjKereL6u8SrwVfIzJkHMY4LrsdP7HGUdUZFJrDZr9ZjgmveJ3q9usDRqaThFBekKCWyCFpN20YQE2l717JukXkD4SQwxQIhPXSH8rwMWs1LV0Kp5bcpNQTjY5wxIRySHE/iwWcGCEufo2VYJXafGdO7/sELf7eUIBJSMQjNpsEiTYe6H3KQOt2ljosKq6I+pPWYKfvh0/i1rJHjRKBbLj87y3C3E3eKgLpQ3dM9VcXzMyIsVK9CcbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gzm/WqsNcDuK1nzIIfUutL205vRLNMt5a3WiK1rDyFI=;
 b=fu1Gn2DMibLOdsd4zE4KCVuPahxRAey/9Ef87Lc9Db+PyDkIIlH2gTj+Fd12SukJxF/R0Ml/z35hkFFOwxgGcY2vglE4rRaBuveMc28jPopCFjoa1Uz0zJGrydIUC+CVESBfZWy/Qti1/KbNIPhZRyBIFzhyeNPSFnQYdmas8k1EtpLN8nfZZP/0eA9NXHgO+OFJUX5iIJsy5Ex0N86BuSiMiyFrzXqA52V/b2hIEKPD08JmsT73kPDzqPgWQwy32iRETy4jxNDDVNojwzKJ25/VrmKv6N8QLnD+nw4Brxzd4pguDEAuiAHUfzVkdJL46BEmZU0kNzJHGm0fKyewKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 10:14:56 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 10:14:56 +0000
Message-ID: <0e31727d-306c-42f9-88a9-ffad08ea1313@intel.com>
Date: Mon, 26 Jan 2026 11:14:51 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB4ZV9ldWRlYnVn?=
 =?UTF-8?Q?=5Fonline=3A_Fix_test=5Finterrupt=5Fother_wait_logic_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260123113523.262544-3-piotr.rudnicki@intel.com>
 <176941199141.191595.13900499411423701434@a3b018990fe9>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <176941199141.191595.13900499411423701434@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0306.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::19) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 09308b48-0865-4ad6-f678-08de5cc3c137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnRPRm9FYW1wNjF2S2Vxc1BQdXUvOUJ1a2QrSE8ydUJBK2ROWGVxbzk5R1A0?=
 =?utf-8?B?Zmx4OUN0T3VYSFdrNzA5aVN0S043bWVhMFZOYThuZ3M2Y3U5ODYzY3loTWtP?=
 =?utf-8?B?eG9VN2hvZXo1eUF1d3puOXdhd3NsdEprOURLdnBEVE1IamRFczkvMkx1SDdL?=
 =?utf-8?B?VHZ3Y0IzMkJyTjZkSVhhRkcwNzFUdVcwM25VaTFUWHl2SGhXRloxRkt4R0ZH?=
 =?utf-8?B?RnRrY1RZcy9BZFFhQkxIdmZLaHlzWk1EelExeCtMOENmdHRwOFJNUzRUbERk?=
 =?utf-8?B?VnlBUTNGRGdFQmU4R3hqTXhzUmNtZmxialhQZzg4a0tDRHNad09tbzZSZXc3?=
 =?utf-8?B?b2Y3U1g2dUZBZzBVZjVPVkZZZ3ZSbGdIdG5DNmJobTFLTjlOZ3JuRTA0SlAw?=
 =?utf-8?B?cTFRRmpqd3BYYUVReHNzL2JDMlcyR0xPb01zeUx2MUtNSXJsUDlmd0g5Szk2?=
 =?utf-8?B?NlhwSytXQVc3THRzV251anE5bmNGOGhMQnN1b3dSelBQMkduVmtJdUs1VzJK?=
 =?utf-8?B?WjRidklpZUVOaDR2cDJyR0gyeENyQkx2eEM5RTlkK3ZENG9DZWdseWx4UnRK?=
 =?utf-8?B?d0VDV0NYRkJDdnd1Zk45ZG9nL2t4anlrYjVGVzNHenVmY2JVL0tDTmYxQ29n?=
 =?utf-8?B?N0tJZ1RmenZZcW5OMlNRRW9WM1ltWWFWVzE3NnNCUFZkc2dyNHJ0L04wcHVn?=
 =?utf-8?B?ZFowdnMyMC9QNkIwcnZMNGE3OGFsMCtuU0JkenQvOUJJS3hCWllqcStGSWFh?=
 =?utf-8?B?djk0Z3ZDTmtqbVVWQWhTamtKS0d2ODVPdTZ4MzF6OHlUNEhaM20wUkNwRjVH?=
 =?utf-8?B?aUo3dW0yY0FZVTI5ZFlLbzFBbFZ2ejdaa29zbTJZTVRheFVNMENVM29mbzlz?=
 =?utf-8?B?TWJmeTMrdkJ3d0RYTXo0RVBXSWt6M1NCSUM5VDJPYmJsVGo3eGdxYkdnMEkw?=
 =?utf-8?B?S1h1STQ4ZGdJR1d1M0g5R1RVUDFqWDg0Q0dnYVpuZEgvZlM3QUtvUm93KzBQ?=
 =?utf-8?B?VGRocmNQSXVWY1V2Wm03WTJaU2RQV0NhaXJ6M3lBdHFnMXNOaEdrWTlVdmR4?=
 =?utf-8?B?Qll4Z2doNVNTTEZMaWh4MU9Tem04eWQ2ek1LOXF5WnVCTlF5amlMdXU0blA2?=
 =?utf-8?B?YmpPQkVTZW0rNnVhSlRzS3RzaEJOK1dzTmVQMmFaTlhVK2Q1NUtTR1hSbnhw?=
 =?utf-8?B?cVBlU3Y3cGEzbjJEb3F3RlpFUXNvS25Xb3NHK1FpOHNhaFkxYWN3RFNCbnda?=
 =?utf-8?B?M1FQOStWaWhSMHhUQmJvT1dhMUVRMU1sZDNDZkJIcFNObXUreVcrWTdBMlRN?=
 =?utf-8?B?WmxNcjFUTHJnQkxvdEp0NU5EeVBGQ0JEMHpENkxpZTlITCtJV0I3c2phSU54?=
 =?utf-8?B?L3BGekxqbEFkUitpQXVvSk9scktsVFVIN3htdHpjMng4bWxobHVTcjlGL2xO?=
 =?utf-8?B?UzZtZDZxNWhRRTFNS1hyeGNwVEtLUXVTZWhwNjVzK3YrdDE3c0luSHR4SGlh?=
 =?utf-8?B?WXZQMXBQVG83bHNqWWUySDJWamw0UVJEdzQ2b3FDSzBoZ3dqSlJYanJCb3F6?=
 =?utf-8?B?VG9oSDlRcXU3NkU4dTdrU09palBZTnpiaGJWN3hzNUlvSFJtR1Z0a1ltWEZJ?=
 =?utf-8?B?N3V4VytZUGtxSVBtSldxSVF1bUxyZjFuVUNmVGFNZktBVHpiZFdHM2haaVR5?=
 =?utf-8?B?WlpFQUUwaXVoUGVyeFRVQzBNdm42RFlyNzUrOXRuWTBDcThuZjJzbnEwdEY4?=
 =?utf-8?B?dDFRck9LOFRLVFAzamYzV2RGQVlXVkdQbDJyMGUzZEpMSjZhQjMyWHh5KzRP?=
 =?utf-8?B?L20zMzBKL2Q2T1R0Nm8vbEVjVWpSWmdsem90aVBIVFJOL1hGeUVjVFZ2MTZN?=
 =?utf-8?B?ekV1YUpHcXBWaFcxT2JpMDNIcGtsdDlnUnEvYWRXZk8xWlhDYy9XN2lEZU5i?=
 =?utf-8?B?dGF6bkhwTHJqZ0hrdjZuTkU5M2RUdnBUY1VEOWcrckpZQ3p4aVhtR0doeGFV?=
 =?utf-8?B?NTgycXVwTGhTaU1lT2RvVWlLZkIySzZMWHo1aU9LZWdLeUhONTlnN2NVdnYv?=
 =?utf-8?Q?9aFuy9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTMvM3NyOUNNYk5VS3BMVUhPVU5yM3AxeDN2RUlycmt5SlgvTW5TNGhlOWJ3?=
 =?utf-8?B?cThsL1lBSTlzVm9sejJLR3hFV095SStCeDFaVlYrb25PN0RsVkVkcFhVSnAv?=
 =?utf-8?B?TmJxWlFTaHphL2FvNmR6dWlVME10ZkFXZlUwYzR0Nko3RkhqN2RvUFpVeElQ?=
 =?utf-8?B?R0pvOEtSRDVMNk01Rm1hSmVvdzk1VkNoTHNOU0ZsVWNBMFNyRjFyNGZGdWRM?=
 =?utf-8?B?bjJ0ZmFCV2U0NUxwMWRzRURvc01TK2tpRXNzZ1EyamtheFNaMlFQT1RBT21D?=
 =?utf-8?B?aXFHbzUrbVhtKzArb0pVNmJsSTdtUVBnQXJVN2NOV1d2RTJYTmlla2ZGbEFi?=
 =?utf-8?B?bnV1bTc0SW8xUjJMTlAzSzM5Q2tJVmFTUTJ5VndtbytBMlJlbGptUFQ0ckF0?=
 =?utf-8?B?bDlRQm85d0JQVVh4NEcvalFOYm1iOGRNOUhQaWdIczNxR0NMWEVCa085em9X?=
 =?utf-8?B?WFVIT1gxSGlaVEhoYWovTW96RUp3ODExZ2VjNzF1RCs5OWJDU2pTSEhWMkFV?=
 =?utf-8?B?UG9rbUlwdXVVWmFLNlNha1Q5TURyVXAvNVJFNFoxbWVmTC9XMW9RS3hpWnpl?=
 =?utf-8?B?U0h5Rzg0dm1tVE5KZlJJNVUrL05XcHZtektGL01ONkswZEtlbTlNVmFYT2h3?=
 =?utf-8?B?Um5qY0p3Z2N1ZmJWMHNzWGRlM0IvVkJyZTFvTEYzdjVTRi8xeVhlR0FTdTdh?=
 =?utf-8?B?aVlIRXdZY25HTzFuVFovc3BTSnVrOXlJR1R2bUo0U2pVVXdyRkVXZThhbVYv?=
 =?utf-8?B?UmVtN2JqeGJFc21kdUpkY1Q0d3U4em5vWDRlL255b1dML3FFQ2VwRFlNVUdX?=
 =?utf-8?B?RXpwUkRvY0hDdDlXYnUrOElWcHg4aWJhQWNYZmZVR20wTHkvYkVRUmRuN0cv?=
 =?utf-8?B?MHhid3cvSFNsNHJwWFBRSmkxWmJwOVFrcmgvaUNqV2JyRFpndWhSVXljZEo0?=
 =?utf-8?B?UWdHVy9EamZJTllybjRjamxocEtaS0JGL3ppWkJ1Ky9yYm5UaHhOOU0xclRw?=
 =?utf-8?B?alNmSlQxU0JnbmZ6bVVDdDY5WXZXblJXekhWdytsUEhwbXBlWVhPL3FGejRS?=
 =?utf-8?B?NHQ0SUdJc3NxQUQ5SUdBVmhsQ3hLK1ZGWmdEZ1VteWVjYzllUjBRZFoyWk5v?=
 =?utf-8?B?RCtWMW95RGNWb2RyTkozdkRTWlV4M2VnYXRxVjNaWjh3VGpPU2JTSHFvd0Q2?=
 =?utf-8?B?L2FNU3RWZGw3eVBhd2dydUJKMURURUg5aHJSajk2b0RwTU15ME52NFdvRVpm?=
 =?utf-8?B?VnYzV0xEV3dUbEErSGNNZ2N2WDNYQUdzZWxTaGM2OTFmMFMyMkVJZ1U2UmtL?=
 =?utf-8?B?VnhUd2NwbTJwTENYVkJWQUhnVjFmNkNaNmt0Uk1mRC9uNzJOQjN6aFFiYUlD?=
 =?utf-8?B?WFEzT3Fjbkpna3VwQTNaOEJQdWpydzc4UTlJZkFyY0x4SDVublNTVm1HWS9S?=
 =?utf-8?B?SHlOZCt1UmxrSnV1RGRLK3FudVk1WkJSTVFuZ3JZS1RzdFlEVnoyK25PUjNu?=
 =?utf-8?B?UVFVbnE5djk3eWs0OGd3bXpMV0U4eWxLUStzWm0xUURJWDNDL1F3ZEJ6REo5?=
 =?utf-8?B?OHhoWlltSUZPM2RjTFB4Q2E1eHVUWFZ0K1NWOGloUWJjNGV0TTBSOGF3cG9B?=
 =?utf-8?B?VkNsbWpBSlFOWkZJSjNuMGVQMEFtRndsanZqKysxdmV2RS9qekU4ak4vVEc0?=
 =?utf-8?B?SzVHMEtvc1M1MkZpcndMektxK1dZclZoNUlWWmZoQ2c3MHo5QVRpSDR2dFhB?=
 =?utf-8?B?Wit4WWR5RjBSUWcxMVNZOEdMWHpldjVha0wxVTA0NEtDbzd1bnFRT28yNGJ6?=
 =?utf-8?B?blE5eFZBbzQ1aEFaU04reWNMR3NsZWJWTldveUZFS1lTR0k4NFREYUZkbjdV?=
 =?utf-8?B?Zkh6MDRPbDJWWmM1MklBK2RBSHM4Tm94VitnUVlydTVHVHZ4WDhoWURibzJu?=
 =?utf-8?B?QXVwZE5MTE5SZ2hRZTFxSE02Y0krOUdObmk1RWhpZWJiYlhVZ3RFWFpZcVVa?=
 =?utf-8?B?c3dzUHVWakp5dWJHczY1ME03bHBESldEcUdxVUQwSE9uMkxKWjlMWjR4MkFE?=
 =?utf-8?B?eHJOU1NHSHJVQ1hGMEE3Ull6eGxhU3VoMGdKbDk0emlmbmpXNWpQRFRRdTlQ?=
 =?utf-8?B?dk9RallLdk9wMVpyY2NUa2JRaVhRRGFrWERJN1J6RjhDTXVxWXlJa1pmamR4?=
 =?utf-8?B?d256Ykx0K3lPQS84ZGNuaXQxa1FydEgzbjFiVGlCaHB1QWtDMVFGTlV5SWdh?=
 =?utf-8?B?a0NhOXp1YnY3eHY4QjF4bHg2Z0xTbGNPdXRhdFdCTzFMdVJ5SWNvM0NSVVNw?=
 =?utf-8?B?ZUw3bEY1MGNTS0xNck5IM2UxNGJyVmVxa2NXUEY2ZGxURFhVSHFINmJCK0Zj?=
 =?utf-8?Q?62otqLyX2+c01sbo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09308b48-0865-4ad6-f678-08de5cc3c137
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 10:14:56.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dEPn6xSapViBQvQmz0zOCpDAh4L4k7pN6siVTaf0sWOCRlOrhZzPXrxYYAaX0suEGca8Wtj7GaJKO35/J5GKJ/aPPCRzPF7rsmQ4Tb/S6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
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



On 1/26/2026 8:19 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_eudebug_online: Fix test_interrupt_other wait logic (rev2)
> URL   : https://patchwork.freedesktop.org/series/160553/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8716_FULL -> XEIGTPW_14416_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_14416_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14416_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_14416_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_pmu@fn-engine-activity-load:
>      - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html
Hi, the those errors are not related to my changes.

Best regards,
Piotr Rudnicki

> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_14416_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@intel_hwmon@hwmon-read:
>      - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125])
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html
>      - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7059])
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +4 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2191])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +4 other tests skip
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] ([Intel XE#7084]) +1 other test incomplete
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +8 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_chamelium_audio@dp-audio:
>      - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_chamelium_audio@dp-audio.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306]) +1 other test skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_color@degamma:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325])
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_chamelium_color@degamma.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +4 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>    * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
>      - shard-lnl:          NOTRUN -> [FAIL][20] ([Intel XE#6968]) +3 other tests fail
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#307] / [Intel XE#6974])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html
>      - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2390] / [Intel XE#6974])
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@mei-interface:
>      - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1468])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_content_protection@mei-interface.html
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2341])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_content_protection@mei-interface.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2321])
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-256x85:
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1424])
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2321])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#309]) +1 other test skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>      - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#5299]) +1 other test fail
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4331])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2244]) +1 other test skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4422])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4156])
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1421]) +1 other test skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#301]) +1 other test fail
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1397] / [Intel XE#1745])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1397])
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>      - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2293] / [Intel XE#2380])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401]) +1 other test skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2293])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#352])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6312])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +11 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#656]) +16 other tests skip
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>      - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4141]) +5 other tests skip
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7061]) +2 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2352])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#651]) +6 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +13 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7061]) +5 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4298])
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6901])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4596])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_pm_backlight@basic-brightness:
>      - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#870])
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_pm_backlight@basic-brightness.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#2893])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-move:
>      - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>    * igt@kms_rotation_crc@primary-rotation-90:
>      - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3414] / [Intel XE#3904])
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-90.html
>      - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3414] / [Intel XE#3904])
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>      - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1127])
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1435])
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1435])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@kms_sharpness_filter@filter-tap:
>      - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6503])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2509])
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#330])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html
>      - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2450])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html
> 
>    * igt@kms_vrr@cmrr@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [FAIL][73] ([Intel XE#4459]) +1 other test fail
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>    * igt@xe_eudebug@basic-client:
>      - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4837]) +2 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@xe_eudebug@basic-client.html
> 
>    * igt@xe_eudebug@basic-read-event:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +2 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@xe_eudebug@basic-read-event.html
> 
>    * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>      - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>    * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
>      - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
> 
>    * igt@xe_evict@evict-mixed-many-threads-small:
>      - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#6321])
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>    * igt@xe_evict@evict-small-cm:
>      - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#688])
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@xe_evict@evict-small-cm.html
> 
>    * igt@xe_evict@evict-small-multi-queue-priority-cm:
>      - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7140])
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322]) +3 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>      - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392]) +4 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>    * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
>      - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7136]) +6 other tests skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html
>      - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7136]) +4 other tests skip
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html
> 
>    * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6874]) +8 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
> 
>    * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6874]) +11 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html
> 
>    * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#5007]) +1 other test skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html
> 
>    * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
>      - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#5007])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
>      - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4943]) +8 other tests skip
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][91] ([Intel XE#7098])
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>    * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4943]) +10 other tests skip
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:
>      - shard-lnl:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#7063]) +2 other tests dmesg-warn
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html
> 
>    * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7138]) +3 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
> 
>    * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7138]) +5 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
> 
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-bmg:          NOTRUN -> [ABORT][97] ([Intel XE#5466])
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>    * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>      - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#6964]) +2 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
> 
>    * igt@xe_multigpu_svm@mgpu-migration-prefetch:
>      - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#6964])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
> 
>    * igt@xe_pm@d3cold-mocs:
>      - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2284])
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@xe_pm@d3cold-mocs.html
> 
>    * igt@xe_pm@d3hot-i2c:
>      - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5742])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@xe_pm@d3hot-i2c.html
> 
>    * igt@xe_pm@s3-mocs:
>      - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#584])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@xe_pm@s3-mocs.html
> 
>    * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
>      - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4733])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
> 
>    * igt@xe_query@multigpu-query-topology:
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#944])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@xe_query@multigpu-query-topology.html
> 
>    * igt@xe_sriov_flr@flr-vfs-parallel:
>      - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#6569])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>    * igt@xe_sriov_vram@vf-access-after-resize-up:
>      - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#6376])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-bmg:          [FAIL][108] ([Intel XE#4665]) -> [PASS][109]
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>      - shard-lnl:          [FAIL][110] ([Intel XE#5993]) -> [PASS][111] +3 other tests pass
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>    * igt@kms_color@ctm-0-50:
>      - shard-bmg:          [ABORT][112] ([Intel XE#5545]) -> [PASS][113] +1 other test pass
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-2/igt@kms_color@ctm-0-50.html
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-2/igt@kms_color@ctm-0-50.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>      - shard-lnl:          [FAIL][114] ([Intel XE#301]) -> [PASS][115] +1 other test pass
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>      - shard-lnl:          [DMESG-WARN][116] ([Intel XE#7063]) -> [PASS][117] +2 other tests pass
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          [FAIL][118] ([Intel XE#718]) -> [PASS][119] +1 other test pass
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>      - shard-lnl:          [DMESG-WARN][120] ([Intel XE#4537]) -> [PASS][121] +1 other test pass
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
> 
>    * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>      - shard-lnl:          [FAIL][122] ([Intel XE#2142]) -> [PASS][123] +1 other test pass
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>    * igt@xe_evict@evict-beng-mixed-many-threads-small:
>      - shard-bmg:          [INCOMPLETE][124] ([Intel XE#6321]) -> [PASS][125]
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>    * igt@xe_exec_system_allocator@threads-many-execqueues-new:
>      - shard-bmg:          [ABORT][126] -> [PASS][127]
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new.html
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-new.html
> 
>    * igt@xe_pm@s2idle-d3hot-basic-exec:
>      - shard-lnl:          [ABORT][128] -> [PASS][129]
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][130] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][131] ([Intel XE#3544])
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-bmg:          [SKIP][132] ([Intel XE#2426]) -> [FAIL][133] ([Intel XE#1729])
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
> 
>    
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>    [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>    [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>    [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>    [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>    [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>    [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>    [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>    [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>    [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>    [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>    [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>    [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>    [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>    [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
>    [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>    [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>    [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>    [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
>    [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>    [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>    [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>    [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>    [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8716 -> IGTPW_14416
>    * Linux: xe-4442-ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 -> xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b
> 
>    IGTPW_14416: 14416
>    IGT_8716: 8716
>    xe-4442-ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145
>    xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14416/index.html
> 

