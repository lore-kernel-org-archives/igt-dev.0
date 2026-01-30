Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B39D49C6F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 08:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700CF10E924;
	Fri, 30 Jan 2026 08:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+wF7FXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7A10E924
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769761007; x=1801297007;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b13dlbhXQBPJkPDnbaL/p4APPFqaofN47PBQyT+vRGw=;
 b=V+wF7FXM4S2bfWnFTrTozXSH0w8HOIphe/ZUnnBRhXivINRUKEB8XUkL
 C00RtWhQENnGtsBBz8dG82SP5TSxMcwyCwRWRVSWjGJoy20LZdKLSG9ZR
 4MusTd5tHtQk/fw2VRVl5u1Ur85DQfkZAt6gOGKnASV0H8det3hPXsOIR
 UGTbQgYZ5PpqD6/i50qMteMedLKK47O6lyjs0mdiniSFVeuKUBEY9JNu4
 IVueumigTI9EUvXvIHdQOlP/wTspDlfS+IwqHYygLTZ1xZG7+NNaQ83Uc
 EN5mRwtvlQbkRkp5vQxq111BRzgz9ztWO2G8Qf5LLRBPQaFwqgkdJMPxb g==;
X-CSE-ConnectionGUID: FPfb8E/fRXeOd0wPPHmKnA==
X-CSE-MsgGUID: GSkFEGVBStWCTwn+PwKm1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74861475"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74861475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:16:46 -0800
X-CSE-ConnectionGUID: VXykummfRwqGSzcAFSTgDg==
X-CSE-MsgGUID: ayTsGPgYQEe+i+LHko2jUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213750234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:16:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:16:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:16:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:16:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9MuQI3NR+U9CFrquoh3RN2Fov8+oXO557lpXG7K/pACpmnNn4VEBuCS/fi8A+4Jz0foVu/ekEwvv3Twp9x3i4egJdnQaKXLzaNB9B7Nz2ZPs4+jV5l1lK926z6wjUae7xAO5R778hZxAUMas/IAMlNBdFnIaXiVs4rKHugXGR8lOPwhlYXoMl9tINWLwSdpP7EQ7kXxqawdIP4AI6jj8mVNszIqFd8QDw2gMyHQ6DCsiToMOWYqW+hjzadj/1/2YnVL340D2ZD4rcakaWkpvb8t6+bEHq+jUCIfANiz/2tdoZJgMJAtkZbJ0kAbOSnOE2PtKNjJDS75CPI+weaUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE5wHTPM9Hic8IL9uM//PWj25YqQp9NEGuuMwA/KnRk=;
 b=Jn1+9fqQYj5GJDk/7BJBLUJCC8IpFjMgEOZ9ylh/RV6+/ItRG/uPG59wy7wWgQUgAbrEcX7r9V52Xj0nvx2a7Jpjg72hIAuaGKaQDr7fM+bfdH2ykvxTIN2wfcLtu09JLkRu+RdZFHIlYJhTtAY/3PLmjgfxLj7iiuiUu4XMdcgT+J6xGftD+YdpXDdM7IS4hR+4PbfjKsNDAjyd8nHw3W0nG8j+pbpKDASXQqZVHAKUlt12/+WeADPNWUsQ81C2ZPhiB9XM82D2uuENnA7SAaUKJ6//q1Uca+YiLWGl1GUoyghJFXy2Nd87jIsowv16yHXjg3KbQ3dxF3NP0rPmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:16:40 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 08:16:40 +0000
Message-ID: <7098b60a-996b-4b3c-83ce-f0f7168da9cc@intel.com>
Date: Fri, 30 Jan 2026 13:46:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/5] tools: Rename tools/gputop to
 tools/gputop.src
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20260122084526.538837-1-soham.purkait@intel.com>
 <20260122084526.538837-2-soham.purkait@intel.com>
 <20260123134528.d7px67wm2a35oc7s@kamilkon-DESK.igk.intel.com>
 <87o6mkighk.wl-ashutosh.dixit@intel.com>
 <20260123151806.n3isxtvdd55mugws@kamilkon-DESK.igk.intel.com>
 <87ms24i11w.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <87ms24i11w.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY8PR11MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 23dbb9f7-d28e-409f-1226-08de5fd7e502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFhKOFYyZFdwSWovL2NOQ1lpdnRCTmFET2VTWUhZNkJtT1c2LzNIbytocU5o?=
 =?utf-8?B?c0s5Y01nRWkvQWttSHZmb2lVRkhvbkxEd0tHNEdVZFhTRFpSYW1xQ2E2d0t1?=
 =?utf-8?B?dG91ZkFtLzA5RnVwSmlVcFllSHZhUGJleTVHQTd4c2hXRWo5bU1jeGdEVUFp?=
 =?utf-8?B?RnNLdUlYU3JYaFJXam9tN2dlbmt3N0w2YVl6dnhmWlVzMWNUbFRBTnZXaXBX?=
 =?utf-8?B?VDZ5K0xMVktRQmFQMHpYSE1MUXBnNCtYangrc1pjZVdDa28ybitxenQrVmow?=
 =?utf-8?B?VnA0YkRuRmFFNjV4YysxVHVnc0JFcUYwcEExbFFueFkzRFBTQXpJSDRLOFpE?=
 =?utf-8?B?V1pCQWlhWGNJbU9wZlZBUFoyQTJ4dUVaQzlacXFyNFJIWUoxbUd4ZUt6S2JE?=
 =?utf-8?B?aURvRi9Ub0pUTy96T1dmc3FrUDMzWXlxQVdGeVZHTVhBbU80UjBYU2Y2SHhD?=
 =?utf-8?B?VVZGaFpHOUZZb2JVcXJUMnZvUEJNTUZJc1d0VGRsKzhXZmtzSXpVNkhGQ3Vi?=
 =?utf-8?B?bUhIMWxSZ21wcE4wRnFRaHVKTFh1RkJTbEQrZFdFRlp1ckM1MHVyMG1vd2p4?=
 =?utf-8?B?SWRtQXBCb3UvSEEyQWUyeVZHK2UvK3F1aDUvdEFhRVRNdWY3NkxPemp0K25H?=
 =?utf-8?B?eEhEYUJ5dmhBeFpsc2YvckZndXpxRXdGUWdyakZ2R1BhSmdvZVFLN3hRdjlB?=
 =?utf-8?B?QlpRTmpOZlJxUHJUaE5yZGYwZmdVVXRBYTBDTFB0VFBxMnc4L1ZrWmtlSmRI?=
 =?utf-8?B?aWRtS28zcDQ1YlJLQ0dISnJYSmlpc3lHQUl3MVpxUUh3L0NHbFNyb2phUzRK?=
 =?utf-8?B?WWNwUGE5enBHRFBrRTZtWjgyYkFHNWM3dmk5Uk1ib2RmSHU5NG1RTnBMaGNY?=
 =?utf-8?B?SFBoY2pEM1ZmRXZGQkE4YTY0UUdKQTVJUlB6S253aStKbnFEQmtuakZDNzNB?=
 =?utf-8?B?S0NFVEZjTGRiZDIwamJqMmJ2WmRGR2gvd0JXQlhMYWxqMklhS2pscmRWZFFN?=
 =?utf-8?B?aWh0T1pwVm03bU9BVVdDWXpEQ084NXY3K1NQZlcrT1A0WkM4K2RIMUhTSVVv?=
 =?utf-8?B?dEJWWUhYRTlESVh1RWxyOTFEWDVtK005TWg2K05MRWxoSU1vc29nZWsxWGNw?=
 =?utf-8?B?VXRFMS90NDZVR0lCTWVsT25pSERhZytCSHN1U3I3RXZNSlJVOUgyYmtPdWUy?=
 =?utf-8?B?SWdBNTVpVWN5amFMY2p0a0JabVF2ZFhKdy8zcUJaRm9ZUnNreEpHY21vOGlP?=
 =?utf-8?B?RmdUaFZvem12eEpMbU5udlhBakJndzliWnhuaEFKTmk3bjlxdTR4Ykx1bmpi?=
 =?utf-8?B?ck9yTHdxd0docGk5RUk4cHlGRkc5WU8wVkZLS1J6WVZZaFhubHp5MmxmOTR3?=
 =?utf-8?B?ajk2b2xXdE1uVzZYVXhQTHVZVDR4RHBUNXpRSVNQQkpvWlMwZ2NRZnNseUp2?=
 =?utf-8?B?QVRxbE0zckE5b1lqMjNONVVrM0NDRTBlcUdveStNU3gxcE93UmZRa3VGQUhk?=
 =?utf-8?B?aDFiL2I2TXgzdEV2Zi94SjZkZ1hvQTY0ZWxUdzdUdVExNm4xWWZuaXBFQXFW?=
 =?utf-8?B?UEI3ampyOXNTalg1ZlZ6TmF4YnYwckd2bW1CZUErUDZxb1B4bmVsdnVHN3Bx?=
 =?utf-8?B?Nk42NU1jWjM5amxoajI5ajJuNE1UN3FnK1hJUURHcjllRzNvTURVektPWVpO?=
 =?utf-8?B?N2ZBS2MyV3pqb1h6TlNwaTlXR1ZiMDg2OVZBNzZCUjdjQ1BqT1lZaEdia3Mw?=
 =?utf-8?B?c0pJMTZYcTAyaHpXL1dRRHYxNVZxR00rQ2FLT29KRUxRMHBIMUZOR0czZW1z?=
 =?utf-8?B?anlHUS9aclRMSTJ4VHR1TWhETHo2QllvSG9HbEdsdENaMTFTOVAwZWVGSUc5?=
 =?utf-8?B?cHIrUGduMVBPWXpRSEM3MTBQTjdBYXVxMjhHSzM2R2dIMkJGbTlhSVBRd2tu?=
 =?utf-8?B?ZmppL1NIQUp1RklrMjU0VVVJVnVrL1hDTE5MTHVaV3l0MWhnd1pUMVRjSUlV?=
 =?utf-8?B?VWFadUpSK21VeHA1M0FxTzdhQVJIUmEwRm9DdHB6b0VxRUZHWHFmMzFNQ25s?=
 =?utf-8?B?Sm5YWU4vdmtCTWliNkJ3N2xUSDNERzgxYy9xRktINGJreHFoQTZlZXJJK00r?=
 =?utf-8?Q?B9JM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U052M00xNkZNcFhsTzF6T2NvWXJ5NTJNa1NUVkVEV2JyUXE3disxeVNzQTdq?=
 =?utf-8?B?NW42Z0RVUkp1S0xKcFpxanNpdk5WMThBa3JVZGs3eFFPbW1BRHlHbzMwTTZY?=
 =?utf-8?B?UzVxdWFlV1lyWTZtalpRNTRpYSt2OTdQN2gxQ0pxRHUwaS9VbVNadTV1YlhF?=
 =?utf-8?B?eEc0V1ZBdlI3VndsUVJQSVZ2SG5VYW54K2VFNTk5WWMyQUdxTG1aQUtiOTJL?=
 =?utf-8?B?cFdrdWh3SUkzUnVyV0xYRjc0cHpoMC90alg3ZXJNVjhHWWxZbTE0ZGxQbStI?=
 =?utf-8?B?UDVQWWwyV01kRzB4M01PZVJ4L1NqS1hmbUsxUGkydU9GeCtqc244S2RKaXBT?=
 =?utf-8?B?SDRjN1hIU0IrZFhscVRuZk9pYlNZY0k5elNpc1dQUHpqRjBQSmJjU3VWYlJz?=
 =?utf-8?B?bzBpcVlJZmpONVc2aStqVWl0bHAzKzR5cHVoZ0JDenN3dVAxY2kwdmF5anJW?=
 =?utf-8?B?OU1qNkJiS1VGWCtoWnR4MThMYTN0L25nb0RENkR1VlNpcXdlSnJtZXg5QWFZ?=
 =?utf-8?B?TnFyR3dkeUE2bi9pVnRHb1lmdnZYS0dyZ2psZGx0S1d5aDZOaHJDMEYwZUI2?=
 =?utf-8?B?c0pZZi9ScGhjeXhwNUhwSUcwRjh2UHZ3aldwNFI2SE00RUNuOU82c1BjZXUw?=
 =?utf-8?B?MGFIMVBYZ1piSzNXdTBHbkMyUnJJM2p3QWpVdlkvZThGNEdiR0NUaCtXdmlN?=
 =?utf-8?B?RDI2NElGQjduZC9JOVhtWXhvdHFCWnkwc0tUZmtHSy92NnJISXQyUTZ6NHB3?=
 =?utf-8?B?TlBKRE1pUmpPNTFmYmxCQXRxaUQ0S3BvTEp0MStPbTdHellxUW1SV3h4Tzd6?=
 =?utf-8?B?OUgreUMwL2VYam1IMEQ4RG1wbTd0VThyOFFyQUs0UHFGM1JIaXlhemtZaFZp?=
 =?utf-8?B?Y1dKNnNJOEI1eHVnWHZZLzczemsydENjNkFxRGRIZFVlOFdMTjRrT0xoY0x3?=
 =?utf-8?B?UmFZNE9kQnd4UWJxL3c3dTdGYzhLWC92OG15LzFOYlo3TEdJWkZrYkNGbXJB?=
 =?utf-8?B?cjJZWXZSY2dzY2kvVVBRVGo5R3JzZVhyM2RLWnlhZHJkaEdSVTJXL3grZjJT?=
 =?utf-8?B?MFVtaUJpMk9XeU90Q1NTYThWNkNnUUJ4REszUHRoaVdnZ08rdnpLcExrRks5?=
 =?utf-8?B?T20vZWo0TmNnUGpUdFkzK0ZibGJmNStGMWpYUlNOZXI1anpkaFVZN3dOaTVO?=
 =?utf-8?B?akxOdmVwcXFyaWhuOFhwaVdjcVBUUE5DM2FreVVWUEFwbkF3SldTTFJjUzc2?=
 =?utf-8?B?N1dQZzhnU2FWUmxyMUpmRytsV3g2TjFjQTBkaG0xNytaMENyWHdpc0NwL0l6?=
 =?utf-8?B?RE9neHJjUU9oRmJzcENmZFZZYVJPZ05McU82Y2VHazl5RXZjRDh0bXhObnNV?=
 =?utf-8?B?QlBQVmlPcG1iUDNaOWlhYXdLYzJzc3N1Vzk4bDl4MWJPUTNMMjRsU3ZOT3du?=
 =?utf-8?B?OUp0M0hmY3NLa3orbEZuZTROMVFYS1N2dE9iVTBPeE1sMHB2dDMvNzJMb2Nq?=
 =?utf-8?B?NElla3FERU1DaGd0RncyVi9udkhINFV0VE9KSXVhOURYUjFKbTV1eDdONFNI?=
 =?utf-8?B?eENSVDdPMHIzVy9DaGJFaWJIYjdpdlhOM3FsOHdZRzlUMXZKM0RiVzF5Z3lV?=
 =?utf-8?B?dHdnaG9JQi9ZSVRUdHl1VFluYnRyZE9rRURieGZCL3Fid3dCRElYSy9NY2l6?=
 =?utf-8?B?akN3dWU4OHRpbHJoelNrbjUrc01CQ2hrUTYwNzBoS3VoV0xkYlZUY3NBNUZy?=
 =?utf-8?B?QVJnZEc2YU9KWUpWcEl0a1k4MzFnZTN3WkNuQ0ZDRFdzVEx3L2c1MDI1Mjdy?=
 =?utf-8?B?MWtncEZZd3lHbzI0WGxmaTB1WG95cTlPQUdWY3Z5clJsTGUraGs4TERsZG1T?=
 =?utf-8?B?YWdBOWJHYVpkWktDOTJCOHNDMnlVNnVwZUF4eFM0RkNBbTlMOWR5SDRDaG1a?=
 =?utf-8?B?YW9pVHZuYk5jWWh5bEQ5ejZYblUvdmZBaW9ua2hzMGpFeUJCbzI0ajVFcTBu?=
 =?utf-8?B?THIyRFNFV296Z05PU2gzRlZJakVPRkZjY0hvUzFMbUFsVmNZWmRIU2FtOVla?=
 =?utf-8?B?S1M2YU83ZDlwWFJFSnJndE5UajBobjBCUUJqYnhUR1ZhZ1kySmZpMkVPSHp5?=
 =?utf-8?B?ZHpXekphQWJNTklFeklxYmFMQUFYbStGa0RIbk9yUGNmaEJWdjhpWDBGenpq?=
 =?utf-8?B?bytZVXBKY01WSElWNVdvRlhqYnBQdERJQ2xUSjVuY1dUQTlkcVFYWm1nMEcy?=
 =?utf-8?B?NmJ2eFFxb2dmTXFSSXk0VG5VYkVpZGlBZkZDWTN0VGl2OGcwOEV1ZGthaUVF?=
 =?utf-8?B?L2ZMSmp1RE5VZmVRN3VWM0tjWlhoWkk5azdnZzVTSC8vdHQyZzNOdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dbb9f7-d28e-409f-1226-08de5fd7e502
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:16:39.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MViwfdp1/Vx7DVm0AXqNok+/4+McZoOo4KCUmPNDzf917kqamcydMqGZveN9xuYofTNu50izUpA85nJkacv4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
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

Hi Ashutosh,

On 24-01-2026 00:55, Dixit, Ashutosh wrote:
> On Fri, 23 Jan 2026 07:18:06 -0800, Kamil Konieczny wrote:
>> Hi Dixit,,
>> On 2026-01-23 at 05:52:07 -0800, Dixit, Ashutosh wrote:
>>> On Fri, 23 Jan 2026 05:45:28 -0800, Kamil Konieczny wrote:
>>>> Hi Soham,
>>>> On 2026-01-22 at 14:15:22 +0530, Soham Purkait wrote:
>>>>
>>>> I guess it is v6, not v5?
>>>>
>>>>> The GPUTOP source directory is renamed to gputop.src
>>>> s/GPUTOP/gputop/
>>>>> under tools/ path.
>>>> imho here a little more explanation why, like:
>>>>
>>>> to compile binary into build/tools/gputop file.
>>>>
>>>> This could be done at merge (unless another version is
>>>> needed).
>>>>
>>>> LGTM
>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>
>>>> Regards,
>>>> Kamil
>>>>
>>>>> v1:
>>>>>   - Add meson build files accordingly to generate
>>>>>     the binary under tools. (Kamil)
>>>>>
>>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>>> ---
>>>>>   tools/{ => gputop.src}/gputop.c          |  0
>>> Can't we name the directory 'gputop' if we are moving gputop.c into the
>>> directory.
>>>
>>> tools/gputop/ looks better than tools/gputop.src, fwiw.
>>>
>> While we can do it, I like to have build binary in
>> build/tools/gputop
>> not
>> build/tools/gputop/gputop
> We can't thave the binary in build/tools/gputop if the source is in
> build/tools/gputop/ ?
>
> gputop.src is fine if it can't be done, just thought I'll mention it.
I have tried using the same name. If the binary and the directory name 
are same,

it is giving linker error.

Regards,
Soham

>
>> This folder could have other name, is 'gpu_top' good?
>>
>> Regards,
>> Kamil
>>
>>>>>   tools/gputop.src/meson.build             |  1 +
>>>>>   tools/{gputop => gputop.src}/utils.c     |  0
>>>>>   tools/{gputop => gputop.src}/utils.h     |  0
>>>>>   tools/{gputop => gputop.src}/xe_gputop.c |  0
>>>>>   tools/{gputop => gputop.src}/xe_gputop.h |  0
>>>>>   tools/meson.build                        | 11 ++++++-----
>>>>>   7 files changed, 7 insertions(+), 5 deletions(-)
>>>>>   rename tools/{ => gputop.src}/gputop.c (100%)
>>>>>   create mode 100644 tools/gputop.src/meson.build
>>>>>   rename tools/{gputop => gputop.src}/utils.c (100%)
>>>>>   rename tools/{gputop => gputop.src}/utils.h (100%)
>>>>>   rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
>>>>>   rename tools/{gputop => gputop.src}/xe_gputop.h (100%)
>>>>>
>>>>> diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
>>>>> similarity index 100%
>> [cut]
