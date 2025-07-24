Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E90C83F26
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 11:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265D89208;
	Thu, 24 Jul 2025 11:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETIzJCz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88289208
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753356225; x=1784892225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JJHS9pJXYxzdg0kcLgyTF571TtincF9RD60qvFhpwe4=;
 b=ETIzJCz5BEf/fuZzvOU5LcTSEukPlcKskzzKIECUhE+IoZXPIxchLZHS
 /ljfQOo8UAIx8RbeY4XRUyJkZmbNGWcB9gikGVa6qn70O7W4OK4Prf+FR
 FkxzoCjqCLy0yO6TNt2o1R49YxdVdDwzyEIaVeWUE5YvjJ8WeRsouku2X
 BiHGl71QVnzVNj2BL/8YBbvH1Cgtz1FmDAjG2jJyZuLsrLnUK28/owJLq
 GZsCJS+PQ9Amt1QHXqhPfh1g+ziZ9B+w4GRoTHznfqhr8Y5oBL0Rfss8A
 jAnmS5dK8BbruI8ZVI4uhLXSVzTQ8Uj2oSKR19D7/iglvMpG3CBNGza0Z A==;
X-CSE-ConnectionGUID: awC9lLuuQPWDl5lZBfXx9Q==
X-CSE-MsgGUID: HMUPdpDAQcS5dAMV25upQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54880242"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="54880242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 04:23:45 -0700
X-CSE-ConnectionGUID: GqddGJ4wQXiO8bVd/5vffw==
X-CSE-MsgGUID: b6sGUBMOQ9OAlf6GD9x2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="197318042"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 04:23:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 04:23:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 04:23:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 04:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtRPjfeVgrNGDzxXmL/7hSq/kJVZRMpd7/II5uBvkN0luqMEIOea1jWj0Ap5x4w4RKADaVbmBJKbk+7ILuFaNsEeRsSQ6515Ckk19Nqi5a16clFrUQ1SzungfEPAmYQQrCFUYs4mwOS9rbEPO835H90EkQsOG1UGJWoBjf2bX9KjwdJEd9sFNexeweculOzDOUE4rwaIbM8dW6kPPBCk8k4lqc1G7ULrWKfcmXNPWHPd1V4mGeHf1sCZRr03eWtuqd0tV02O+0s5ebRpXAJE3ORy5aE097PL+3dk8W58tobKra6UnKHmDPfxbgpV3FYb+brnuv0lNY11x/vgE4ChYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0LMD69VmWtvkFMkNIl5e3Ker4s4BWcXV3OCkaStf6Q=;
 b=Ltj8yhArqqynRTvVXjQVKfLVwFvedBTat8AI1cq8E//kAwPDc4NX1+7PxqFXBxijHnwOYeBUcfChLqRWw6T/llsW4oaudjP9ptrk3ZIwbLNjBYrRTpHlNWyflmiUD4lzW2DE595+mKAE+jmg4qRlRqD2yA5Qex1riS3poGCjd1CVtDsMOoUWbVFCRH+dxAvkE/VtXR2MH4k07Ri9KnYgXgZGWRIbdPPYZqr0qznJkDt4aQ1TP1M719Wjad0LmZVODg8uV+A76DgMEPrB/Zdb6NIAiyfI+zrjhxnklCyqKdG+6UdL1p4Eij1lZbPxhPnoMalWSjMmm2R47rOH8muipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 11:23:15 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 11:23:15 +0000
Date: Thu, 24 Jul 2025 11:23:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ewelina Musial
 <ewelina.musial@intel.com>, Karol Krol <karol.krol@intel.com>, Petri Latvala
 <adrinael@adrinael.net>, Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] runner/executor: Abort if dmesg is flooded
Message-ID: <bnxzyriwiduoxxp2s7mxkkn3jscy5xua5tx3lweaqwxkcsvn56@f5y4zifuil4t>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250723160609.103140-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250723160609.103140-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 90db8d66-e784-423a-731d-08ddcaa47b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y09LS2NyVVVwb0R5YkdjeDdzUE9nNy9pWUJIcjZ5MnB5OFFKWThzK1hTZmFh?=
 =?utf-8?B?WHZGL1pORnhNZ0g5ZHZ5Vlp1UGtlMnNoYVpBZFZGUFZyOWI3RmR3Zk5GTGhX?=
 =?utf-8?B?WlMxcWZuV1kySllYU2tvemRESk8rZ2FFanl4RkFaeVVTZCt1RTJwZHcybkRa?=
 =?utf-8?B?N2lrZGtPY0NkWTI1R1Rad2VjZnBQZnZCQzZuLzI4bXBLRnhiQWR1Ynl3bG1o?=
 =?utf-8?B?MVJzeCtGcFdLTk9TT1p5QVI5ek1XM3IySXVYWkIvN0ZVdzlSMUxsenRoZUlh?=
 =?utf-8?B?cGR5d3B6SUpSaXpZMlF2RlV0WHpPTkJPcGNTU3BPWTRCdFBqVnRBWFlGL25m?=
 =?utf-8?B?OUVtRW9FcHErSnZqS2xNbzdOUkNXTWxGQ3B6aXNUN1FwYm5GbE5wUWprcEtN?=
 =?utf-8?B?RU1Ia1VnWVlOVGc5eU5JZXNpSGUyWVhWMVBrMWFaR3NCUDJ0azFYc2ZDOFND?=
 =?utf-8?B?WjJIVHgrQWdYRlBnSDVqRm1WMHJQMmVjQ2QwUFUrQlBoMDBYYWcrL1JzZStI?=
 =?utf-8?B?T3cxYkFFMnVpZ2NJMEhXSk5yZmdhYlozaVJMV01keXBKUklaa0NGUUhTendM?=
 =?utf-8?B?OWc2cGZ1MXRUZUlxbnF1cVVpdStOUHBtanhyVmZnVkdFa1JiMXpvTWZCNnRm?=
 =?utf-8?B?NHNFL0plSGx2L1RXc0RrWUkvZ2NiMmp2WHJFTjhldDMza1VGSE5lM1psc212?=
 =?utf-8?B?ZnFlTzFDdU5UNWhhZmFvOWVnbVA2Y2I1ZFBNWk1vN3gxSXN2eE5nZnFVU0Fz?=
 =?utf-8?B?cE9yOE9ZOUtXMlRScFFYZ3d1dnMwRkV6a2djRU9ubVFyby81WlQ0Ynh1c29U?=
 =?utf-8?B?TnkrRE9vODhxSm8rWnN6cEZETElTangzYkQxWDJuZmczWStpWC9MMTRuOTk4?=
 =?utf-8?B?cTkrN09TcFNJaHY4VWVweEdsaDA5dDdBZ1dOcGNVeXI3MnJLMkQ1YnlTVDgy?=
 =?utf-8?B?a2dWK2NRRGpXcklueEJHamV4ZTNzeXZMZVgrQlB2M2NBT3BOckV3bGtXZzlZ?=
 =?utf-8?B?cy9GM3BjYzdFenNZZDcyektzY2JxZ0hRSWlSS0ZNUndXN3FSVEp4L091bEk1?=
 =?utf-8?B?eVo5VmoxY0FlNkQwSzY4VDZlV21SRUJDeVZza1UwMEtzNnNXcWkzTndBdkRE?=
 =?utf-8?B?YVFJeVJJQ3diQnZSYUcreGhPQjg2b2V3bXRMdU9Id0E1MzAra2RpbU1FOTJ1?=
 =?utf-8?B?OVNUUnk2N29ZU3Zqc2N3SHlWRFlsbU5QeC9IdGR0U0NWbkN6SHQwNTBLMm9q?=
 =?utf-8?B?YzNRNDgveWxGUnZpb3RLeis3U2xKbzYrNXYxcDhOMXJkbGJTU1hsT3QvTmtV?=
 =?utf-8?B?aVdueTZna3Z4V29yRDVvNi9FbS85Skh2VTdycjJuRlhnQS9PMEQzbGtoVE5a?=
 =?utf-8?B?V1pDdU8rTHY3ZklVWjczdXF5NnlydTYxdSsxTUIwNFNmRmdWbnNDa2Z6RHo4?=
 =?utf-8?B?RVJtR2pub0NBUmMvTXlodnUrYmlWdFlRcTF0UG9wQWFyVDJscUhDNkJxOEk5?=
 =?utf-8?B?dWEzRzhFdGVzak9CbUJkWGt0OWY4YXhwSitPOFJ3T2R5M2JDdS8zZkVkenNW?=
 =?utf-8?B?akdxcW5wT3F3SFJYV0tZNWNuWVZRcFBwVytwSmxlVC81N3lrTmcrK0I1YURl?=
 =?utf-8?B?aVBBKzBtUjhsdTBPTDhyUXZNMGpMNzJPelNHc1F6SmdLMnBYbEQzcVUvV3Rj?=
 =?utf-8?B?WXFsWXhHVkxlT1dSVTVqNS95UlhlcmNYY21RMFJJWk56dDZNeGJjbjNma0Nn?=
 =?utf-8?B?ckdNa1BIUTlQWEpkWFpCMDY4Tm9GeUR6SmVwK1R3VlpNNk5BZGVMTVlSenhD?=
 =?utf-8?B?V3V4ajI3VGZveFJJN1VuMWpNTFp1aEdxM3RCVS9IMDk3MGd0USt1aVZFSDh3?=
 =?utf-8?B?cmtOUC9EeWZ3WS9nQ2RQNFFPZ1dsQ0RNU01qRy9lM0oxRkhwdmFUWStwVjkr?=
 =?utf-8?Q?8OK+cIf2bQs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09DeXlkMTcxeHUwSlNjN3BQa3JEY2FCYU9mVUJnVlc1NGhNYko0WXprSytY?=
 =?utf-8?B?MWt2MmFnZi8wTmc0bzVVbWJKSU5lcHU0S3F1dmdLTjVnSSsrTlIvOWpoclpR?=
 =?utf-8?B?dE1OT09DL1Y3RmphMHFpNXArbHZoOU5oQm1iQ3lNclVQVDBwNmVvdkJlSGRW?=
 =?utf-8?B?c3Q5QkhUc3hQRVVZTmxucTJDdzVCcU1jWXAwTjhmWWhaVHNBaTU5TExmMFRm?=
 =?utf-8?B?WEFPNnk5S2tuT0xyWk4zYllUVGpMWDYvOVFveGV2bVRQQzJaazlVNEc1aVQ3?=
 =?utf-8?B?NEJXMk56T2x2WXoxRXk5cjhrckt4NGh0Qnk1QW9TR1FPYUxaVXQ3UHExQWUz?=
 =?utf-8?B?ZGpqdWVRM1hDVXVvSVNCaTl4UWFRTkwyOVhmZVhNa2g3eS9SaEQ3WHc4b3VG?=
 =?utf-8?B?dGRlVTY0ZVpRc0xmWXZhd3Q1a01ubExyWTFEMFRHb0pmRmlCTW1SL2NSNTVR?=
 =?utf-8?B?Tng0Q3h2cFJ4eFI4ckJNNitFbUd3U2ZJY0xFTEUrSEdEQXNJZzNlL0FjTkRo?=
 =?utf-8?B?QUxpc1VqcVBYdzJpRlUyWnZJQ2VIUjFyV1RzZEhMZG1KYUxDOVk0RUlUVVZ6?=
 =?utf-8?B?VEZpZ0ZRQlVoRk1KY1U5bk1iQUF6VVcwM1pqRkdvSUR5SGJTZzArS3AwSHRi?=
 =?utf-8?B?MDdqMXhXU29EZDkvTXlUaU9SZkJqNVZjbTVPakliZGNlSUhjMWNvaGJUYVVO?=
 =?utf-8?B?VWlnNkcwQlZLZG5nbFJIL1RaNmRvQS9WdFBtSVp5NGtabVNMb0V6VkhDbXpu?=
 =?utf-8?B?R1VYSnhzTkxQdE9McUxuN0x1T1J3RzRxMUxicUc3TzBzVlp3dUF3VDZKMEts?=
 =?utf-8?B?aHFnR3RVcTlUU2w4Y2NQeTBodmtUMzZKeUxKQWFUWC85Rk1jNGlWTUxueEZp?=
 =?utf-8?B?RTdlZGYxK3MxbE9EYVRmeDFUWXV2cnYxS3hjQ3Z2ZDlaSUo0WkxtcHBJMlVy?=
 =?utf-8?B?cDVvWnVhZ3B6VWYrTWYweWpVZDBIZGQxQTNrM0RuOW9BSGswdWpsOUlvejZI?=
 =?utf-8?B?SDNJVGFZNHNWTkJmNDBSWGNSSUJ3eGdxNGM1azB4ZVhPYkZvNjI5a3pDYXAv?=
 =?utf-8?B?Wm15VFBVM01YTHZ1VEttRmIwU2NTa0ZyY0g5YVpITVViRHNaWE8rMmlzTHJK?=
 =?utf-8?B?cC9WVWdqRW1tVzRyTGZtVkhnUmpXZzlqdUc0ZlpONk04a0pYNHgwZmVDZ3BW?=
 =?utf-8?B?S2FFdndXZ1plTUpyWTBYV0VIQXkvc0pPaUpUODU0QXFjSVZ4cElSZDI1dEFF?=
 =?utf-8?B?K0VBeVMzUXZjc1hDQUpBb0tMdE9Hc014R3RKMXJXVkRwa09KWndsM2RscHI3?=
 =?utf-8?B?dm5JY284OU9Ga3MwdW1KWHlWN0ZHMThIZ0pPcjBmeE9pRVcrdE5sZ2Z4WnJq?=
 =?utf-8?B?R00vR3NBa2hMZmxNZ1ZlekJaRWNYeG11VG5ENlh5b3RXeW5Qb3BwODRuMnhu?=
 =?utf-8?B?OHRuODhEMlF0NndGNnhhanU2OWtFY3hlaDNscWVPaGp4SU12ZWJJTERSSkpp?=
 =?utf-8?B?RGVqemlwMUEzYWZmVm1oNXd4U1NyTVdOZ01jQnRobVZSdTJObTlhcklHVlA0?=
 =?utf-8?B?VGVmZWZyMmJla3ozSlpxNFJHNkRZSHR1cmw4RHd3ZklZME8xQ1RPa3FDWFox?=
 =?utf-8?B?WTI5aGxPc0YwbUNmYm14S204bXd1cFZVRGtWODcveXBWanNWT29RYkpvVzVh?=
 =?utf-8?B?cWhqZDZNenhlMy91Y0o1ZG1XMGhnWTBZcFdVRXYwNFRDTEthZ0hEajUvYWl0?=
 =?utf-8?B?U2F3SXhrUDBaMk9xTi9wemhnUzNmcDhIbGFEVzZGcnN1WnBxSnFIRWtpM3Bs?=
 =?utf-8?B?SHc2STZudXdKTXhObCt5UzQwR1lLaE5tdGJFS3NLc1NtR1REVFErTk8wT3dz?=
 =?utf-8?B?akhvN3ZlYWc0U0VTVDBnaks3bmJYUVVucmdaUzgzYWdwSmdRN0ZpR3MrM012?=
 =?utf-8?B?eEozWk0yY2U5YlQ3RmlyUkl2dm1Dc3hHZjRDaERsc2JSVU9NMm15Y2lWeS9Y?=
 =?utf-8?B?S2lHcXlrZlArY1hqYTJocWgvUmlPRGhxeGczMFgvQ0Q3ZThoakVHTTA5aCsr?=
 =?utf-8?B?M2hiaDhFN2c0eVY3YlJaNmgrSy92a2tQdmtvRWhYYzdEMDFpMFFxRnJyeTFO?=
 =?utf-8?B?WlkrM0ZWbldLSGxzTTBoc0pMNWxPZlJURnBFcmlvdjNoZ2lOdk9jZ0RUYzRu?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90db8d66-e784-423a-731d-08ddcaa47b26
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 11:23:14.9687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naHWnAmkan9jDDU7yVn1Ix33eTMeeXPoRaodvXiDEKS6IIllol+unDbYOdBHu7CvoJywGGxtEBpQevfikf0t/r2k9z8+/0+o9vtQyqg4GEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

Hi Kamil,

I posted some comments below.

[...]
> Create a way to abort test in such scenarios with the help of
> measureing kernel kmsg activity before first test is executed
measureing -> measuring

[...]
> +++ b/runner/executor.c
> +static int open_kmsg_rdonly(void)
> +{
> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> +}
> +
>  /* Returns the number of bytes written to disk, or a negative number on error */
>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  {
> @@ -734,6 +739,95 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  	}
>  }
>  
> +/*
> + * Measure how many bytes appears in dmesg.
> + * This is the same as above dump_dmesg() but with reading only.
> + */
> +static unsigned long long read_dmesg2(int kmsgfd, unsigned long long size, int wrfd)
> +{
> +	bool underflow_once = false;
> +	int comparefd;
> +	char buf[2048];
> +	unsigned int flags;
> +	unsigned long long readed = 0;
readed -> read, as this is irregular verb.

> +	unsigned long long seq, cmpseq, usec;
> +	char cont;
> +	ssize_t r;
> +
> +	if (kmsgfd < 0)
> +		return 0;
> +
> +	if (wrfd < 0)
> +		wrfd = 0;
> +
> +	comparefd = open_kmsg_rdonly();
> +	if (comparefd < 0) {
> +		errf("Error opening another fd for /dev/kmsg\n");
> +		return 0;
> +	}
> +
> +	lseek(comparefd, 0, SEEK_END);
> +
> +	while (1) {
> +		if (comparefd >= 0) {
> +			r = read(comparefd, buf, sizeof(buf) - 1);
> +			if (r < 0) {
> +				if (errno != EAGAIN && errno != EPIPE) {
> +					errf("Warning: Error reading kmsg comparison record: %m\n");
> +					close(comparefd);
> +					return readed;
> +				}
> +			} else {
> +				buf[r] = '\0';
> +				if (sscanf(buf, "%u,%llu,%llu,%c;",
> +					   &flags, &cmpseq, &usec, &cont) == 4) {
> +					close(comparefd);
> +					comparefd = -1;
> +				}
What would happen if the first call to
r = read(comparefd, buf, sizeof(buf) - 1);
failed and then
r = read(kmsgfd, buf, sizeof(buf));
would succeed? Would we be counting the comparefd bytes after we
already got some bytes from kmsgfd? Or is the comparison
operation optional?
> +			}
> +		}
> +
> +		r = read(kmsgfd, buf, sizeof(buf));
> +		if (r < 0) {
> +			if (errno == EPIPE) {
> +				if (!underflow_once) {
> +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> +					underflow_once = true;
> +				}
> +				continue;
> +			} else if (errno == EINVAL) {
> +				errf("Warning: Buffer too small for kernel log record, record lost.\n");
> +				continue;
> +			} else if (errno != EAGAIN) {
> +				errf("Error reading from kmsg: %m\n");
> +				return 0;
> +			}
> +
> +			/* EAGAIN, so we're done reading */
> +			close(comparefd);
> +
> +			return readed;
> +		}
> +
> +		readed += r;
> +		if (wrfd && r)
> +			write(wrfd, buf, r);
> +
> +		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> +					    &flags, &seq, &usec, &cont) == 4) {
> +			if (seq >= cmpseq)
I wonder if seq can be a lower value than cmpseq - should we
care if that happens? If not, then maybe move the "seq >= cmpseq"
check into the if before, to reduce indentation a bit.

> +				return readed;
> +		}
> +
> +		if (size && readed >= size) {
> +			if (comparefd >= 0)
> +				close(comparefd);
> +
> +			return readed;
> +		}
> +	} /* while(1) */
> +}
> +
>  static bool kill_child(int sig, pid_t child)
>  {
>  	/*
> @@ -948,6 +1042,78 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>  	return dt != 0 ? dt : -1;
>  }
>  
> +/*
> + * Returns:
> + *  =>0.0 - Success, measured kmsg activity in bytes/second
> + *  -1.0 - Failure
> + */
> +static double measure_dmesg_bytes_per_sec(int wrfd)
> +{
> +	struct timespec time_beg, time_now, nsec_sleep;
> +	unsigned long long readed, rnow;
> +	double time, ratio;
> +	int kmsgfd, cnt, zero;
> +
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> +		errf("Warning: Cannot open /dev/kmsg\n");
> +
> +		return -1.0;
> +	}
> +
> +	if (wrfd < 0)
> +		wrfd = 0;
> +
> +	lseek(kmsgfd, 0, SEEK_END);
> +	nsec_sleep.tv_sec = 0;
> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> +	runner_gettime(&time_beg);
> +	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
> +		if (zero)
If "zero" only serves as a flag then I think below sleep could
be moved to the end of this for loop, because from execution
standpoint this will never trigger during the first pass
> +			nanosleep(&nsec_sleep, NULL);
> +
> +		rnow = read_dmesg2(kmsgfd, 128 * 1024, wrfd); /* 64KB max */
> +		readed += rnow;
> +		runner_gettime(&time_now);
> +		time = igt_time_elapsed(&time_beg, &time_now);
> +		if (time <= 0.0) {
> +			errf("Warning: Time underflow\n");
> +
> +			return -1.0;
> +		}
> +
> +		if (rnow == 0)
Move the nanosleep here and perhaps remove "zero" variable
completely. Then the code here would only contain a single if:
	if (rnow == 0)
		nanosleep(&nsec_sleep, NULL);

> +			++zero;
> +		else
> +			zero = 0;
> +	}
> +
> +	runner_gettime(&time_now);
> +	time = igt_time_elapsed(&time_beg, &time_now);
> +	if (time <= 0.0) {
> +		errf("Warning: Time underflow\n");
> +
You could skip this newline here.

> +		return -1.0;
> +	}
> +
> +	ratio = (double)readed / time;
> +
> +	return ratio;
You could return (double)readed / time; and remove ratio
variable.

Best Regards,
Krzysztof
