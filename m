Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63BE9B24E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 10:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD8110E1D5;
	Tue, 24 Feb 2026 10:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtOEcnBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484A010E1D5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771928841; x=1803464841;
 h=message-id:date:subject:from:to:references:in-reply-to:
 mime-version; bh=K7Z3XqLDKw4l/j4hsEVnbN2iBUp6ajvBsla5BiZWGj0=;
 b=OtOEcnBDtEuT8p6jO45XSFD2QcbcmQKqSsLvGK/dlojOJ4JiwNdfw78c
 4Wv2KIRqu57xPYkIavzLscvBr4sH83/TpIfxFQs2+xGdj5w3tzO+SIKce
 SEsUWBOHM7A/V2B0hAfw2ll9o1fG0Kqbwi2EUM3akvDIG1AtFcCGarEoQ
 nDsRyEiRdOxxn5KazybYMrrdYwZjW74nZaTM1LLp6E+jd9pDWcjMK9iXq
 mlcLopruaFLxKJ/bHrIUHPyiqSO+gG+jub7zRxebNTXuWXQUBsPhugeRA
 K+zywuxvXxQ6m/2TyMFh18KRBB1K0KfNfnjGwXRdYbBU/sdayjd3qRBkU w==;
X-CSE-ConnectionGUID: VQv/6y6FSG6YUPNM7zn+LA==
X-CSE-MsgGUID: ujluPax6TjCc8Yn3Py2lfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71970257"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208,217";a="71970257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:27:21 -0800
X-CSE-ConnectionGUID: ulEK940VRMSoymxng2wHpQ==
X-CSE-MsgGUID: sky+LED2Qsq0UiHsKX4NGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
 d="scan'208,217";a="213690518"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:27:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 02:27:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 02:27:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 02:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfdjL+/SaW4ypcwbquI3wambtYne+63BOcC95X6lrdz6coux7ZoyY8JuI7BbK7t0WFn4j1zF7mJa5pF/xu44vod3HkrTORhCliFjIOooMvonH2BO3E6EkPxMJwbIuqSxndINpHmqtrHWo8SOBW9ZiLyBnWbdi+xby0mY+fd8ZysA96wf6t9o6wtXN+JYhIY+NERK0khT8h2D9ryYgrCadMG+NUlZlhL5rHr9NdDAz+Pk74vXpWsQlLxib4rc5MrjBP7MK4GASyM642ikPgknPX6Q6Y4wA4LMHgB+3MP/a9I8stfQLwRAA04So9XxOzK7F0sxt7bQnWTwZUbRwAknow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtgvOwGkQxsMV+XVMzeK1KQlPo0NiI2lWGJmoWk5aho=;
 b=L4B7qfCpEKa1NtJrvbWx8Y6LDStQxSUkK94ZZvkjNUVbIA9VonDH5pU0JbTCH9v1QmcNbiLpuNLBhVMmhafQKrgwbaj/piqeCAp3hpu9t8ZXt34MPPNKPRgjv1D305pVm5w+3L0F6bBdQwl3WxvFykxlOXMLLeYxBB9KUomijOKGDQHvjOmO7BI+Jve/o8iuC0KvoDDaHa3jRl2zqHp/uA/p+iiJIxEIWqAFXWGFek+sYP1dYCHNmlw1y6oFZXm1I2XXXON2JYDFByLMVQpf8gy+zBRGOqj4vW/cMOlOWawqkTVD+E8h0G9pWCnMZmA86Sar/5DakSjFvGoGthJQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SJ5PPF6E07EBAE7.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::832) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:27:18 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:27:18 +0000
Content-Type: multipart/alternative;
 boundary="------------B6r5sQ0ITOvi1mqIDqAeUdou"
Message-ID: <e9f9f48e-e907-4bbe-ad80-c1648a9ec4f5@intel.com>
Date: Tue, 24 Feb 2026 15:57:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-4-kunal1.joshi@intel.com>
 <b2bf05a5-f786-484b-948c-3a7a99825d25@intel.com>
In-Reply-To: <b2bf05a5-f786-484b-948c-3a7a99825d25@intel.com>
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SJ5PPF6E07EBAE7:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe3674d-7604-4069-9fbc-08de738f4904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEx6dGw5cW12OVFnMXFkK0J6SjBMaXdFSUNXS2xnWHFBcm9NUTJIUU0vZkc3?=
 =?utf-8?B?L0YxUWFUUlpPeFkvbVFsT1FWZWFoUXB1UTAwalg5Q2dzQ0xSR1dJNlBOZFF5?=
 =?utf-8?B?VHlod0N1Z1B2dXUxL0x4ZEo5bmpQQTVVcVpMd0hoUDlKdDRtSDdmbldJb1Jz?=
 =?utf-8?B?bGRYZXNpZ1R3UEI3VUpOL3NKOGdkaEZmZFFON2JOWTljWVI1d2N5WXBCVkJX?=
 =?utf-8?B?ZDV0Vk5Sa2FWbU53WFgzR0N2cGs2b3d3L3MrT25pbkszdFAwUDI5OXBHdVVX?=
 =?utf-8?B?SDUzWmVBK0c1cXNPZUhrZFYyWUlrTmJ1OFZ1VWhrSi9oL2lobXRmbFRTM3NL?=
 =?utf-8?B?Q0t3K0N6MFpwempFRnBVMDZ4UmJkZXVmQytDK1B1TlNHNm9sWHFvbksrM0Yz?=
 =?utf-8?B?UDZBeHhOVUNFRWZyOWxjQmVGL096aHRDQWRHVHcxbXNXQmNVckxvMVdDZkpn?=
 =?utf-8?B?M09sSlF0NXZ2SkNiV2ZGSGdoVWhlM29DaDJ6d0tPUFVyS052cnpRM2cydXBS?=
 =?utf-8?B?Tkh0eUFVR2dwQUUzS3VxTTBXRS8vVjV6V3QrNjU2STU3UzRWN2U3cGF3MUhQ?=
 =?utf-8?B?VTlRSHVsOVpSMkd0dzhiNUM2elpCQmc3QlltcTcwQ1MwVjZVWUE5L0lZMmlz?=
 =?utf-8?B?Vy80Rkp1WlNHZitkTlBxZU1CNXhuSGZMTHZ5amwzWWlFenJ4Nzl0MkpOL1NS?=
 =?utf-8?B?ZFloUlF3dzIzZXNxQTF6Z3RwdFZtRTdHQjlqNjFUQ0Q5V1ovR2d6d3RpdkUr?=
 =?utf-8?B?ckd6cVl2NldCQTlHTm5JUGlHWncyVDZ2MkZRNUl5TTVRcnBBaldDcFR6VTB2?=
 =?utf-8?B?S0EyOHFnVHV3Vlo4aWZURlhCL3BqTGkwYUJLYWJDRkhCQWlkL1VrZTFlK2kv?=
 =?utf-8?B?bzFlMVRzM25sZjJjZW4vaEpzU2Qzcys0MzlManNIZytVcEhYVFZpSk5naVBv?=
 =?utf-8?B?ZC8yN0g2T1pteUQ3eHVBcWpUQWR3UzE0bmdDcUlhMk1ZMm1VSzlRZDlTOVlp?=
 =?utf-8?B?cVNPSEdqcFNCWUxiMXp3QWVUN2E5eEhDYVdtMEdJbkZ5SlJub25QR2lwd01Z?=
 =?utf-8?B?N283aE5VaFk2dDZPbm4zSnA3bzhQMDFEQ1dlQTkyTjUwMFV4eE9vSmE4LzlD?=
 =?utf-8?B?WXZJNDk3dExBaDd4UHljQ1JmbnZxb1lkdEpHWXRZcXlEUWlsRmVRZmh0M0V3?=
 =?utf-8?B?Z3hPck1aT2RyTnhxZHl2Nm93RzdyQ3k1REl1bVRhdWVlczl3RXBVNjIvWDVB?=
 =?utf-8?B?VXg4NDFib01vNGY0RS9FUTcxMVNVbWtKK2ZxUGp6MzVybTM3OWtnSHBIUjI1?=
 =?utf-8?B?OXQwVm1mVm1kOWFJNm44d2o4RjZTRGJHeCtyK3VzQjJvTm9hRVh5MEsxNytZ?=
 =?utf-8?B?Q05heU41V2pnR0JHNjhTVHBDaWMzWWhEaUNFbUtMWFA5dXFFeFE2c0R3ejl1?=
 =?utf-8?B?K1ZucXpsZ1dlS0Rwb2kxUERYRC9PcytCQ0oxZGJwUTJ0Mmc3OHJaMEduQjlQ?=
 =?utf-8?B?TTZjQmljTHhIenI4ck5JL0hjTTZVV1BCb0FsUTVhTG1LY0JSdzdFRnN4YnVy?=
 =?utf-8?B?Z0RNWndZNTN4T0dydkh1QnBWZS9XM0IyRnIyNEFkbGNoL2E5OXQxa0pxZnhM?=
 =?utf-8?B?ZXhvZStUdXhIUUNDbUF5M2FmMk81ekovTVNmT1lQY1ZkbXI5a3pONjlVTVBY?=
 =?utf-8?B?U2lZMnowTWdOL2tURzBVdVJkS2dHQWJ0U0cwQjQxbHZ6RnVYeG9VaGE1TjRV?=
 =?utf-8?B?bWVWb2R0dWxhM0UzQ0JtdTJtajJXWjdnQ2R0QlF3SEZpQ0VLeDBha3lGOGI4?=
 =?utf-8?B?WHFFT2k3c2xSOUdkTHdxSnAveEdlYjhhM0xvREJyM3krTFpISTdyQ3R6WmRJ?=
 =?utf-8?B?MHhoeXZEcVNFWnZXdThpYXRRRCtlZXNQdVdHeVgwMWRtYk4za2NCWnhjNDhR?=
 =?utf-8?B?ZW1CRG1lRFR4TE90dDdCZUdqTkNsTW9OY0RJUWZpVERpdXRQUVU0QkxudGFj?=
 =?utf-8?B?S0hCWHh5eUNNZDVaZDBJcGpFK3Iya1NCK1FUUlVBV0hZa3Nud0JnVCthbSs2?=
 =?utf-8?B?K29XTDNnOE8rOEhDSTE4OHdyVTBsZXBQejBQZExlSjRXUWorWVVlTGJUSjIv?=
 =?utf-8?Q?xSjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZzdm14YllsblhHSEVmNVE3YWhDTzRGRElTeDRhcjZjRkViUnhyejhpeXhF?=
 =?utf-8?B?YUVKYlVYUGtEcm1ibTJxakNHbXJRM1BSNGx5UWVzRGdZSXoyNER1S0Yvcjht?=
 =?utf-8?B?eFdjY2FIdE43Q1ZXYkRxQndleVBpeVRDeDhCUkZ0N3p0dCtWU1FCMTd1Q2Zn?=
 =?utf-8?B?MS90MjhKa21lS2dxMUdFQnpodXloTFBiNGIyYVU0Q0Fjbys2Y3MzbVlmZ2Rq?=
 =?utf-8?B?VHpIL3FoUUNHc0ZOZ01yUmE4WWdYMWNucWNsSVl5UWtqZlQyaXYxdE5CV3dn?=
 =?utf-8?B?UytTR2V2N0NwZU5IRThOVDFRVDdRcStQMzF6aHdPOHVDemRlaVZ1MHJwdk5G?=
 =?utf-8?B?dmJoRjJ6UmJJOTcyZS96anBuWUhsZ0JkNHVnK1BxR2NnOFN4TmM3UTlIN3V6?=
 =?utf-8?B?em1Mb3VaSmtWRGUvV1JjejlhOXk1WTNNNXBHQVNWMU5iR0JGRTRFVnRNakM2?=
 =?utf-8?B?aTZFeElYc2tja3REVHVDQ0tDak5hME5XaHNVaExxS2tFd3pFN2JyOHlTS1N4?=
 =?utf-8?B?UW0rR1g2WnNhRkh5MmprNUtRbGZPSDRVVDZhdWM5OWNNRTN2UlNRc3FSM2tO?=
 =?utf-8?B?WXI0SHFqblhHVVAzK2U2aHJhdFJaWU8yQkNHZHJvZE5zMUxJdkhFTXdiaWk1?=
 =?utf-8?B?VnhpVUhGb25DNnhVWEU1c2dSakJUekJrcW1MQVROZ1FlcTlqVFpBeTV3WFBM?=
 =?utf-8?B?ZHhHSWl1dkhLUHpCRWtjamp2RElJbmUyOVJSbVowOUdLT1pGbHJQeXpwb1dV?=
 =?utf-8?B?ak5LUGhPcGpaQ1VRMkFnT05BaWdmdmhLSndMR2dlbkpmdWxvdmE5a3FmZ0Fs?=
 =?utf-8?B?QlNuZ2lMMm9iYmlIeWs0bGF3ZGhiZld6Qkg3REVvS0RvWitCWXRxbFhtQzI5?=
 =?utf-8?B?YW5obEUxRHlTMVRxdHJtV0NBYUtkcHZZWmxJOEt0RWJIdmtvTFk1Sm1vRVBp?=
 =?utf-8?B?WlA4S2N4MXJBU3hGamU2a1ZJUjRNUGZMMkdJU3owS0lTRjU4Wms5eE1xNHJ1?=
 =?utf-8?B?dTl1RUhpL1BRMURYM1VDVHZLQ2J2YU1yY1R6Yy9FK0p4aGFtTkVXS1U2U3RJ?=
 =?utf-8?B?eUJWNWI0TVdwdEZKeDJXT3gyTDJrWG5ZZE1QcnZma0RzV2xSeS8wUk5JN1Vv?=
 =?utf-8?B?WXZxYzZIdDFNMjBFUW9oVkc3SWN5QVhJMDVrcktWTnVVMFNOUG9kMVp4N3g1?=
 =?utf-8?B?TkFqd0QzM2ZIV2lpSk5rY0FJc3lFbDRQWHo4cHlDNVZFekt2RmRKMkhCZTB4?=
 =?utf-8?B?ZHh3OVA3VUw4UU1VUnNacE5BK2ZnNEExNUh4VUhUYWdPTzc1Zm1vcFZaTkRv?=
 =?utf-8?B?ZzB2MmFMcWZhVzZleXBBZnBhMVlQNE5nYjU2MDRBeVdUcWFRcVRMakRNWmVF?=
 =?utf-8?B?SnhHaDdJMlY2Qnk4Y1Fhc0RsMDJnUVBSV1BvVy9NTUFwN3BhMVg0b0VtVllp?=
 =?utf-8?B?NnVPMDdsYy9YT3Z1ak9WMXJTSTFpeUFZV2UxM0xmQXFWSGEzQjI5TkY2MStW?=
 =?utf-8?B?NjJTRnk5SHk0d1JpTk4wSk5IRHNFTVBlMU9iL0JVWWpncHFtTjdQaDNrK1Qw?=
 =?utf-8?B?b0V4cG0xNC9LcnlGYTJ4dnVpTlQ4NGY3SVMranIyVy9kcVJwYzRFKzdhVUpP?=
 =?utf-8?B?QTVSK1JTU2d0OW5UWnBHVWZNSlVPcldIM1ZpYlZJcHpVVTdQSTlyNndwd0VE?=
 =?utf-8?B?STFsVDBNblRsTkE2ZG92bnNXZ05TWkJHMHRMY0d6cDFudFQ1NmxDSWQ0WDUw?=
 =?utf-8?B?M1IzVzBHUU4zL0RVZVl3MVI0QnlJTkV4bEs5UEIzeDFlUkNXWXRBZi9mb0sx?=
 =?utf-8?B?Zm56VjkveG5HR0U0MFpkM1JuWStrVkxhSkN1U24xbUpTSXpZMXFHYURHS0R3?=
 =?utf-8?B?OWNtcjIzcUZPVzlxd01CdXpOUTFkQ0lzMVEvRnhGVk9TZnQ5UFg5dWNoM0FI?=
 =?utf-8?B?RkJ4ZmJCOEZ0SVdBbEptR0hwVlFmNTdDU0xic2s4VzNKa3J3MmNtazE2ZnZ6?=
 =?utf-8?B?NTZ1TWU4M2F5Uk96SktGTXFvRit5S2lER29UOWpNZm5lTWU2MlQ2aDM5UG5x?=
 =?utf-8?B?Z1FlVmNPUXFqY2xDL1h2ZmZMNlFGTW1vK1JlT1NZcjBPOWNxK0prYUF3OHNB?=
 =?utf-8?B?N1RMdU92d0hpc2NaRkM5RXFoUVBCL2hhZGFHcWM1OVVuaTduaGhsUmE0Lytn?=
 =?utf-8?B?d2NBcVlXMW9tTkhpZk9RU3RaaGRlTmNpN3FzaTdILzBiaFJOZ01Ed3dvNFV6?=
 =?utf-8?B?U283bGtzbDVGck1pWEYzUnAyMXd0cjJPRk9tY1BuT0ZIVllya3piTlI0RGZ5?=
 =?utf-8?B?OHdEVVE5RmVuSFR2UDRiZlNjN2t2VjEzVHYycTMvSWZnN2lvMUpKclhacjdy?=
 =?utf-8?Q?33DVYFbvCkWJA3fg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe3674d-7604-4069-9fbc-08de738f4904
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:27:18.1962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVRBpUadubsaY1iPR29uSTsbmq3KZlrxc0fX8iyuOmV0CDzgbpje2DIKbw2PjiqbUNHy1XY3sFCto6LgYm+zZvopHvR1C3Uv3dhiLmgFY/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E07EBAE7
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

--------------B6r5sQ0ITOvi1mqIDqAeUdou
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Minor nits can be adressed while merging.
LGTM.

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>


On 24-02-2026 02:05 pm, Thasleem, Mohammed wrote:
>
> On 20-02-2026 08:52 pm, Kunal Joshi wrote:
>> Add a new subtest mst-suspend-read-crc that verifies MST outputs
>> preserve display content (via CRC comparison) across S3 suspend/resume.
>>
>> The test enumerates all connected DP MST topologies, and for each root
>> connector exercises all non-empty subsets of the discovered MST outputs.
>> For each subset it:
>>   - Assigns pipes and selects non-joiner modes
>>   - Fits modes within bandwidth constraints
>>   - Creates green FBs, commits, and collects pre-suspend CRCs
>>   - Suspends to memory and resumes
>>   - Collects post-suspend CRCs and asserts they match
>>
>> v2:
>> - Add error handling for igt_pipe_crc_new (Thasleem)
>> - Improve log format with index for clarity (Thasleem)
>> - Order declarations in decreasing line length (Thasleem)
>> - Add print message when no MST found (Thasleem)
>> - Add bounds check for idx in subset loop (Thasleem)
>> - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
>>
>> v3:
>> - framebuffers missing in commit (Bilal)
>>
>> v4:
>> - Drop cleanup framework
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/kms_pipe_crc_basic.c | 314 +++++++++++++++++++++++++++++++++++++
>>   tests/meson.build          |   3 +
>>   2 files changed, 317 insertions(+)
>>
>> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
>> index f7b6ec293..59a44e92e 100644
>> --- a/tests/kms_pipe_crc_basic.c
>> +++ b/tests/kms_pipe_crc_basic.c
>> @@ -32,7 +32,10 @@
>>     #include "igt.h"
>>   #include "igt_sysfs.h"
>> +#include "intel/kms_mst_helper.h"
>> +#include "intel/kms_joiner_helper.h"
>>   #include <errno.h>
>> +#include <limits.h>
>>   #include <stdbool.h>
>>   #include <stdio.h>
>>   #include <string.h>
>> @@ -77,6 +80,11 @@
>>    *              CRTC does not cause issues.
>>    */
>>   +/**
>> + * SUBTEST: mst-suspend-read-crc
>> + * Description: MST suspend test for pipe CRC reads.
>> + */
>> +
>>   static bool extended;
>>   static enum pipe active_pipes[IGT_MAX_PIPES];
>>   static uint32_t last_pipe;
>> @@ -96,6 +104,306 @@ static struct {
>>       { .r = 0.0, .g = 1.0, .b = 1.0 },
>>   };
>>   +#define MAX_MST_OUTPUT 3
>> +
>> +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc)
>> +{
>> +    igt_pipe_crc_t *pipe_crc;
>> +
>> +    pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
>> +    igt_assert(pipe_crc);
>> +    igt_pipe_crc_collect_crc(pipe_crc, crc);
>> +    igt_pipe_crc_free(pipe_crc);
>> +}
>> +
>> +static void collect_crc_for_active_outputs(igt_output_t **outputs,
>> +                       int num_outputs,
>> +                       igt_crc_t *crcs,
>> +                       bool post_suspend)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_outputs; i++) {
>> +        igt_output_t *output = outputs[i];
>> +        igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
>> +
>> +        if (post_suspend)
>> +            igt_require_f(crtc,
>> +                      "POST-SUSPEND: no driving CRTC for %s 
>> (topology changed?)\n",
>> +                      output->name);
>> +        else
>> +            igt_assert_f(crtc,
>> +                     "PRE-SUSPEND: no driving CRTC for %s (bad pipe 
>> assignment?)\n",
>> +                     output->name);
>> +
>> +        collect_single_crc(crtc, &crcs[i]);
>> +    }
>> +}
>> +
>> +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs,
>> +                 bool post_suspend)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_outputs; i++) {
>> +        igt_crtc_t *crtc = igt_output_get_driving_crtc(outputs[i]);
>> +
>> +        if (post_suspend)
>> +            igt_require_f(crtc,
>> +                      "POST-SUSPEND: no driving CRTC for %s during 
>> vblank wait (topology changed?)\n",
>> +                      outputs[i]->name);
>> +        else
>> +            igt_assert_f(crtc,
>> +                     "PRE-SUSPEND: no driving CRTC for %s during 
>> vblank wait (bad pipe assignment?)\n",
>> +                     outputs[i]->name);
>> +
>> +        igt_wait_for_vblank(crtc);
>> +    }
>> +}
>> +
>> +static void log_crc_for_outputs(igt_output_t **outputs, int 
>> num_outputs,
>> +                igt_crc_t *crcs, const char *stage)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_outputs; i++) {
>> +        igt_output_t *o = outputs[i];
>> +        drmModeModeInfo *m = igt_output_get_mode(o);
>> +        char *s = igt_crc_to_string(&crcs[i]);
>> +        igt_crtc_t *crtc = igt_output_get_driving_crtc(o);
>> +
>> +        igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode 
>> %dx%d@%d\n",
>> +             i, stage, o->name,
>> +             igt_crtc_name(crtc),
>> +             s,
>> +             m ? m->hdisplay : -1,
>> +             m ? m->vdisplay : -1,
>> +             m ? m->vrefresh : 0);
> --> I think we can guard this using igt_debug() instead of igt_info().
>> +        free(s);
>> +    }
>> +}
>> +
>> +/*
>> + * Select non-joiner modes for all outputs to ensure CRC collection 
>> works.
>> + * Joiner configurations consume multiple pipes and are not yet 
>> validated here.
>> + * Must be called before igt_fit_modes_in_bw() so that bandwidth 
>> fitting uses
>> + * the correct (non-joiner) modes.
>> + */
>> +static void select_non_joiner_modes(int drm_fd, igt_output_t **outputs,
>> +                    int num_outputs)
>> +{
>> +    int max_dotclock = igt_get_max_dotclock(drm_fd);
>> +    int i;
>> +
>> +    if (max_dotclock <= 0)
>> +        max_dotclock = INT_MAX;
>> +
>> +    for (i = 0; i < num_outputs; i++) {
>> +        igt_output_t *output = outputs[i];
>> +        drmModeModeInfo non_joiner_mode;
>> +
>> +        igt_require_f(max_non_joiner_mode_found(drm_fd,
>> +                            output->config.connector,
>> +                            max_dotclock,
>> +                            &non_joiner_mode),
>> +                  "No non-joiner mode found for %s\n",
>> +                  output->name);
>> +        igt_output_override_mode(output, &non_joiner_mode);
>> +    }
>> +}
>> +
>> +static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
>> +                   int num_outputs, struct igt_fb *fbs)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_outputs; i++) {
>> +        igt_output_t *output = outputs[i];
>> +        drmModeModeInfo *mode = igt_output_get_mode(output);
>> +        igt_plane_t *primary;
>> +
>> +        igt_require_f(mode, "No mode available for output %s\n", 
>> output->name);
>> +
>> +        primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +
>> +        igt_create_color_fb(drm_fd,
>> +                    mode->hdisplay, mode->vdisplay,
>> +                    DRM_FORMAT_XRGB8888,
>> +                    DRM_FORMAT_MOD_LINEAR,
>> +                    0.0, 1.0, 0.0,  /* Green color */
>> +                    &fbs[i]);
>> +        igt_plane_set_fb(primary, &fbs[i]);
>> +    }
>> +}
>> +
>> +static void run_mst_subset_and_verify(igt_display_t *display,
>> +                      igt_output_t **active_outputs,
>> +                      int num_active,
>> +                      int n_crtcs,
>> +                      uint32_t master_pipes_mask,
>> +                      uint32_t valid_pipes_mask)
>> +{
>> +    igt_crc_t pre_crcs[MAX_MST_OUTPUT];
>> +    igt_crc_t post_crcs[MAX_MST_OUTPUT];
>> +    struct igt_fb fbs[MAX_MST_OUTPUT];
>> +    uint32_t used_pipes_mask = 0;
>> +    enum igt_suspend_test stest = SUSPEND_TEST_NONE;
>> +    int drm_fd = display->drm_fd;
>> +    int a;
>> +
>> +    igt_require_f(num_active <= n_crtcs,
>> +              "Not enough crtcs for MST subset\n");
>> +
>> +    igt_require(igt_assign_pipes_for_outputs(drm_fd,
>> +                         active_outputs,
>> +                         num_active,
>> +                         n_crtcs,
>> +                         &used_pipes_mask,
>> +                         master_pipes_mask,
>> +                         valid_pipes_mask));
>> +
>> +    select_non_joiner_modes(drm_fd, active_outputs, num_active);
>> +
>> +    igt_require_f(igt_fit_modes_in_bw(display),
>> +              "Unable to fit modes in bw\n");
>> +
>> +    create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
>> +
>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +    /* rtcwake cmd is not supported on MTK devices */
>> +    if (is_mtk_device(drm_fd))
>> +        stest = SUSPEND_TEST_DEVICES;
>> +
>> +    igt_info("MST subset: %d outputs, n_crtcs=%d\n",
>> +         num_active, n_crtcs);
>> +
>> +    wait_for_vblanks(active_outputs, num_active, false);
>> +    wait_for_vblanks(active_outputs, num_active, false);
>> +
>> +    collect_crc_for_active_outputs(active_outputs,
>> +                       num_active,
>> +                       pre_crcs, false);
>> +
>> +    log_crc_for_outputs(active_outputs, num_active, pre_crcs, 
>> "PRE-SUSPEND");
>> +
>> +    igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
>> +
>> +    wait_for_vblanks(active_outputs, num_active, true);
>> +    wait_for_vblanks(active_outputs, num_active, true);
>> +
>> +    collect_crc_for_active_outputs(active_outputs,
>> +                       num_active,
>> +                       post_crcs, true);
>> +
>> +    log_crc_for_outputs(active_outputs, num_active, post_crcs, 
>> "POST-SUSPEND");
>> +
>     Variable naming -->'a' could be more descriptive, might be --> 
> output_idx? or any suitable..
>> +    for (a = 0; a < num_active; a++)
>> +        igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
>> +
>> +    /* Detach FBs from planes and remove them to leave a clean state */
>> +    for (a = 0; a < num_active; a++) {
>> +        igt_plane_t *primary =
>> +            igt_output_get_plane_type(active_outputs[a],
>> +                         DRM_PLANE_TYPE_PRIMARY);
>> +        igt_plane_set_fb(primary, NULL);
>> +        igt_remove_fb(drm_fd, &fbs[a]);
>> +    }
>> +}
>> +
>> +static void mst_suspend_read_crc(igt_display_t *display)
>> +{
>> +    int n_crtcs = igt_display_n_crtcs(display);
>> +    igt_output_t *active_outputs[MAX_MST_OUTPUT];
>> +    /*
>> +     * igt_find_all_mst_output_in_topology() internally caps
>> +     * discovery at IGT_MAX_PIPES entries, so this is the
>> +     * correct upper bound for the buffer.
>> +     */
>> +    igt_output_t *mst_outputs[IGT_MAX_PIPES];
>> +    /* Fixed upper bound for tracking traversed root connectors. */
>> +    int traversed_roots[IGT_MAX_PIPES] = { 0 };
>> +    int drm_fd = display->drm_fd;
>> +    uint32_t valid_pipes_mask = 0;
>> +    int num_mst, i, num_active;
>> +    uint32_t master_pipes_mask;
>> +    igt_output_t *output;
>> +    igt_crtc_t *crtc;
>> +    int num_roots = 0;
>> +
>> +    for_each_crtc(display, crtc)
>> +        valid_pipes_mask |= BIT(crtc->pipe);
>> +
>> +    igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
>> +
>> +    for_each_connected_output(display, output) {
>> +        int root_id;
>> +        bool root_seen = false;
>> +
>> +        root_id = igt_get_dp_mst_connector_id(output);
>> +        if (root_id < 0) {
>> +            igt_info("Skipping non-mst output %s\n", output->name);
>> +            continue;
>> +        }
>> +
>> +        for (i = 0; i < num_roots; i++)
>> +            if (traversed_roots[i] == root_id)
>> +                root_seen = true;
>> +
>> +        if (root_seen)
>> +            continue;
>> +
>> +        num_mst = 0;
>> +        igt_require(igt_find_all_mst_output_in_topology(drm_fd, 
>> display,
>> +                            output, mst_outputs,
>> +                            &num_mst) == 0);
>> +        igt_assert_f(num_mst <= IGT_MAX_PIPES,
>> +                 "MST topology discovery overflow: num_mst=%d > 
>> IGT_MAX_PIPES=%d\n",
>> +                 num_mst, IGT_MAX_PIPES);
>> +        if (num_mst == 0) {
>> +            igt_info("No MST outputs found in topology for output 
>> %s\n",
>> +                 output->name);
>> +            igt_skip("No MST outputs found in topology\n");
>> +        }
>> +
>> +        if (num_roots < IGT_MAX_PIPES)
>> +            traversed_roots[num_roots++] = root_id;
>> +
>> +        if (num_mst > MAX_MST_OUTPUT)
>> +            num_mst = MAX_MST_OUTPUT;
>> +
>> +        igt_dynamic_f("mst-root-%d", root_id) {
>> +            int mask;
>> +
>> +            for (mask = 1; mask < (1 << num_mst); mask++) {
>> +                int bit, idx = 0;
>> +
>> +                /* build subset for this bitmask */
>> +                for (bit = 0; bit < num_mst; bit++) {
>> +                    if (!(mask & (1 << bit)))
>> +                        continue;
>> +
>> +                    if (idx >= MAX_MST_OUTPUT)
>> +                        break;
>> +
>> +                    active_outputs[idx++] = mst_outputs[bit];
>> +                }
>> +
>> +                num_active = idx;
>> +                if (!num_active)
>> +                    continue;
>> +
>> +                igt_display_reset(display);
>> +
>> +                run_mst_subset_and_verify(display, active_outputs,
>> +                              num_active, n_crtcs,
>> +                              master_pipes_mask,
>> +                              valid_pipes_mask);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>   static bool simulation_constraint(igt_crtc_t *crtc)
>>   {
>>       if (igt_run_in_simulation() && !extended &&
>> @@ -525,6 +833,12 @@ int igt_main_args("e", NULL, help_str, 
>> opt_handler, NULL)
>>           }
>>       }
>>   +    igt_describe("MST suspend test for pipe CRC reads.");
>> +    igt_subtest_with_dynamic("mst-suspend-read-crc") {
>> + igt_require(igt_display_has_mst_output(&data.display));
>> +        mst_suspend_read_crc(&data.display);
>> +    }
>> +
>>       igt_fixture() {
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.drm_fd);
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 7f356de9b..06c0d8e98 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -399,6 +399,9 @@ extra_sources = {
>>              join_paths ('intel', 'kms_joiner_helper.c') ],
>>       'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>>       'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>> +    'kms_pipe_crc_basic': [
>> +        join_paths ('intel', 'kms_mst_helper.c'),
>> +        join_paths ('intel', 'kms_joiner_helper.c') ],
>>       'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>>   }
--------------B6r5sQ0ITOvi1mqIDqAeUdou
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Minor nits can be adressed while merging.<br>
    LGTM.<br>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <br>
    <div class="moz-cite-prefix">On 24-02-2026 02:05 pm, Thasleem,
      Mohammed wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b2bf05a5-f786-484b-948c-3a7a99825d25@intel.com">
      <br>
      On 20-02-2026 08:52 pm, Kunal Joshi wrote:
      <br>
      <blockquote type="cite">Add a new subtest mst-suspend-read-crc
        that verifies MST outputs
        <br>
        preserve display content (via CRC comparison) across S3
        suspend/resume.
        <br>
        <br>
        The test enumerates all connected DP MST topologies, and for
        each root
        <br>
        connector exercises all non-empty subsets of the discovered MST
        outputs.
        <br>
        For each subset it:
        <br>
        &nbsp; - Assigns pipes and selects non-joiner modes
        <br>
        &nbsp; - Fits modes within bandwidth constraints
        <br>
        &nbsp; - Creates green FBs, commits, and collects pre-suspend CRCs
        <br>
        &nbsp; - Suspends to memory and resumes
        <br>
        &nbsp; - Collects post-suspend CRCs and asserts they match
        <br>
        <br>
        v2:
        <br>
        - Add error handling for igt_pipe_crc_new (Thasleem)
        <br>
        - Improve log format with index for clarity (Thasleem)
        <br>
        - Order declarations in decreasing line length (Thasleem)
        <br>
        - Add print message when no MST found (Thasleem)
        <br>
        - Add bounds check for idx in subset loop (Thasleem)
        <br>
        - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
        <br>
        <br>
        v3:
        <br>
        - framebuffers missing in commit (Bilal)
        <br>
        <br>
        v4:
        <br>
        - Drop cleanup framework
        <br>
        <br>
        Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/kms_pipe_crc_basic.c | 314
        +++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
        <br>
        &nbsp; 2 files changed, 317 insertions(+)
        <br>
        <br>
        diff --git a/tests/kms_pipe_crc_basic.c
        b/tests/kms_pipe_crc_basic.c
        <br>
        index f7b6ec293..59a44e92e 100644
        <br>
        --- a/tests/kms_pipe_crc_basic.c
        <br>
        +++ b/tests/kms_pipe_crc_basic.c
        <br>
        @@ -32,7 +32,10 @@
        <br>
        &nbsp; &nbsp; #include &quot;igt.h&quot;
        <br>
        &nbsp; #include &quot;igt_sysfs.h&quot;
        <br>
        +#include &quot;intel/kms_mst_helper.h&quot;
        <br>
        +#include &quot;intel/kms_joiner_helper.h&quot;
        <br>
        &nbsp; #include &lt;errno.h&gt;
        <br>
        +#include &lt;limits.h&gt;
        <br>
        &nbsp; #include &lt;stdbool.h&gt;
        <br>
        &nbsp; #include &lt;stdio.h&gt;
        <br>
        &nbsp; #include &lt;string.h&gt;
        <br>
        @@ -77,6 +80,11 @@
        <br>
        &nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRTC does not cause issues.
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; +/**
        <br>
        + * SUBTEST: mst-suspend-read-crc
        <br>
        + * Description: MST suspend test for pipe CRC reads.
        <br>
        + */
        <br>
        +
        <br>
        &nbsp; static bool extended;
        <br>
        &nbsp; static enum pipe active_pipes[IGT_MAX_PIPES];
        <br>
        &nbsp; static uint32_t last_pipe;
        <br>
        @@ -96,6 +104,306 @@ static struct {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { .r = 0.0, .g = 1.0, .b = 1.0 },
        <br>
        &nbsp; };
        <br>
        &nbsp; +#define MAX_MST_OUTPUT 3
        <br>
        +
        <br>
        +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t
        *crc)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; pipe_crc = igt_crtc_crc_new(crtc,
        IGT_PIPE_CRC_SOURCE_AUTO);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(pipe_crc);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(pipe_crc, crc);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_pipe_crc_free(pipe_crc);
        <br>
        +}
        <br>
        +
        <br>
        +static void collect_crc_for_active_outputs(igt_output_t
        **outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t *crcs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool post_suspend)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_outputs; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output = outputs[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (post_suspend)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;POST-SUSPEND: no driving CRTC for %s
        (topology changed?)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PRE-SUSPEND: no driving CRTC for %s (bad
        pipe assignment?)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;name);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collect_single_crc(crtc, &amp;crcs[i]);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void wait_for_vblanks(igt_output_t **outputs, int
        num_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool post_suspend)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_outputs; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc =
        igt_output_get_driving_crtc(outputs[i]);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (post_suspend)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;POST-SUSPEND: no driving CRTC for %s
        during vblank wait (topology changed?)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outputs[i]-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PRE-SUSPEND: no driving CRTC for %s
        during vblank wait (bad pipe assignment?)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outputs[i]-&gt;name);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_wait_for_vblank(crtc);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void log_crc_for_outputs(igt_output_t **outputs, int
        num_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t *crcs, const char *stage)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_outputs; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *o = outputs[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *m = igt_output_get_mode(o);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *s = igt_crc_to_string(&amp;crcs[i]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc = igt_output_get_driving_crtc(o);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;[%d] %s: output %s -&gt; crtc %s, CRC %s,
        mode %dx%d@%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i, stage, o-&gt;name,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_name(crtc),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m ? m-&gt;hdisplay : -1,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m ? m-&gt;vdisplay : -1,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m ? m-&gt;vrefresh : 0);
        <br>
      </blockquote>
      --&gt; I think we can guard this using igt_debug() instead of
      igt_info().
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(s);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +/*
        <br>
        + * Select non-joiner modes for all outputs to ensure CRC
        collection works.
        <br>
        + * Joiner configurations consume multiple pipes and are not yet
        validated here.
        <br>
        + * Must be called before igt_fit_modes_in_bw() so that
        bandwidth fitting uses
        <br>
        + * the correct (non-joiner) modes.
        <br>
        + */
        <br>
        +static void select_non_joiner_modes(int drm_fd, igt_output_t
        **outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_outputs)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int max_dotclock = igt_get_max_dotclock(drm_fd);
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (max_dotclock &lt;= 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_dotclock = INT_MAX;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_outputs; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output = outputs[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo non_joiner_mode;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(max_non_joiner_mode_found(drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.connector,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_dotclock,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;non_joiner_mode),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;No non-joiner mode found for %s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, &amp;non_joiner_mode);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void create_fbs_for_outputs(int drm_fd, igt_output_t
        **outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_outputs, struct igt_fb *fbs)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_outputs; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output = outputs[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode = igt_output_get_mode(output);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(mode, &quot;No mode available for output
        %s\n&quot;, output-&gt;name);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary = igt_output_get_plane_type(output,
        DRM_PLANE_TYPE_PRIMARY);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;hdisplay, mode-&gt;vdisplay,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_LINEAR,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0, 1.0, 0.0,&nbsp; /* Green color */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fbs[i]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, &amp;fbs[i]);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void run_mst_subset_and_verify(igt_display_t *display,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t **active_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_active,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int n_crtcs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t master_pipes_mask,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t valid_pipes_mask)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; igt_crc_t pre_crcs[MAX_MST_OUTPUT];
        <br>
        +&nbsp;&nbsp;&nbsp; igt_crc_t post_crcs[MAX_MST_OUTPUT];
        <br>
        +&nbsp;&nbsp;&nbsp; struct igt_fb fbs[MAX_MST_OUTPUT];
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t used_pipes_mask = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; enum igt_suspend_test stest = SUSPEND_TEST_NONE;
        <br>
        +&nbsp;&nbsp;&nbsp; int drm_fd = display-&gt;drm_fd;
        <br>
        +&nbsp;&nbsp;&nbsp; int a;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require_f(num_active &lt;= n_crtcs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Not enough crtcs for MST subset\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(igt_assign_pipes_for_outputs(drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_crtcs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;used_pipes_mask,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; master_pipes_mask,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_pipes_mask));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; select_non_joiner_modes(drm_fd, active_outputs,
        num_active);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require_f(igt_fit_modes_in_bw(display),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Unable to fit modes in bw\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; create_fbs_for_outputs(drm_fd, active_outputs, num_active,
        fbs);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_commit2(display, COMMIT_ATOMIC);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* rtcwake cmd is not supported on MTK devices */
        <br>
        +&nbsp;&nbsp;&nbsp; if (is_mtk_device(drm_fd))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stest = SUSPEND_TEST_DEVICES;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;MST subset: %d outputs, n_crtcs=%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active, n_crtcs);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; wait_for_vblanks(active_outputs, num_active, false);
        <br>
        +&nbsp;&nbsp;&nbsp; wait_for_vblanks(active_outputs, num_active, false);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; collect_crc_for_active_outputs(active_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pre_crcs, false);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; log_crc_for_outputs(active_outputs, num_active, pre_crcs,
        &quot;PRE-SUSPEND&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; wait_for_vblanks(active_outputs, num_active, true);
        <br>
        +&nbsp;&nbsp;&nbsp; wait_for_vblanks(active_outputs, num_active, true);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; collect_crc_for_active_outputs(active_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; post_crcs, true);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; log_crc_for_outputs(active_outputs, num_active, post_crcs,
        &quot;POST-SUSPEND&quot;);
        <br>
        +
        <br>
      </blockquote>
      &nbsp; &nbsp; Variable naming --&gt;'a' could be more descriptive, might be
      --&gt; output_idx? or any suitable..
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; for (a = 0; a &lt; num_active; a++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;pre_crcs[a],
        &amp;post_crcs[a]);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Detach FBs from planes and remove them to leave a clean
        state */
        <br>
        +&nbsp;&nbsp;&nbsp; for (a = 0; a &lt; num_active; a++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_get_plane_type(active_outputs[a],
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_PRIMARY);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, NULL);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(drm_fd, &amp;fbs[a]);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void mst_suspend_read_crc(igt_display_t *display)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int n_crtcs = igt_display_n_crtcs(display);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_t *active_outputs[MAX_MST_OUTPUT];
        <br>
        +&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * igt_find_all_mst_output_in_topology() internally caps
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * discovery at IGT_MAX_PIPES entries, so this is the
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * correct upper bound for the buffer.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_t *mst_outputs[IGT_MAX_PIPES];
        <br>
        +&nbsp;&nbsp;&nbsp; /* Fixed upper bound for tracking traversed root
        connectors. */
        <br>
        +&nbsp;&nbsp;&nbsp; int traversed_roots[IGT_MAX_PIPES] = { 0 };
        <br>
        +&nbsp;&nbsp;&nbsp; int drm_fd = display-&gt;drm_fd;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t valid_pipes_mask = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; int num_mst, i, num_active;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t master_pipes_mask;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_t *output;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc;
        <br>
        +&nbsp;&nbsp;&nbsp; int num_roots = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_pipes_mask |= BIT(crtc-&gt;pipe);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_set_all_master_pipes_for_platform(display,
        &amp;master_pipes_mask);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for_each_connected_output(display, output) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int root_id;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool root_seen = false;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_id = igt_get_dp_mst_connector_id(output);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_id &lt; 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Skipping non-mst output %s\n&quot;,
        output-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_roots; i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (traversed_roots[i] == root_id)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_seen = true;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_seen)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_mst = 0;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(igt_find_all_mst_output_in_topology(drm_fd,
        display,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output, mst_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;num_mst) == 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(num_mst &lt;= IGT_MAX_PIPES,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MST topology discovery overflow: num_mst=%d
        &gt; IGT_MAX_PIPES=%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_mst, IGT_MAX_PIPES);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_mst == 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;No MST outputs found in topology for
        output %s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;No MST outputs found in topology\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_roots &lt; IGT_MAX_PIPES)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; traversed_roots[num_roots++] = root_id;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_mst &gt; MAX_MST_OUTPUT)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_mst = MAX_MST_OUTPUT;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;mst-root-%d&quot;, root_id) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int mask;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (mask = 1; mask &lt; (1 &lt;&lt; num_mst);
        mask++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int bit, idx = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* build subset for this bitmask */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (bit = 0; bit &lt; num_mst; bit++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(mask &amp; (1 &lt;&lt; bit)))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (idx &gt;= MAX_MST_OUTPUT)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_outputs[idx++] = mst_outputs[bit];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active = idx;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!num_active)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_mst_subset_and_verify(display,
        active_outputs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_active, n_crtcs,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; master_pipes_mask,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_pipes_mask);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static bool simulation_constraint(igt_crtc_t *crtc)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_run_in_simulation() &amp;&amp; !extended
        &amp;&amp;
        <br>
        @@ -525,6 +833,12 @@ int igt_main_args(&quot;e&quot;, NULL, help_str,
        opt_handler, NULL)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; igt_describe(&quot;MST suspend test for pipe CRC reads.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;mst-suspend-read-crc&quot;) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_require(igt_display_has_mst_output(&amp;data.display));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_suspend_read_crc(&amp;data.display);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_fini(&amp;data.display);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_close_driver(data.drm_fd);
        <br>
        diff --git a/tests/meson.build b/tests/meson.build
        <br>
        index 7f356de9b..06c0d8e98 100644
        <br>
        --- a/tests/meson.build
        <br>
        +++ b/tests/meson.build
        <br>
        @@ -399,6 +399,9 @@ extra_sources = {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; join_paths ('intel', 'kms_joiner_helper.c') ],
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_joiner': [ join_paths ('intel',
        'kms_joiner_helper.c') ],
        <br>
        +&nbsp;&nbsp;&nbsp; 'kms_pipe_crc_basic': [
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; join_paths ('intel', 'kms_mst_helper.c'),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; join_paths ('intel', 'kms_joiner_helper.c') ],
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_psr2_sf':&nbsp; [ join_paths ('intel', 'kms_dsc_helper.c')
        ],
        <br>
        &nbsp; }
        <br>
        &nbsp; </blockquote>
    </blockquote>
  </body>
</html>

--------------B6r5sQ0ITOvi1mqIDqAeUdou--
