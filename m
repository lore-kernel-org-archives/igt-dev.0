Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F2CC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 19:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FAD10E079;
	Fri, 14 Feb 2025 19:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ow8zqbuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9510E079
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739559697; x=1771095697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ooNfEzXHwWlNcLYYbK5hezty47zo2cmceUpRW1RZSYw=;
 b=Ow8zqbuvTPsQALI7fkqHL9Pv9bvqmms2nWZ3uIt9UQ3w0biYLlSwxWTk
 Zg8taIqEyBY0HCe4hoz6Gqe3dfkFo35A8cvZDkE+s2YcW50k28WFv1/XT
 hEsAVdi3oIHLLEIbpGdftJg4bPrnhF9qXMbt3GrvTK5OQzysKoYfcBJAK
 zStKNnHsnTKicxstEzrznDkrSNfFHl3QINpsUJJtOFwIGuXkFtJqwuSXw
 iH0GZ430LROYKA4RPCyFQsQITySzhoEUpM6C61AHOJrdkiMBnqvHLEfI9
 34aj1/B7y39Y27MaSefui3aeEqMR4qqwwgD8coNyZsHqfytMjzw8gH8qG Q==;
X-CSE-ConnectionGUID: gtlPjLHJRQ2WqFddNfrYHg==
X-CSE-MsgGUID: oAROVJIIQv6PNhCz1tApeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51294681"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="51294681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:01:25 -0800
X-CSE-ConnectionGUID: hPuBlwsfQu6rJrcsJtTVuA==
X-CSE-MsgGUID: +XIHcZAgQOSaPxiutAWZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="144389297"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 11:01:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 11:01:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 11:01:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 11:01:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZx1cc1k+GJ/5Iyd0Nh3xAAx7wOBxXXBIlKe4PcICGvPrES8Za6UrQiSp2X9iRNsz2efworJm0mJY2w7pUHKMWwcY6D2BHkc1Uo6DNkOaQ1QzcWzNJ8w6IBIGPw9TuXN+8eThtlWAlvXF3aig7yMSaCifUAI4ejRBhvuHpgiKRbdYeSPpkKSaKFCMYRi4uROicmf11GXSFpBUZvnAu8AIkt4O1nI3KBYkTOKugH+pMcTyDVOYiuaC80bLq245IoJXd39FpNTMudQPgYVZ+JJo74ZbJ8WwpHSgKGFhlZTUdOnSfd0w5KqsaAqq6oHjB5nGLPR5kZe7LjvNmSZpm0Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwnqukGiFI/Fae+3qpkaavXPtMvsUwBUuJEqAN6Sjc0=;
 b=ZDPyhW/v9112ovIqpE24gW0mX4Pw6qxtx4tU1LOP8bT65hrEH9HFPNtNvyop4yYysvj/NADzHwhudQeZ89Ll1SQ1wC3VXKaXEcFz9B2omUMw6RjDFi78j0oWlDpEQw2h90K8idwUjPedLH8PICqN5O/6rw3v+602CrIRl8nMpYUvcN0useCXl6IyUPemBmR4hgPhEmtyHVuUhOsEqVDbyul/oOVezlXsXkSpcWBWAkVHpE97lH35Dta+Ec4XB+BXLE51Bhyk5V0VGo3C/W93J2SFFiZFHy2emWkDswYVrnHaWUnBlKz+sjihSTw99jUAeCGbw+9Usyo5+jVlzn84tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 19:01:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 19:01:20 +0000
Date: Fri, 14 Feb 2025 11:01:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add PMU test to validate
 engine activity stats
Message-ID: <Z6+S/rBZvEDBxQAZ@orsosgc001>
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-3-riana.tauro@intel.com>
 <Z6+Rqpjms2ruAw4U@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6+Rqpjms2ruAw4U@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce76ea7-5036-487b-dc57-08dd4d29f7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2dIamQyRmloRFkrWExZWUVObnZaMStTMlBpYVkwK0NrRmMwT3VwMTN0MkhR?=
 =?utf-8?B?Z1lOcC9ObDliZ0ZIbHl5aWFBbzNLTVBBL0ZQUXZKRmdkRXIwL2VIMkpJUGp3?=
 =?utf-8?B?bkREVGpabERZYlVQcnVXdTVBM1c1eXM2RFJjMjRkckhTWklGeGVncW5LRkxl?=
 =?utf-8?B?MlpXUE1IOExjTFhHdDh0Rjk2VTNtTWtZcXFVd3dyNWhkckVwY2RXSVFscmt4?=
 =?utf-8?B?b2t4bjBZaTFHcU9wN0FiSy8wYnBsd0hnUHc3SDNVZndQa0VXVGRmTjNwQlJ5?=
 =?utf-8?B?ZmR4bnlkKy9HL2FyYWVMVnQzNlJIWW52RlFSSHdpdmtPcFBmaHEySWd1OWFz?=
 =?utf-8?B?cUtnV01jeUFSR3ZOWDE3bGJ2VTFoakN1aVBFZ1B5RUdZc0d2eWY0SWd2L1k5?=
 =?utf-8?B?dks5YkF0NGJjTFF3V0pINndZVjhRaXJ3NDE3NkhCaURkbTZPSkFpc3VwdkJO?=
 =?utf-8?B?Sm5qdkdSeDVjR1FCQmRib2Fubnk2S2E3b2xiaW9FeWtMQURQNnB1VUhFL1Vz?=
 =?utf-8?B?dnZJbkcxa21QK2xQZXJ2TDVBNnZJa0wrb1FBd2xDeXFJZHh2b2RsSWcwdW5q?=
 =?utf-8?B?RXk4S29BTnU1WnhZdk95akpQSmJjUGpEbkwvNmdKQzkwNHl2bUF3aVN2WVEz?=
 =?utf-8?B?MWhBcjFweUZkc2lHYURsMUN5aUNOU1ZXVHpKN2t4bmFPUlZZeGdNREptK2dH?=
 =?utf-8?B?SFpObWtOZjNyMXdlT1YvTkliTDBHMmozRmk5MVU3MFUxb1VQcG5iUzc4Smtv?=
 =?utf-8?B?aGQ2NC81c1BRMWJBaVh4eVVoU3RkZUx1VnBmYkJTVXdpa3U5Mm1XVnJjOVpI?=
 =?utf-8?B?TG1zcEw3MFc2MUtEc0RuTWQra2xJaFFMVFdUcldyTFUxaFllSEdkdTdzZElY?=
 =?utf-8?B?NGsxdFhKNHE2QU9qRFVCVytmeE1ZOGhON3JEOGU5RlVIMTl3Y0NNU2lobFdq?=
 =?utf-8?B?L3BoTy9CQS9xWjAxVmpNb0hzS1ZmR25YVTkxdWVicVJOaTZPcGZNN2puQzFO?=
 =?utf-8?B?bmQwM2ZxM1VZTm5KK1NEVFJvR2lVVFdFNUIyeTRIdTlLeWhBL2RzOU53ZFQx?=
 =?utf-8?B?N3p3K0VseEdTWE1YZmtENE0vZ0NlMi8xTkJFVFBpbzFYOHQ0dEJhYUNUWTFn?=
 =?utf-8?B?K3crSEZOVXBSOUdIa1N2c1FWVlRQNTNkMEhHMHR3WWJzTVdGdGtDS2grK2tp?=
 =?utf-8?B?VXFIN2JqVlhCakdsbnpjVWlDTHQzNHh3cEhTTDl4Q0w2ZkFkUE1tbzkrQzdR?=
 =?utf-8?B?cG40U1hydXlGcG03em5tSVcrWWhMeHYxS1RyLzdmVWNUbTNtOXgzZHo1WHVN?=
 =?utf-8?B?b2gvcGl5bk1VWXpRVTlpdmRralJNQ05XeUlLS1NPVE1tNGZqVE1qdGdLSFNZ?=
 =?utf-8?B?QkpDODdVdnliYU9ocHZpMVBpMThKMnRMdWJYZVR1SmtiZ1RtckNlNHBhNkZU?=
 =?utf-8?B?L1l6cUF2ZmtsRGxpajNRNjhvUkxqZU5ERTVnOGdPWUNSMWQyMXVEekN5RXdI?=
 =?utf-8?B?Yk9QbkM1TnBZMmxZS3BFQkRDa2RXcTBWa25ZS0VEZEhjaHFGczFRK1AvMkNP?=
 =?utf-8?B?SnphNXF0aS9IbFZLWW91d1N3T3VLT0kvNUV6NXR5QkJPVGY3L0tPb09QeE0w?=
 =?utf-8?B?YTkvckZMR1I1Tm9GejF1SnNvT0tYaDBVekxaa2tiRUxmSE9Hd2JCVUlFOS9D?=
 =?utf-8?B?WXVqYkdPUkt4dWdFN004QkMxQ0p1alBrN01yTHY3anhaMTdlakt6bGtsQmdC?=
 =?utf-8?B?WXJCazczUlMrMEZwL3B1ZlRjOXU0ZWxSQVpqOUVqVjF1TlFQTHVDcnFFQVVl?=
 =?utf-8?B?WkNMTFhsZ3VPRm14YXNEUU5DUXRVcDlYenZqZEticGV6T25HL2t6T04xei9F?=
 =?utf-8?Q?Ll2nW06vi4pKY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWFEcEtTdGRkdzlENkhwY1JLekFRS0VVUWc3K2FtK2p0cU9PakZ1ZkRGUGVQ?=
 =?utf-8?B?NFc2TGk2dzRRRmtCR0NjYTFLUnQyRnplWDJPMm1LQUZVeUx6VHA2eGNpL0FU?=
 =?utf-8?B?KzZaNlpRbitTRlE4U2tvTEVDRTJ4WFcrRERsVE5aTFpHbG5NZU42Myt5MFNh?=
 =?utf-8?B?NG5oN0lMWFBBTGFNL0lTTUp5YmdpZHk3ampnNXdzT2RJYnpuMjFEQ0lUWGll?=
 =?utf-8?B?TEQ5VERQN3lsWVJxbUcxOEUzcWVCSFJFTHEzUEY1V0dXdGl4aTdpaGRTNEpX?=
 =?utf-8?B?RnRuSHBpNkgyZDlIc0NCczJUNG1qU1ZqYXpWSzdCUGhTeFZ0MmhCcml1NGlk?=
 =?utf-8?B?UFJVNkNEMmhQZzlodEsvcWZFUVU0NnAxdCtVU3JPYk9oeHQzMHpOQUNwSTNJ?=
 =?utf-8?B?d0hkME13Tmgwa3ZZYkZHYU9uWWorbGl0T2UzZFFFbGZMaGRjZUlISWh4T2Vt?=
 =?utf-8?B?MkRhaEhxakYzdjB1SGNqU0NTSlA3MS9wa2tUa0p6T25qeDhPNE9JeEc4RVQv?=
 =?utf-8?B?eDFVNjNJSWVrb28waWpWSEhpdXBhV2tWZ2MrNlNacEJmbzVoR29WTWVuK2Nv?=
 =?utf-8?B?aXJIQ000d05jSWZUbU1KN2gwNkk5YjQ0b1FRekphV0JRbWZsVGhCWk5IVG13?=
 =?utf-8?B?VnB1aVkrR0t3MmhSejc5MVg4Ym16QzY0V2tiMC90MVk4dGhyN1FDQ2VJZ2xS?=
 =?utf-8?B?ZkNwVWExdDBSbkVIaERaaFl5MDZMeXEyNTlxeTdPUGRhZGRJZDVkcXNyTDNj?=
 =?utf-8?B?cXJBYXIrcXArSFVWVG5lbGxpTUZmR1RpMTIxTzNHTkFDdFhqQk94V2x0blFF?=
 =?utf-8?B?ZDJYSzRGVmZtellBNDFQb0l3djc1M1BaZXc3dGZhb1RFZnhpMTZGSGtMRWoy?=
 =?utf-8?B?RWZYK3QreWZCS0JHd3dlMjliSVpyb2VhVDNVejRPMlE4UlhDbUwxaXNvNXEz?=
 =?utf-8?B?S0xwNlBGMVNwcXZ0RWxhR0pTdkFhMG9LeXdTcmJsUWdJVHlwUEpXR2h2V3J2?=
 =?utf-8?B?YUZldFBob0w1MDhIdmlybTYrVnZveGJiV3pQWHZSUFo0bzVoYVpYYlVIdnJE?=
 =?utf-8?B?WjZCWU53TU11YTJaVXZQc0daRTIyMXZvZjY1d2VKaktuL2NrZ0FNMkFzQ3g0?=
 =?utf-8?B?MmxaSm1JRWwxbEk2SVpwZHBFVmRoaU42ZUxqK2xyeDNPWnJpd21lSXJpK1ND?=
 =?utf-8?B?MXN1Y1FxTkZPUEFQVVl6Q3ZwR3JwWlJaRHNBbVEwUnpscVhwa3VKMEJzYitt?=
 =?utf-8?B?Y3lybE9lKy9aYWFYZTJEaG0vcnVSc09qYjkvbHpaZldTZ3lGUlkybS8vYnNE?=
 =?utf-8?B?T2JDT1BWWFg0ZCtsUlF1ckNKWHVDcUp2R0V3U1VSYTBad0d1V3k0aE51WENa?=
 =?utf-8?B?a1Fsd0ExVkNTN2pVZWtZTHRlQW5vTXBwUFpoRk4vVEhJOFRwc1ZsTjVLNVNR?=
 =?utf-8?B?b3ZsUDZOQjlSeDlZbCs2bCtLbkVoVXUwS3hjVHZCZVhRTTNGblhsM3U0L1cx?=
 =?utf-8?B?eW5YbW1sOGtxTUJQV3RGb2pZSUIwSHJ2OHo5QXpSclN4LzRiL3dnYzR0Yml6?=
 =?utf-8?B?V3QvVXM4UWQvbFRGRnZKaXNHcW9QcHNuU0dJMWZUWkpvbjBTc1oyZk1BL0Ir?=
 =?utf-8?B?Ynd4b1FYY1hsY0laQTJZcXB4U3BnZG0vUzVPbW9KWUhFU1pxbklnUmorTTJR?=
 =?utf-8?B?bG1ZQk0yOTAzSVlXbWxVK3czOTVBZjRDSTJrU0pzYjIzZlIyT3p4WndKWlJX?=
 =?utf-8?B?UFlYc0xlRzFMaktybHlvdlMrcWxpN3VZOEd3OWsrZGdnM3ZBbUd1UFZVOVFF?=
 =?utf-8?B?QjArRzBiZzNCbks3N1FwbEFadGMrWGc3OXg4VlRJbFBLUGlFSnB3b2FoWXR5?=
 =?utf-8?B?N2ZheFRDVGdrcEkwR0lPcGkvaG1xWHFYMFZ5Y2pQbXJLNDBJUFBNUDM3MGRS?=
 =?utf-8?B?bDdzWUxscE1sd002cVBVaUNCbWVYRnVDNUZSbG9kUm5JdU54ZVFMYW5hTGxI?=
 =?utf-8?B?VXNFd2NWSEhxWHJlQ0FmdEFybjB3WEFJMWlmWEZLbGl4TkIzSlRnQkU5WDND?=
 =?utf-8?B?N2MwYzkxeTNkbDlxTDRoNWJrRmhDOEdNZDA5eGVtcXkvMTd0dUhQbHAvVjkw?=
 =?utf-8?B?MU5TR0xqWWdSakJXRSt4WWZBWGJGbDdISlcyRFRXQng4YnBRbytLQjIrV1hm?=
 =?utf-8?Q?rdiDAEUwsOZ/mKvFH07s7Q8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce76ea7-5036-487b-dc57-08dd4d29f7b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 19:01:20.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCuUzL4M/QJFUeA6wARA0OzevMmsrfJXWcqvg3aGmVZCB724rgAL5iAzFbCGeoPt6eVRc/RENrXyPE2eS+u4LF0e6h+aN037FoJhwhOdsWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

On Fri, Feb 14, 2025 at 10:55:38AM -0800, Umesh Nerlige Ramappa wrote:
>On Wed, Feb 12, 2025 at 03:28:28PM +0530, Riana Tauro wrote:
>>Add a test to validate engine activity by reading PMU counters
>>(engine-active-ticks, engine-total-ticks) when running
>>workload on every engine
>>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>---
>>tests/intel/xe_pmu.c | 147 +++++++++++++++++++++++++++++++++++++++++++
>>tests/meson.build    |   1 +
>>2 files changed, 148 insertions(+)
>>create mode 100644 tests/intel/xe_pmu.c
>>
>>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>new file mode 100644
>>index 000000000..cbb825755
>>--- /dev/null
>>+++ b/tests/intel/xe_pmu.c
>>@@ -0,0 +1,147 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+
>>+/**
>>+ * TEST: Test Xe PMU(Performance Monitoring Unit) functionality
>>+ * Category: Metrics
>>+ * Functionality: Power/Perf
>>+ * Mega feature: Performance Monitoring Unit
>>+ * Sub-category: Telemetry
>>+ * Test category: Functional tests
>>+ */
>>+
>>+#include "igt.h"
>>+#include "igt_perf.h"
>>+
>>+#include "xe/xe_ioctl.h"
>>+#include "xe/xe_spin.h"
>>+
>>+#define SLEEP_DURATION 2 /* in seconds */
>>+const double tolerance = 0.1;
>>+
>>+#define assert_within_epsilon(x, ref, tolerance) \
>>+	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
>>+		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>>+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
>>+		     #x, #ref, (double)(x), \
>>+		     (tolerance) * 100.0, (tolerance) * 100.0, \
>>+		     (double)(ref))
>>+
>>+static int open_group(int xe, uint64_t config, int group)
>>+{
>>+	int fd;
>>+
>>+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
>>+	igt_skip_on(fd < 0 && errno == ENODEV);
>>+	igt_assert(fd >= 0);
>>+
>>+	return fd;
>>+}
>>+
>>+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>>+{
>>+	uint64_t buf[2 + num];
>>+	unsigned int i;
>>+
>>+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
>>+
>>+	for (i = 0; i < num; i++)
>>+		val[i] = buf[2 + i];
>>+
>>+	return buf[1];
>>+}
>>+
>>+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>>+				 const char *event)
>>+{
>>+	int ret;
>>+	char xe_device[100];
>>+	uint64_t pmu_config;
>>+	u32 start, end;
>
>end is unused, not sure if the c6 patches use them. If unused, then I 
>recommend just dropping it from the helper as well and s/start/shift/.
>
>>+
>>+	xe_perf_device(xe, xe_device, sizeof(xe_device));
>>+	ret = perf_event_config(xe_device, event, &pmu_config);
>>+	igt_assert(ret >= 0);
>
>Well, I commented on Vinay's patch to assert within the helper, so 
>these checks can be removed here. If that happens, then please drop 
>the return value checks here. If not, then checks needed below as well 
>at (1) and (2).
>
>>+	ret = perf_event_format(xe_device, "gt", &start, &end);
>>+	igt_assert(ret >= 0);
>>+	pmu_config |= (uint64_t)gt << start;
>>+
>>+	if (eci) {
>>+		ret = perf_event_format(xe_device, "engine_class", &start, &end);
>(1)
>>+		pmu_config |= (uint64_t)eci->engine_class << start;
>>+		ret = perf_event_format(xe_device, "engine_instance", &start, &end);
>(2)
>>+		pmu_config |= (uint64_t)eci->engine_instance << start;
>>+	}
>>+
>>+	return pmu_config;
>>+}

also s/busy/active/

>
>Thanks,
>Umesh
>>+
>>+/**
>>+ * SUBTEST: engine-activity
>>+ * Description: Test to validate engine activity stats by running a workload and
>>+ *              reading the active ticks and total ticks PMU counters
>>+ */
>>+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
>>+{
>>+	uint64_t config, busy_ticks, total_ticks, before[2], after[2];
>>+	struct xe_cork *cork = NULL;
>>+	uint32_t vm;
>>+	int pmu_fd[2];
>>+
>>+	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>>+	pmu_fd[0] = open_group(fd, config, -1);
>>+
>>+	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>+
>>+	vm = xe_vm_create(fd, 0, 0);
>>+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>>+	xe_cork_sync_start(fd, cork);
>>+
>>+	pmu_read_multi(pmu_fd[0], 2, before);
>>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>>+	pmu_read_multi(pmu_fd[0], 2, after);
>>+
>>+	xe_cork_sync_end(fd, cork);
>>+
>>+	busy_ticks = after[0] - before[0];
>>+	total_ticks = after[1] - before[1];
>>+
>>+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
>>+		  busy_ticks);
>>+	igt_debug("Total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
>>+		  total_ticks);
>>+
>>+	if (cork)
>>+		xe_cork_destroy(fd, cork);
>>+
>>+	xe_vm_destroy(fd, vm);
>>+
>>+	close(pmu_fd[0]);
>>+	close(pmu_fd[1]);
>>+
>>+	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>>+}
>>+
>>+igt_main
>>+{
>>+	int fd;
>>+	struct drm_xe_engine_class_instance *hwe;
>>+
>>+	igt_fixture {
>>+		fd = drm_open_driver(DRIVER_XE);
>>+	}
>>+
>>+	igt_describe("Validate engine activity with workload running by reading pmu counters");
>>+	igt_subtest_with_dynamic("engine-activity")
>>+		xe_for_each_engine(fd, hwe)
>>+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
>>+				      hwe->engine_instance)
>>+				engine_activity(fd, hwe);
>>+
>>+	igt_fixture {
>>+		close(fd);
>>+	}
>>+}
>>diff --git a/tests/meson.build b/tests/meson.build
>>index 33dffad31..d20f50766 100644
>>--- a/tests/meson.build
>>+++ b/tests/meson.build
>>@@ -309,6 +309,7 @@ intel_xe_progs = [
>>	'xe_pat',
>>	'xe_peer2peer',
>>	'xe_pm',
>>+	'xe_pmu',
>>	'xe_pm_residency',
>>	'xe_prime_self_import',
>>	'xe_query',
>>-- 
>>2.47.1
>>
