Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7755FC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 08:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127910E551;
	Tue, 15 Jul 2025 08:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCCmC3MD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6110E551
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752566801; x=1784102801;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YEP1PCbgyp/Jq7XMzmEZzeANM9EOURjuSmVWXGOrbpE=;
 b=KCCmC3MD8Genta35+HuRj2pT4Uofh3n+W7S+4UWn1V/M8V4VnhHuGu7S
 sxfydRqlOdtx1to3z7x+tEyJMG83xHR2lMka/TDy0EYS7DMj8EhsHJ0sZ
 zI0UKsmX2zV1SuwCU47OzHpaG+ppxrjWSjKr8psTLx/JObrL8kgxElxGv
 n3QMp/yh5jAbvOhilQ6RwkrvQwCWTeV/PzDEQ5myi656zINve5gW2tpv2
 7CkPECOGP4M10jD5B6UemMD7YZvl0Iy7Vdrgkcu3tmrosyQQlJWapQaCf
 ThTfu95Xu/C0Wg8DSCZsjG+CC0AarkOXYAg//kVqnCfvkHZXLSPGHfa/l A==;
X-CSE-ConnectionGUID: fL+FfQV2QvCOv2dGaNKLfg==
X-CSE-MsgGUID: q24Z510BSbmxQEcjCeKWKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57386621"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="57386621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:06:40 -0700
X-CSE-ConnectionGUID: sTus41jBQbOzS35NVN5aNg==
X-CSE-MsgGUID: 1pyAZVwfSEeH1crUC2vnCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156808426"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:06:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 01:06:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 01:06:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 01:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHQ3AdEfvZjHYTplqyRLX+vX26StxLRNLZ+yCeAX4OXEd7mlQx9Khg9QvEUNsvzI6imQ+Bqx6+H+CufRO5ZVHcbnEJS/+e2kG9llTScW0WuJJzwgViddxwzJalfb/gokJFnD2ia29b/+WBbTALO3814qHDRlDr4GuOTVxjok84Lcye7id+mhW10EgGNyiXTs/MFecWXddZYVgpQ+86YjR/aa10PmsOAhbll7VrL28jaczMjkIgXNU7dlJBpa7N4tCMkK2zB00/X+ENpLLCITkzruSU1Vul7/MG4HNlGKVXaCwk5wDZpU+IAAEnE4hjewGwl5tM/8cg3iPmzrDK67Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihX6KmaIgZKuA8sjWWOeXDCTPaD7xShiMGorxnfMgQY=;
 b=nLLsHujlwVTJDZ7ljus5hrphhoEGVdsoRWPdfxxEJ0b0Bt1aLbEAhzFcjEmJmNHKoz2TbHLtFfJFgi/e6iNlpv/JBTREMgQ2YVwWX5UwWa36qVa4hOItLj4Hv0gtwHAUqhLfDBJ7xxH+xVquXegm2u9lhZDQgbqOg/gjTE4bfVlRLboeg3l9duaE4CXsDWRwSnFhX0Ad4ZD7D9hmDsjszGL8AE7V2GHqS7JaPLYxuFe6Ata6Za8D+QgTAyC5v2B85Qs+eNmIZ5uoqp+PEkFlXOkeQp9tiw/Pf9LuHAiKjI339ZPfKlR8A41sbjUD5n4UM1y2nDyAqJ//+6ZX1aKxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 08:06:02 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%4]) with mapi id 15.20.8880.027; Tue, 15 Jul 2025
 08:06:02 +0000
Message-ID: <1a94f2f5-f993-487a-b7ca-e9354dfbe05f@intel.com>
Date: Tue, 15 Jul 2025 13:35:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
To: Matthew Brost <matthew.brost@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250714170309.2949211-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 886d26da-02ec-41b4-5da9-08ddc37670ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXloUWZxK3hwaHNwMENQVndtRE13NWZ4eG14c1E2R3RkK29kOHRuTys0ZGRx?=
 =?utf-8?B?U21tem9qdU1zTkVWLy9WaThhSHU3ZnQ0VkZpU3k0QTlYV0ZwdWZtMVl4Uk1L?=
 =?utf-8?B?TGY4V00wTG5QdXNLWld5dm9hMEFsSDY0eVd3U05MSndNdFJucHl1dFYycmh6?=
 =?utf-8?B?RnFpbUR0TmRxQUE3MjdKZlFBanRnY3Z5c3AvTCtoUDJRQ1FMWnI2UWp1WlFn?=
 =?utf-8?B?dFBNVTFqaTZPVmJaU1BUNXJhd3JsYlhTaWpRRCtXYmJDNWhQT0VDRTFhS3RR?=
 =?utf-8?B?azd1QTBVbHMzeW5zRVIzbUtEa0dxNDBoOHJrczRqa28zNWw4MUN6SlNIekdP?=
 =?utf-8?B?L3NKb21UQTcrclp5aXlEbC9xUlljTjNHaFRSY3BSR21yNWo2VTdOUnM2cmN4?=
 =?utf-8?B?MDRobjdPOEgwcGlMYWlhUUtpWklJQm8ybWxOQ3dCUmh1VXNvdUZMSFRLZG5K?=
 =?utf-8?B?cG8zeEFFWVFBRXkxamFDaUFjNnJrZjZvNXpMNlN4WE5pa2xOTU5Sa2VjUlZV?=
 =?utf-8?B?bXJVN1F2Y2JxeTgrVXQyRHVCWXFDUGJCaGxKNzJHOWNzcFEwNmJ2aWVXeXY2?=
 =?utf-8?B?dkxha1dkRXR4S3hYOXh3OCtHWHo3eFhrWFF2Tks4Ujk2eGtENlNLZjlKZTlT?=
 =?utf-8?B?bnVOcUJ1dGJCekVHK0hLUlplbmc1V3l5dUpTNXRwOFlpZjdqZmxsdFZJL0J0?=
 =?utf-8?B?M01ydFJXQVlXeEorbDVGalJtWmRuL1ZtQnZiSDhrSFdDZUc3eUNDSWNVMXp0?=
 =?utf-8?B?c0RiK1NZOFF6aW9halBTOWV6d2NmVUlPVnd5cHloVGk0Z3I5R2xOUUNHNVd3?=
 =?utf-8?B?ekZSc3liWjlHclR1NUEvTzhmNU9qTVNBTTRaSC9zYkxTeDJzalFZbUVieXY2?=
 =?utf-8?B?SWRvaE1lOXdPSVg2TVJYK3QzZnQ2R3Ftb0FhSTkrNm5NSGxpMllSWW9tMGt4?=
 =?utf-8?B?WmZlMFpVSGVkWkFCbTRMRUZNZHFvUG5EYnNEUHlxZ2VpRk5jWEE3aWRQdEFK?=
 =?utf-8?B?UTl5MUZ3NGRNb1FnQUFMOEsxV21oZStOYVF3OGVWN0xCNExpajR6d0xXd0RF?=
 =?utf-8?B?L1RYWkpMUnRCajdneTJ4WDQ5aEpPbWlXenZPL0JBNTIyYnVSd3pobm1tcUF1?=
 =?utf-8?B?SElySlBOaDFMZUdON2FpaEJ6WGpFdzFNelZZdWtSTHBoMmpPUzZuMG5pNlhM?=
 =?utf-8?B?TU8wVHduUzBMSUx0S3ZHdnJMNWlGM2ZSVjl4Z0JiYlloQ3gvVG1sK3JTZG4x?=
 =?utf-8?B?R09LWnM0cGFGVXlpQ0tPZ1JxV2hveWg2MTZKVmFvSTdEeGVJd3FQQkRmUW1D?=
 =?utf-8?B?cTBlZVIxanhxYjlIbE9Ib0FRY0twZ3NCNmxJWGpYQWFhZkVXdUJJKzN1Yk1O?=
 =?utf-8?B?U242eHNISXdXK3UvdHBmMGRqa2JCc2xtWHJTWWFPSlFnVGt3Nzd5dVZmUDFB?=
 =?utf-8?B?aXRScUdQOGU5SkRqN0I4L1NkaS94ZFEvVkR2UVY1M25qZlNGeW1hbzh0L0hW?=
 =?utf-8?B?d3Fyekg4aFNXVkw5VDlncXBraGp5YlhZNDFRZFE1a3VSbnFUanR0MzBZbis0?=
 =?utf-8?B?MmZTOWdPZElNNWkxS0NVYnB5dzNCeEE1Ry9KcEdtRUFBL0QzQ1NQMEs1amto?=
 =?utf-8?B?NXFzR3NqckV5U2NGb3NLbnN1K1RmQXM4WEFRbXpOb0RQeG5pdUc0WFhtQXBV?=
 =?utf-8?B?d2RLMFZHRG9ZV21CaEFKMUN0Q0ZMSGEraVdjTU5Id0RsMlp4QmF6ZkRyOW01?=
 =?utf-8?B?cXJwMC9hVldidnVlcXBQL2lFZUZZbkY2SHRrTmZUVmp2UVRCTEo3N0I3SWxL?=
 =?utf-8?B?QzhpM0dTZ0h0NmFRWHA1ZnYvTlNYZHkxcXI2bTQvRmg0OWsxdzhBQTBhWmIr?=
 =?utf-8?B?ZEVmS01FVDM4eXpneXNVVytLQ1F2L1BaY1ZyVnJjUE04UHF2WHg1bXBQY2li?=
 =?utf-8?Q?coJr+F5Vkzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2U3ZmJIdGZwbzNTNE5nUmRDMGYwbnRDTUxKcWVQTi9hdjlmYmtBa0dTZ2RM?=
 =?utf-8?B?SmtNWHZlcnppaTRlblNWcGovNkRkdVFFcGc3T3NVKzFpTG9mOEpNbjFPUHBO?=
 =?utf-8?B?a0ZPUjVQK2Z3OWVZeGNyWTZhZGRpSDdnQ1d1UURPc2thZm8rdmlNWkd4dy8y?=
 =?utf-8?B?RE9SdGtQaUw4bDJDUDgxcXpudVkvcVhoeU9sU1M2S2tON1AxdC9KZ0NKOTd1?=
 =?utf-8?B?NFhCMXlkdzRpM1QrVHRPbGJodlpReTdTS2NNTndKL3VJbVFTdXhleTBpQU5F?=
 =?utf-8?B?TFpYU3dMZndrZ05CT0k4UHJnMWpQalJtdExGcThDcEpFWVRyS0RYRFJ4SXdm?=
 =?utf-8?B?SWhKSmJYM2tTbFJhejNrcUdXeVJkQnVHVjA0YnJtMHVqWnRYTEE0NXVodWZT?=
 =?utf-8?B?dUcwd1lNb3dBNExHRFg1cWtaRWhoMDgvQzBjeHFJWUZMSGROL0dGcXU4dXpF?=
 =?utf-8?B?blB0Nzk3ZlRpaEFraDBwUU84aXF3L2ZkRjc5dHozZWtkZXFYZ0NMdTRoRkt3?=
 =?utf-8?B?bXdKNkdRSG9jbW9MK1ZaTW1hakhUaEtoaDBESHRHTCtvdDBUUkhBUWZYcm44?=
 =?utf-8?B?aFFWRzFiSzNrK3ovOXk3MWlWNWNJeWQ4ZzlCbHFraC9NMnJ2ekJVbGduWTBM?=
 =?utf-8?B?R0hzbi9GaTlUR1N0dlFEQzJNbHJyL3RvQXNORnpHVGtTQndjMkRJamVSZG1R?=
 =?utf-8?B?VGhWQXNCb0krWCtCakxBcVVoZ3hWR21uQ1V4SUxNaGg5dnQ3VjVLYjk0N09a?=
 =?utf-8?B?RSsvU1M0VGFaUjVuY20yVkJubjZ0S1Q2WkhRTnVaWTJES0ZHRjlnNjhtaUN3?=
 =?utf-8?B?blR1S1k5OFNlNVdDMEtTYlk1aXJDWFhnRUNta01zUGlob0RjWFgwellOVlp2?=
 =?utf-8?B?dEhFNGdHV2FDSnUzNU5STnBVaEpTQlYrNjFCWEVuSG9xcy9halNLa0tycHVk?=
 =?utf-8?B?elVHNlpPci9PL0lacnZKMVBLQkcrQ0JkMXN3aldEV2daZ3dXUXZXNUJHYVhu?=
 =?utf-8?B?MW10bGJQN0VHL3pqb1VWR05TNWJLeWdGWnBQZFJNYytTZGRqbFVtTDQvbjhk?=
 =?utf-8?B?SXJncHEyOWdFMzg1WjY4TGtIcHR3TFc4RzBOQzk0Mk9rS0p6cmd0SW1pOWo3?=
 =?utf-8?B?eEtDQ2U3VW5WSUNJZllyMDJxU012b2xOWDBnRmZzMVUvNVBUcW5Oa3NKVEM2?=
 =?utf-8?B?WHJwS29SZThHM1U2MkhWYXRqaHN0UDlrNmlOdnkyZ0FFaUxzTlluak5sN2U2?=
 =?utf-8?B?dExUTzlXNDRTVVRRaXhvY1hKbStpTTluMlorOVBLdEtuMnFqSUNWN1k3UlJl?=
 =?utf-8?B?TEp1anplUFh6Qm9BRjFMSHd2TkZrMkRCVFNvRHkwYXhjZE1qanplZ3YzTEU3?=
 =?utf-8?B?L2pkWjJJTS9NeGhJQXliczdIcTIwOGJKcGpzT2d0WE5jSDJLaWpxWng5clh3?=
 =?utf-8?B?V0R2RkprZGs2ck5BVy80cjFuSWp6OVY0Y0NqSjZUNDhIdllQU2NVZzc1MXh3?=
 =?utf-8?B?dlJzbjZyR3lHb2NLamI5WW9LRjlJakxKS1FkcXlMajBYL0JNM3FwekMxeWsz?=
 =?utf-8?B?b3FZMnFaeWg0ODlRVCtZWThlL0VHRERyNmJmWTJKeGo3QlJtQUJLeHZNNUE5?=
 =?utf-8?B?RU9hT2szOGVNUjcxMzVyQklzTmxkSTJSb2pyMStZaUI2d3ZzZnVZVmw5YVRk?=
 =?utf-8?B?NkRJOHE4RGw4ZUJiYWpMQUM5SzJ3K3FYaWxRM0RHQWZLY2ExZFo1Q25ndmps?=
 =?utf-8?B?MmdGV0ZQU2pyTFlwcVloLzl4N3RLbFdpV1JwbGZDNjI5NWg0MUZXUG5ETEo0?=
 =?utf-8?B?TGVGN2pWVUlyS25rWjJFa2tCVmlXMHJacnZpNVNZQi96RUNrQk0vblV2eGV3?=
 =?utf-8?B?VEFDMHVRaTE0UGdIbWEvQ1dtRkttbjl3RnhPQ3hSQ2JrVXNBSUx1WTIvSTB2?=
 =?utf-8?B?azJ6NndoVGhXMUwyakhQMVBqdUxua2FNTjJtcDZnTEVEdVExZkRMQk5tY1Y2?=
 =?utf-8?B?M2g4bGtnMGVvcGdZcDlaRVFoVExDRXJ2VHFMOE5CQ3VUUjFTanUzcjJpbVRs?=
 =?utf-8?B?VHZzaVdyWDNWSk5ZT3p5S3lQRXgzcGxqLzlOMUpRTGNRTnIwS0ZiR0VRKzV3?=
 =?utf-8?B?WmFOSVpnQ0o2L01iSVRmdHBuckNhbkZNa3d3TDBmbEkvSENtcXZWU01hTHVm?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886d26da-02ec-41b4-5da9-08ddc37670ea
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:06:02.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEhbWD2ZOve4VHlycgoPn/9nP++epoBMxPPyBmVgFPA/gSnmaGQYlBqUBmSq7Br6A52tBtd2xq71wYaZG47bVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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


On 7/14/2025 10:33 PM, Matthew Brost wrote:
> Update the test_exec() function with flags to initiate and understand
> prefetches. Prefetching is tested by verifying that the fault count in
> the GT stats has not  increased. However, a mismatch does not cause the
> test to fail—instead, a warning  is printed. This is due to the
> unreliability of system allocator behavior; the  added sections
> primarily serve to ensure that the driver remains stable.
>
> That said, if the page fault counts are consistently incorrect, it may
> indicate a  problem in the KMD.
>
> A prefetch benchmark section has also been added to help profile
> prefetch behavior  in the KMD.
>
> v2:
>   - Prefetch initial buffer on SRAM devices (CI)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
>   1 file changed, 116 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 65d281c784..f8d144328e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -21,6 +21,7 @@
>   #include "lib/intel_reg.h"
>   #include "xe_drm.h"
>   
> +#include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include <string.h>
> @@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   #define SYNC_EXEC		(0x1 << 19)
>   #define EVERY_OTHER_CHECK	(0x1 << 20)
>   #define MULTI_FAULT		(0x1 << 21)
> +#define PREFETCH		(0x1 << 22)
> +#define THREADS			(0x1 << 23)
> +#define PROCESSES		(0x1 << 24)
> +#define PREFETCH_BENCHMARK	(0x1 << 25)
>   
>   #define N_MULTI_FAULT		4
>   
> @@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * arg[1]:
>    *
>    * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
Length crossing limit of 100 columns
>    * @malloc-multi-fault:			malloc single buffer for all execs
>    * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>    * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
>    * @malloc-mlock:			malloc and mlock single buffer for all execs
>    * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> + * @malloc-prefetch-race:		malloc single buffer for all execs, prefetch buffer before each exec, with race between cpu and gpu access
Length crossing limit of 100 columns
>    * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
>    * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
>    * @mmap:				mmap single buffer for all execs
> + * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
Length crossing limit of 100 columns
>    * @mmap-remap:				mmap and mremap a buffer for all execs
>    * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>    * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> @@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
>    * @mmap-huge:				mmap huge page single buffer for all execs
>    * @mmap-shared:			mmap shared single buffer for all execs
> + * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
Length crossing limit of 100 columns
>    * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
>    * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
>    * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
> @@ -907,6 +916,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @free:				malloc and free buffer for each exec
>    * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>    * @new:				malloc a new buffer for each exec
> + * @new-prefetch:			malloc a new buffer and prefetch for each exec
>    * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>    * @new-bo-map:				malloc a new buffer or map BO for each exec
>    * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
> @@ -941,6 +951,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
>    * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
>    *
> + * SUBTEST: prefetch-benchmark
> + * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> + * Test category: performance test
> + *
>    * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
>    * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
>    * Test category: stress test
> @@ -998,14 +1012,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>   	struct test_exec_data *data, *next_data = NULL;
>   	uint32_t bo_flags;
> -	uint32_t bo = 0;
> +	uint32_t bo = 0, prefetch_sync = 0;
>   	void **pending_free;
> -	u64 *exec_ufence = NULL;
> -	int i, j, b, file_fd = -1, prev_idx;
> +	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> +	int i, j, b, file_fd = -1, prev_idx, pf_count;
>   	bool free_vm = false;
>   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
>   	size_t orig_size = bo_size;
>   	struct aligned_alloc_type aligned_alloc_type;
> +	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
> +	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> +	uint64_t prefetch_ns = 0;
> +	const char *pf_count_stat = "svm_pagefault_count";
>   
>   	if (flags & MULTI_FAULT) {
>   		if (!bo_size)
> @@ -1136,6 +1154,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		memset(exec_ufence, 0, SZ_4K);
>   	}
>   
> +	if (!(flags & FAULT) && flags & PREFETCH) {
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +
> +		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> +		prefetch_ufence = aligned_alloc_type.ptr;
prefetch_ufence is u64 * and aligned_alloc_type.ptr is void * and should 
be typecasted. aligned_alloc_type = (u64 *)aligned_alloc_type.ptr
> +		igt_assert(prefetch_ufence);
> +		__aligned_partial_free(&aligned_alloc_type);
> +
> +		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> +					     bo_flags);
> +		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> +						  to_user_pointer(prefetch_ufence));
prefetch_ufence  is u64 * type and xe_bo_map_fixed() returns void *. 
Should be typecasted (u64 *)xe_bo_map_fixed();
> +
> +		sync[0].addr = to_user_pointer(prefetch_ufence);
> +
> +		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
Shouldn't test continue executing if pf_count_stat = svm_pagefault_count 
"stats" file is not available in "/sys/kernel/debug/dri/%d/gt%d/? In 
current scenario if stats file not available it'll assert but that 
shouldn't impact further IGT subtest execution.
> +
> +		if (flags & (RACE | FILE_BACKED |
> +			     LOCK | MMAP_SHARED | HUGE_PAGE) || !region) {
> +			region = 0;
> +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> +					     1, region);
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +		}
> +
> +		if (exec_ufence) {
> +			xe_vm_prefetch_async(fd, vm, 0, 0,
> +					     to_user_pointer(exec_ufence),
> +					     SZ_4K, sync, 1, 0);
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +		}
> +	}
> +
>   	for (i = 0; i < n_execs; i++) {
>   		int idx = !stride ? i : i * stride, next_idx = !stride
>   			? (i + 1) : (i + 1) * stride;
> @@ -1186,6 +1241,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		if (!exec_ufence)
>   			data[idx].exec_sync = 0;
>   
> +		if (!(flags & FAULT) && flags & PREFETCH &&
> +		    (region || flags & (NEW | MREMAP))) {
> +			struct timespec tv = {};
> +			u64 start, end;
> +
> +			sync[0].addr = to_user_pointer(prefetch_ufence);
> +
> +			start = igt_nsec_elapsed(&tv);
> +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> +					     1, region);
> +			end = igt_nsec_elapsed(&tv);
> +
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +
> +			prefetch_ns += (end - start);
> +		}
> +
>   		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
>   			addr + (char *)&data[idx].exec_sync - (char *)data;
>   
> @@ -1277,6 +1351,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   				} else {
>   					igt_assert_eq(data[idx].data,
>   						      READ_VALUE(&data[idx]));
> +					if (flags & PREFETCH_BENCHMARK)
> +						memset(data, 0, bo_size);
>   
>   					if (flags & MULTI_FAULT) {
>   						for (j = 1; j < N_MULTI_FAULT; ++j) {
> @@ -1359,6 +1435,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		prev_idx = idx;
>   	}
>   
> +	if (flags & PREFETCH_BENCHMARK)
> +		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> +			 1e-6 * prefetch_ns,
> +			 bo_size * n_execs  / (float)prefetch_ns);
> +
> +	if (!(flags & FAULT) && flags & PREFETCH &&
> +	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
> +		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> +							   pf_count_stat);
Same comment as in case of pf_count above.
> +
> +		/*
> +		 * Due how system allocations work, we can't make this check
> +		 * 100% reliable, rather than fail the test, just print a
> +		 * warning message.
> +		 */
> +		if (pf_count != pf_count_after)
> +			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> +				 pf_count, pf_count_after);
> +	}
> +
>   	if (bo) {
>   		__xe_vm_bind_assert(fd, vm, 0,
>   				    0, 0, addr, bo_size,
> @@ -1370,6 +1466,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		gem_close(fd, bo);
>   	}
>   
> +	if (prefetch_sync) {
> +		munmap(prefetch_ufence, SZ_4K);
> +		gem_close(fd, prefetch_sync);
> +	}
> +
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
>   
> @@ -1435,7 +1536,7 @@ static void *thread(void *data)
>   
>   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
>   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> -		  t->flags);
> +		  t->flags | THREADS);
>   
>   	return NULL;
>   }
> @@ -1553,7 +1654,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
>   
>   	fd = drm_open_driver(DRIVER_XE);
>   	test_exec(fd, hwe, n_exec_queues, n_execs,
> -		  bo_size, stride, 0, NULL, NULL, flags);
> +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
>   	drm_close_driver(fd);
>   
>   	close(map_fd);
> @@ -1604,14 +1705,17 @@ igt_main
>   	struct drm_xe_engine_class_instance *hwe;
>   	const struct section sections[] = {
>   		{ "malloc", 0 },
> +		{ "malloc-prefetch", PREFETCH },
>   		{ "malloc-multi-fault", MULTI_FAULT },
>   		{ "malloc-fork-read", FORK_READ },
>   		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
>   		{ "malloc-mlock", LOCK },
>   		{ "malloc-race", RACE },
> +		{ "malloc-prefetch-race", RACE | PREFETCH },
>   		{ "malloc-busy", BUSY },
>   		{ "malloc-bo-unmap", BO_UNMAP },
>   		{ "mmap", MMAP },
> +		{ "mmap-prefetch", MMAP | PREFETCH },
>   		{ "mmap-remap", MMAP | MREMAP },
>   		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>   		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> @@ -1626,6 +1730,7 @@ igt_main
>   			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
>   		{ "mmap-huge", MMAP | HUGE_PAGE },
>   		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> +		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED | PREFETCH },
>   		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
>   		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
>   			MREMAP | DONTUNMAP },
> @@ -1640,6 +1745,7 @@ igt_main
>   		{ "free", NEW | FREE },
>   		{ "free-race", NEW | FREE | RACE },
>   		{ "new", NEW },
> +		{ "new-prefetch", NEW | PREFETCH },
>   		{ "new-race", NEW | RACE },
>   		{ "new-bo-map", NEW | BO_MAP },
>   		{ "new-busy", NEW | BUSY },
> @@ -1801,6 +1907,11 @@ igt_main
>   			processes(fd, 16, 128, SZ_2M, 0, s->flags);
>   	}
>   
> +	igt_subtest_f("prefetch-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> +
>   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
>   
