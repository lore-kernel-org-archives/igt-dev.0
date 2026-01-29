Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DFFD358E4
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1610E83B;
	Thu, 29 Jan 2026 08:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG/hnysh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CCC10E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769677139; x=1801213139;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OvKIkykVvi9+aD8cakSSF5kw8rff/AKP24fcMadZp9U=;
 b=XG/hnysh8dC+IQekdLdeFrJNsghukOtmnHck3uOxTljdrXt5qH0CbMmV
 A6zgQq1BwA+LtMRKjrubdb3lJxQidj7uphyy5mU3Z4cT7IUOk4usAxbny
 pzEw7xwcF6QleNNRgEBZG/FcCNc96rqZlJuoC81fLaAZbzYYYvrqXDZ/X
 2aVjcXDt3w0KT6aG3GlmBHyOtjQ3935OUXjfHIYM2aFFADG/j9Scfg1S+
 2FtTE5KIkOMfYVZQtmU+5dFq9l5BR+T3F7wPjcL+IhUMM3+THUh5uN7/K
 dA53G+Ar9Uy6X5WTaaBaL19RsTYhwQcLpRB93XT5Gx+gXXI8O2+CTagjI g==;
X-CSE-ConnectionGUID: jC6cdtqeSJiPYJJxFb2MEA==
X-CSE-MsgGUID: 2suInTVCQ+usvNx+CSpukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74767810"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74767810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:58:59 -0800
X-CSE-ConnectionGUID: yuYr/kTKRLiZ2diSUdBStA==
X-CSE-MsgGUID: vUUMeQR5QB2Bkm0WWWqBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208411954"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:58:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:58:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:58:57 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:58:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpI93CfAXy76FlXz3MftwhnOlPGT0AaGXyekMrqLaGaZYizTz9BBKJltHbh9lTV2/Tg4nOFUM60az6GDjDuk9ExQVX02aVf+qru+19x668T/5Ow/Nu+8zBlQQfBYiOr0fsHhxiod/PhjlXp2yJqw//OIgKCT/ntoaV5XZeyLSkN1r3D4kyC0fG8+MOFArS5RcUwOv1rLZtfJPq4KfIeNhfbfmLRP2RhRoyusEdDTGamdX00oh7tFVjtLOaIqQ4OANLrmNgpkHAX7He9C4Gc16fs5Wn64Yafe1DBuiYRmOf64JN0+OCJeG2nEUKG5BIpygfNcOiotIAzsh1+I3YkqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w194niNTOAF7geLG1X6c2Xj8mvILDxJPJr+eOLNElDo=;
 b=KLnGOwePOMCjHKYvAsaXfdeZbPrg65HKcuogXoytXPTs+hhN47t2a3JkPTd67hgh8Y/agXukUMetzhFBv9rduEyVxt671e0I+3V3Y56SmqBh/bis0Pgn9KJ9MRhhViexi8gUwfNN5mbvDrchFWDYnMDGkmgKbUJP2LEWPBrycaatrdg74h0jn0mOjgcFi48qCmU+0nCkxKDrf3FGx4/g3zil1fAup1OXyQp3rN3BxKFymwj4bE9zW3euLtthEQILPHyM5ioLL6ximI4WkShaH11BMlnz9RRx0Bzu5wXymsfmdoon8oFdiTEGemJkfuEpUh0mKPhubMeBX7IocMis4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 08:58:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 08:58:53 +0000
Message-ID: <19323a1c-f232-4913-9f94-b0b85a99f156@intel.com>
Date: Thu, 29 Jan 2026 09:58:49 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHhlX2V1ZGVi?=
 =?UTF-8?Q?ug=5Fonline=3A_Fix_test=5Finterrupt=5Fother_wait_logic_=28rev4=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260128144626.452925-4-piotr.rudnicki@intel.com>
 <176964057605.202811.18386434020176028769@a3b018990fe9>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <176964057605.202811.18386434020176028769@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::13) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 0078062d-fd06-4875-10ee-08de5f14a082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWsxOHpRNWRZSWg3ekllK0dkLy9zQ0liYWYxMFFZQWFFSEYrRkpmZHI5Qksx?=
 =?utf-8?B?WTRGMHUycGQvMGNmazdFbzQ3TjlZWFBiYWh3aXVBS3pFS1lBWVNBalowZ0l1?=
 =?utf-8?B?Z0c2M3ordmV4SksyQUdSUEZJV2F5N0t5K0ZWRnk4cnlOaFNqaG5FUytJRFFo?=
 =?utf-8?B?QmJLYmI2THZhRFhLM1JYaFhyTEEwR3ZrLzY2QndlZ0dZQThOdjJzYVlhZmZ6?=
 =?utf-8?B?djdRUEdnRDdDa2tvS0l6VXlxdUdsTjN4ZmdCKzhOcmxlQnBKODd6RTgvZ2dI?=
 =?utf-8?B?czdQanZRMUY4MGhubW5TZUY5SXV2V3JjU0tZT09UL01CY0J2cVpLVzVKRGdP?=
 =?utf-8?B?MjcvRmsrMkE2ZzZZMFNqRFBBTWxMb09uL25rRUVuNkJpNFZERkxRbmJ1d3VG?=
 =?utf-8?B?TDA1ZXFrcWVsc0MyYW1qeFFxR3NnT1NXYVdsT2pMcmhOZmNLR3g0enZveld6?=
 =?utf-8?B?YkFUaTFjWjkrUGV1N2lYK1FmZEdJRldLSm5QV1owUSt1UVAvenJWVXJBRFZC?=
 =?utf-8?B?VVNEMkVvS1haelhOai91OGF0QThPWndxb3JiZzVQcVBGQ0wxdjVIcno0SWRx?=
 =?utf-8?B?cGhwcDZxNG5FdHBsY1VnT0dqWkFaVzYrb1dGL2pWVmVOb2huanUwdjVUV2N5?=
 =?utf-8?B?cW1HTjF6WGo1S1B6OVIzM3ZHUkNadzNoZ0FvN1ZvcEpxTE1DOWJFYUJsUFlX?=
 =?utf-8?B?Q2hZZ2lZa2t5WnJVWmpoOXpkemxSRG5rdC9FUzNlUElETWlYTDg0T0VOSzB4?=
 =?utf-8?B?N0t4QkRtSktmV25lOGdUOUJhaGs0ekI5UXNLcFlKVUhCMjFiUWdxSkcrZVV1?=
 =?utf-8?B?VENlaWxYV21uRXRQemJzN1VwZlBMZ3QxUGpFOSthV1JMWkVMRXBGQjNhVWow?=
 =?utf-8?B?TE5KN3djRmtpbFFLTjZPUE41ajF0OVl6QVR3aWk2clo0ZzhCN0F4Ny9KZjRL?=
 =?utf-8?B?YUw4NlZpOU5sVGFmck9kdmRGVmVYTXM0eks3VVF0THlXY3BzcVZOcEFhbENO?=
 =?utf-8?B?cHNiTlVrbllkMFZ3dmgwN1dOakJZK0JFQjBnMTgydkdIU3N4NmxZeUEyWGIr?=
 =?utf-8?B?QVlya2dWejR5SFI3ZUJwRjJYQnpRVkkvSW9KK0IzTlRzYnE0Mjc0ZEJjMVRl?=
 =?utf-8?B?NFdFcHRwSjBOeFBmQThJaC9qYjFZWTM0UGsyNlNZRVJJcDRKTWxkeVIwQ0FT?=
 =?utf-8?B?Sm0zaDlCSGVRUHQzc2lTSFJNWFdyRVlvT1pLZmdDeWJvc21sNWU3K2VtL1NS?=
 =?utf-8?B?ckJuZ0xxd25PVnkvd081a0JiMHQ2cWwwTGdkZGEwNnVld3JyZXlibHFsQVpY?=
 =?utf-8?B?SnJ0ZVRvTWJuVVFYeHk4US9wVTQrbFZTSGlNaE5PNGFHNHVFb0t4Zkdsd3Nh?=
 =?utf-8?B?dGNvVi95bWQ5a2FXUml1STQzM2lrVUg4cmZTRGx6OEViUGNxOEwwcVhXS2t2?=
 =?utf-8?B?bW5xcnZPQUIyRXpxSDIyUkp2VC96dnhIbkszaVFZOHBMTEE3T0xOZDlmSG12?=
 =?utf-8?B?SmZscktDU1VHMkdHeFc2eGRoU2RlQ2FSQlduMWJBY3BJblBUUjhTYVBuUFdM?=
 =?utf-8?B?RlB5UmF5RUpOTjlnS09ZSE15S3VRN08xSHcyd3VBTjVIVmFsTVQ0cE02SndW?=
 =?utf-8?B?T3JEc04zcFFHSmVWTUhlMVZhc3RkL2hTWi9ZeDFXaCs0cmY1ZnorQVlENDZo?=
 =?utf-8?B?WVlWSTlIY0pKTEsyaXZwWlcvckJ1RE5SQU9KTzhuSUJrSUs0dnJzdEpyRERG?=
 =?utf-8?B?TkgyNk0yWG1EaHM4N0JYRVpQVnRaN0JZWXAxNHp3aE9PWW96ZUZGNzM1YnNl?=
 =?utf-8?B?dDgwTXpxa3VwUWpOTGVRSVFtLzFCcVUxQUpha3VhdWF0b2JxZjRPd2l0V3pZ?=
 =?utf-8?B?cStORkxwenl0enBpU1VBWEU3QkRmZ3FVRHIrandCL0xPandYdTIrcHpRUkhO?=
 =?utf-8?B?UWF0ei8wcXUvUW1KZllSUUFzUDRuZ2k0dTBXMnRTWGViU3lwbFVtRmtTeVJy?=
 =?utf-8?B?aFlqRFVScWp1Z1MvTE5vSVo0eVd5bm9QckM5TForYlJYWUlXUGlSRlNGR2w1?=
 =?utf-8?Q?/O3qHc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxFRDlsb2NDUjN5KzVKV3Z2cVkwdU5la2JIdjVVbHdmS21Ec3pzUnRCdmVV?=
 =?utf-8?B?S3pzTjFleW5iZzRRdHFvR2FBa3RFU2pmZXNKZHRQTFpLcS8xMjgxYUlzMUpV?=
 =?utf-8?B?cm53Z1NzS2VFNVZJUFM0YmhRQmd6WElHb0RyRlVFMkRzMVNmY08rcjFNRjk4?=
 =?utf-8?B?M1ZMSzlzMzF4N1draVB6cjdNUVNMVTJKNk9xdUZXVHViZ3c2cmZXbEcwWTZT?=
 =?utf-8?B?WENXTXBOQTY5dmdRYnJ3NGJEWnVvSnZsdzFrTm1sUDRtYzN2eWNTcWJxb3cr?=
 =?utf-8?B?cjUyOWxtV2FQZnAwQ2hSdlpZVWRTbm84T3RXYmpIbllyNXlDRXZqQVd2Wm1i?=
 =?utf-8?B?M09sdFRjc0ZQazYzRmh3TlV6SXFVSndGN1hRSW51V28rTUF4ZGpPbm9ORXA2?=
 =?utf-8?B?U2Y5OWR6a0M3U2JudGl3Z1AwUHhldk1CVDBKS3gycGxNK2c1bUh5RDQzbytK?=
 =?utf-8?B?UUdlcExEeU9zMS81RW42cGRWK1JCYTBVa1dNU2JNZ0UvOUdtTllFckt2TnRz?=
 =?utf-8?B?a2ZNcm00N2U5UCtzZEY2Ulk2Q1BKRlIwOXl6L3U1QytzWGZoRW05aHZXaERy?=
 =?utf-8?B?N21GSmswa24wZ1NwMFpGMTgrRnpNVjZZRnJpNU03WFdjK2d4TlBVVWRFN1NW?=
 =?utf-8?B?OHkzOFVlMGRucFNXTUlkQmJrY0ozdjJUcVkySmdiOHhYVm5scjZyam9oVW1L?=
 =?utf-8?B?T0NRYzdDNnFxV3ZSZ0RrN0xjZjNaWmZuQi9PN3ZLaHdDUEFubUFCQkNuaStz?=
 =?utf-8?B?Z1l0R1cvUU9CMmhSeGN5NmZTQUVaMndkSVRxd2RONUordWR5aS9LZkR3cjhB?=
 =?utf-8?B?bGxqLy9mMlRWVUVOK3BRVHZkSmpvdzVwaXBoT3hTd0t2ZzZ4TEZpM1pCdFNJ?=
 =?utf-8?B?UjhnaXVTVTZXcTI5aVV5UWZiUlpLbmRGODI2NG9wYnZBZFhkQWo5Nm1Ocjk4?=
 =?utf-8?B?UXZwczRmUExMYlM1Tld1TzRzNXlsVHpxdDNuai81WktPYUVjdC80alVqY1V2?=
 =?utf-8?B?T2VuNUpJRXp3SDFZcHdkb2kyb3c1V3RTeTlyR21zM2tHSVJFcnlzT042ZTVB?=
 =?utf-8?B?b2YvK2tOekJtZ0JCSU53NmtzOHhWbk5RMnU3THYzZVVMM3RuQkJVcVd2MTQx?=
 =?utf-8?B?SE1PenE2V0FqOGpuNFhrOXNMSUFSajU2K3JKN1pOdnVFeDlOdVF4VFQ1OEky?=
 =?utf-8?B?T0FqY3kxemVyUDNuRVZrUUZKNjFlRkhIQTF4VmoyRm5SR0dSZFFBY1FwV1p1?=
 =?utf-8?B?Y2lsK3RocTdralcwSUdaT213dDFwV3VYL1ZMUSsxVCszL203OU8rcFpiQ0lY?=
 =?utf-8?B?YjFGbjlNOG9raFkyNXl0SWNHZmZDZ214VzJUZkpSdUhXK2k3QmRYcThwNGQ0?=
 =?utf-8?B?L0JiS2s3Y2tIUGlWZTBRMnB1NEpVY04waFhQd25UM1BUWTFNU09oVmhsS09L?=
 =?utf-8?B?bWcxYnQ3VER1QXVNZkdWSzlmL29tOWtxT1p5UFJXSlpzdmd1UFFQa01UYkEy?=
 =?utf-8?B?bmpNempGQUlzYlc1SVF5MXFNNXZHaFhYdzRIaHloUEpUbmJzcSs2MWw4eFdV?=
 =?utf-8?B?eEp5ZXdFQ3RJT0ZOdjJ3S1pxR09MOEJZcnkvbC9SaG9NL3c1MnNPN0gzMEdV?=
 =?utf-8?B?cTMyVTdJTURTSXNUSFV6R2dKOGcreGs4eUhWZ3V1RTIwZHVrNlFHcGpXc0ww?=
 =?utf-8?B?dFdxUTlVc2ZvL3duWUU0NmxKVk40NW00WDlZSStJOXErSUNnVGVqbFJMa2or?=
 =?utf-8?B?WXN0WEdBcEFkV2s4ZHh1aUVjL3N6WGh1bUsyM2FWWEVrNndXR0wyMzBTTEJs?=
 =?utf-8?B?c2lOcyt4Qm0yZGJ4Slkwb3RpMzZPeUJEbitqekRneVN0Q2JUcVI4Qk03YmFZ?=
 =?utf-8?B?N1NUcUdBUlI2cU5IL2haSFhrc0ZqUkcwOHdkQTZBN2xpVFNKTmhRRmlFK05Q?=
 =?utf-8?B?emR2THR5OWtFejZaemhxZVJSRVdMc2FHUHJTaHhWUjFCMU5SeUR2bnNPaFRh?=
 =?utf-8?B?b1BSczI3YW5vUXZEZDJiYktTNWtCUkxoM1c2T3Q3Rzd4OUVjRlNteHExd3BS?=
 =?utf-8?B?V0JwTllCQXNLMVIvdHdLWE0rYWdZOEptS3E4YS9JaTdFaTZNRFl0cllsMWZI?=
 =?utf-8?B?WTBaaUlFQ1RPSGtLLzZPN2ZqdjVtUnFWWVNBTFkwQmRkckdvanliNWc4SFRH?=
 =?utf-8?B?bGR5RldWWldLQjZvVjdaMWR5Rnc0cEk0VjlKMWc5OXQzYVk1SFJMellhcFFW?=
 =?utf-8?B?c28xSmR5MDZpdlB3QVFyVkNhQjZOeE1sZFF1R2dKcFBOb1BldTl2MzM2MXRG?=
 =?utf-8?B?cWMzSS9oR29OTU42UWxxMHVDajB3VHJKMlU1YmRQT3k1WDlPNk5kcmlLZTZX?=
 =?utf-8?Q?puxw5n66GN44x4kA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0078062d-fd06-4875-10ee-08de5f14a082
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:58:53.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mhTjN4LinYsdHGqw18J1Rc1Zyf6JMAzr51LRts8elXzu6Kk/yYJiYV7nL5jBnsoftfMM/j/Q7siLBzf3Mc7NbVgEjURPI2sngwAs9XRYg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
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



On 1/28/2026 11:49 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_eudebug_online: Fix test_interrupt_other wait logic (rev4)
> URL   : https://patchwork.freedesktop.org/series/160553/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8722_full -> IGTPW_14439_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_14439_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14439_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_14439_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@gem_exec_suspend@basic-s0:
>      - shard-snb:          [PASS][1] -> [ABORT][2] +1 other test abort
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-snb5/igt@gem_exec_suspend@basic-s0.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb4/igt@gem_exec_suspend@basic-s0.html
>      - shard-tglu:         [PASS][3] -> [ABORT][4] +1 other test abort
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-2/igt@gem_exec_suspend@basic-s0.html
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-5/igt@gem_exec_suspend@basic-s0.html
> 
>    * igt@gem_tiled_swapping@non-threaded:
>      - shard-tglu:         [PASS][5] -> [FAIL][6]
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][7]
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>      - shard-tglu:         NOTRUN -> [SKIP][8]
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    

Hi, those errors are not related to my changes.

Best regards,
Piotr Rudnicki

> New tests
> ---------
> 
>    New tests have been introduced between IGT_8722_full and IGTPW_14439_full:
> 
> ### New IGT tests (3) ###
> 
>    * igt@i915_pm_rpm@2x-flip-vs-absolute-wf_vblank:
>      - Statuses :
>      - Exec time: [None] s
> 
>    * igt@i915_pm_rpm@pc8-residency:
>      - Statuses :
>      - Exec time: [None] s
> 
>    * igt@i915_pm_rpm@tiling-y:
>      - Statuses :
>      - Exec time: [None] s
> 
>    
> 
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_14439_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@api_intel_bb@crc32:
>      - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6230])
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@api_intel_bb@crc32.html
>      - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#6230])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@api_intel_bb@crc32.html
>      - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#6230])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@api_intel_bb@crc32.html
> 
>    * igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:
>      - shard-tglu:         NOTRUN -> [DMESG-WARN][12] ([i915#15095]) +1 other test dmesg-warn
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html
> 
>    * igt@gem_busy@semaphore:
>      - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#3936])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@gem_busy@semaphore.html
>      - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#3936])
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_busy@semaphore.html
>      - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#3936])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@gem_busy@semaphore.html
> 
>    * igt@gem_ccs@block-copy-compressed:
>      - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html
>      - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html
>      - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@gem_ccs@block-copy-compressed.html
> 
>    * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
>      - shard-dg2:          NOTRUN -> [INCOMPLETE][19] ([i915#12392] / [i915#13356])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
> 
>    * igt@gem_create@create-ext-cpu-access-big:
>      - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#6335])
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html
>      - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#6335])
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html
> 
>    * igt@gem_ctx_isolation@preservation-s3:
>      - shard-rkl:          [PASS][22] -> [INCOMPLETE][23] ([i915#13356]) +2 other tests incomplete
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3.html
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
> 
>    * igt@gem_ctx_param@set-priority-not-supported:
>      - shard-dg1:          NOTRUN -> [SKIP][24] +30 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@gem_ctx_param@set-priority-not-supported.html
> 
>    * igt@gem_ctx_persistence@heartbeat-hostile:
>      - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>    * igt@gem_ctx_persistence@legacy-engines-queued:
>      - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html
> 
>    * igt@gem_eio@kms:
>      - shard-tglu:         [PASS][27] -> [DMESG-WARN][28] ([i915#13363])
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-3/igt@gem_eio@kms.html
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@gem_eio@kms.html
> 
>    * igt@gem_exec_balancer@bonded-dual:
>      - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4771])
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_exec_balancer@bonded-dual.html
> 
>    * igt@gem_exec_balancer@invalid-bonds:
>      - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4036])
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@gem_exec_balancer@invalid-bonds.html
>      - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4036])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@gem_exec_balancer@invalid-bonds.html
>      - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4036])
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_exec_balancer@invalid-bonds.html
> 
>    * igt@gem_exec_balancer@parallel-contexts:
>      - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html
> 
>    * igt@gem_exec_balancer@sliced:
>      - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812])
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@gem_exec_balancer@sliced.html
> 
>    * igt@gem_exec_capture@capture-invisible:
>      - shard-glk10:        NOTRUN -> [SKIP][35] ([i915#6334]) +1 other test skip
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@gem_exec_capture@capture-invisible.html
> 
>    * igt@gem_exec_capture@capture-recoverable:
>      - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#6344])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html
> 
>    * igt@gem_exec_flush@basic-wb-prw-default:
>      - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html
>      - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852])
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@gem_exec_flush@basic-wb-prw-default.html
> 
>    * igt@gem_exec_reloc@basic-gtt-read:
>      - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +6 other tests skip
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html
>      - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#14544] / [i915#3281]) +2 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
> 
>    * igt@gem_exec_reloc@basic-write-cpu-noreloc:
>      - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3281]) +4 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-write-read-active:
>      - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +14 other tests skip
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-active.html
>      - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +5 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-active.html
> 
>    * igt@gem_exec_schedule@deep@rcs0:
>      - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4537])
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_exec_schedule@deep@rcs0.html
> 
>    * igt@gem_exec_schedule@preempt-queue-chain:
>      - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>    * igt@gem_exec_schedule@semaphore-power:
>      - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#7276])
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
> 
>    * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>      - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4860]) +1 other test skip
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
>      - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4860])
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4860])
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>    * igt@gem_lmem_evict@dontneed-evict-race:
>      - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613] / [i915#7582])
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html
>      - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4613] / [i915#7582])
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-multi:
>      - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613]) +2 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#12193])
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
>      - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4565])
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>    * igt@gem_lmem_swapping@massive-random:
>      - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk6/igt@gem_lmem_swapping@massive-random.html
> 
>    * igt@gem_lmem_swapping@random:
>      - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +3 other tests skip
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@gem_lmem_swapping@random.html
> 
>    * igt@gem_lmem_swapping@verify:
>      - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#14544] / [i915#4613]) +1 other test skip
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_lmem_swapping@verify.html
> 
>    * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>      - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +9 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>    * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>      - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4077]) +6 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4077]) +4 other tests skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
> 
>    * igt@gem_mmap_offset@clear-via-pagefault:
>      - shard-mtlp:         NOTRUN -> [ABORT][62] ([i915#14809]) +1 other test abort
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>    * igt@gem_mmap_wc@bad-size:
>      - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083])
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@gem_mmap_wc@bad-size.html
>      - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4083])
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_mmap_wc@bad-size.html
> 
>    * igt@gem_mmap_wc@write-prefaulted:
>      - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +1 other test skip
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html
> 
>    * igt@gem_partial_pwrite_pread@reads-uncached:
>      - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#3282])
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>      - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +1 other test skip
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
>      - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282]) +1 other test skip
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
>      - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282]) +1 other test skip
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>      - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +13 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-context:
>      - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#13717])
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-context.html
>      - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#13398])
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>    * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>      - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270])
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>    * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
>      - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428]) +1 other test skip
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
> 
>    * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
>      - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +4 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html
> 
>    * igt@gem_set_tiling_vs_gtt:
>      - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4079])
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html
>      - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4079])
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html
> 
>    * igt@gem_softpin@evict-snoop-interruptible:
>      - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4885])
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@gem_softpin@evict-snoop-interruptible.html
> 
>    * igt@gem_userptr_blits@create-destroy-unsync:
>      - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3297])
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>    * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>      - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297])
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>    * igt@gem_userptr_blits@relocations:
>      - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3281] / [i915#3297])
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@gem_userptr_blits@relocations.html
> 
>    * igt@gem_userptr_blits@unsync-unmap-cycles:
>      - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#3297])
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>    * igt@gen7_exec_parse@basic-offset:
>      - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544]) +3 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gen7_exec_parse@basic-offset.html
> 
>    * igt@gen9_exec_parse@basic-rejected:
>      - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +1 other test skip
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html
>      - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#2856]) +1 other test skip
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected.html
>      - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#14544] / [i915#2527])
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html
> 
>    * igt@gen9_exec_parse@valid-registers:
>      - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856]) +2 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@gen9_exec_parse@valid-registers.html
>      - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#2527]) +3 other tests skip
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html
>      - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527]) +1 other test skip
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@gen9_exec_parse@valid-registers.html
> 
>    * igt@i915_drm_fdinfo@all-busy-check-all:
>      - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#14123])
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-check-all.html
> 
>    * igt@i915_module_load@fault-injection:
>      - shard-glk10:        NOTRUN -> [ABORT][91] ([i915#15342] / [i915#15481])
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@i915_module_load@fault-injection.html
> 
>    * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
>      - shard-glk10:        NOTRUN -> [ABORT][92] ([i915#15481])
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html
> 
>    * igt@i915_module_load@fault-injection@intel_connector_register:
>      - shard-glk10:        NOTRUN -> [DMESG-WARN][93] ([i915#15342])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html
> 
>    * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
>      - shard-glk10:        NOTRUN -> [SKIP][94] +138 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html
> 
>    * igt@i915_module_load@load:
>      - shard-mtlp:         ([PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119]) -> ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [SKIP][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) ([i915#14785])
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-6/igt@i915_module_load@load.html
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-3/igt@i915_module_load@load.html
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-6/igt@i915_module_load@load.html
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-2/igt@i915_module_load@load.html
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-2/igt@i915_module_load@load.html
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-7/igt@i915_module_load@load.html
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-5/igt@i915_module_load@load.html
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-4/igt@i915_module_load@load.html
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-6/igt@i915_module_load@load.html
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-8/igt@i915_module_load@load.html
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-5/igt@i915_module_load@load.html
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-4/igt@i915_module_load@load.html
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-6/igt@i915_module_load@load.html
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-5/igt@i915_module_load@load.html
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-3/igt@i915_module_load@load.html
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-5/igt@i915_module_load@load.html
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-8/igt@i915_module_load@load.html
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-2/igt@i915_module_load@load.html
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-7/igt@i915_module_load@load.html
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-3/igt@i915_module_load@load.html
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-7/igt@i915_module_load@load.html
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-4/igt@i915_module_load@load.html
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-8/igt@i915_module_load@load.html
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-2/igt@i915_module_load@load.html
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-8/igt@i915_module_load@load.html
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@i915_module_load@load.html
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@i915_module_load@load.html
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@i915_module_load@load.html
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@i915_module_load@load.html
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@i915_module_load@load.html
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@i915_module_load@load.html
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@i915_module_load@load.html
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@i915_module_load@load.html
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@i915_module_load@load.html
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@i915_module_load@load.html
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@i915_module_load@load.html
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@i915_module_load@load.html
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@i915_module_load@load.html
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@i915_module_load@load.html
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-6/igt@i915_module_load@load.html
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-6/igt@i915_module_load@load.html
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-6/igt@i915_module_load@load.html
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@i915_module_load@load.html
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@i915_module_load@load.html
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@i915_module_load@load.html
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@i915_module_load@load.html
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@i915_module_load@load.html
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@i915_module_load@load.html
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@i915_module_load@load.html
> 
>    * igt@i915_pm_freq_api@freq-basic-api:
>      - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#8399])
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@i915_pm_freq_api@freq-basic-api.html
> 
>    * igt@i915_pm_freq_api@freq-reset-multiple:
>      - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#14544] / [i915#8399])
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>    * igt@i915_pm_freq_mult@media-freq@gt0:
>      - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#6590]) +1 other test skip
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>    * igt@i915_pm_rc6_residency@rc6-accuracy:
>      - shard-dg2:          NOTRUN -> [FAIL][147] ([i915#12964]) +1 other test fail
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>    * igt@i915_pm_rc6_residency@rc6-idle:
>      - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#14498] / [i915#14544])
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>    * igt@i915_pm_rpm@system-suspend-execbuf:
>      - shard-dg2:          [PASS][149] -> [ABORT][150] ([i915#13562])
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-4/igt@i915_pm_rpm@system-suspend-execbuf.html
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>    * igt@i915_pm_rps@basic-api:
>      - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#11681] / [i915#6621])
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@i915_pm_rps@basic-api.html
>      - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#11681] / [i915#6621])
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@i915_pm_rps@basic-api.html
>      - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#11681] / [i915#6621])
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@i915_pm_rps@basic-api.html
> 
>    * igt@i915_pm_sseu@full-enable:
>      - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4387])
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@i915_pm_sseu@full-enable.html
> 
>    * igt@i915_power@sanity:
>      - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7984])
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@i915_power@sanity.html
> 
>    * igt@i915_selftest@live@workarounds:
>      - shard-dg2:          NOTRUN -> [DMESG-FAIL][156] ([i915#12061]) +1 other test dmesg-fail
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@i915_selftest@live@workarounds.html
> 
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-tglu-1:       NOTRUN -> [INCOMPLETE][157] ([i915#4817] / [i915#7443])
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html
>      - shard-dg1:          [PASS][158] -> [DMESG-WARN][159] ([i915#4391] / [i915#4423])
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-19/igt@i915_suspend@basic-s3-without-i915.html
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@i915_suspend@basic-s3-without-i915.html
> 
>    * igt@i915_suspend@debugfs-reader:
>      - shard-rkl:          [PASS][160] -> [INCOMPLETE][161] ([i915#4817])
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@i915_suspend@debugfs-reader.html
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@i915_suspend@debugfs-reader.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#7707])
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>      - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#9531])
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-glk:          NOTRUN -> [SKIP][164] ([i915#1769])
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>      - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#14544] / [i915#1769] / [i915#3555])
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#1769] / [i915#3555])
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#1769] / [i915#3555])
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-snb:          NOTRUN -> [SKIP][168] ([i915#1769])
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#1769] / [i915#3555])
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>      - shard-dg2:          [PASS][170] -> [FAIL][171] ([i915#5956]) +1 other test fail
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>      - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#4538] / [i915#5286]) +1 other test skip
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>    * igt@kms_big_fb@4-tiled-addfb:
>      - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#5286]) +9 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb.html
>      - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#5286]) +3 other tests skip
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_big_fb@4-tiled-addfb.html
> 
>    * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>      - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#5286])
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-mtlp:         [PASS][176] -> [FAIL][177] ([i915#5138])
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-270:
>      - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#14544] / [i915#3638])
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-90:
>      - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3638]) +1 other test skip
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3638]) +1 other test skip
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>      - shard-snb:          NOTRUN -> [SKIP][181] +234 other tests skip
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>      - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3828])
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>      - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3828])
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>      - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3828])
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>      - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3828])
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>      - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3828])
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>    * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>      - shard-mtlp:         NOTRUN -> [SKIP][187] +9 other tests skip
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>      - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#4538] / [i915#5190]) +2 other tests skip
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4538]) +2 other tests skip
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>      - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#6095]) +181 other tests skip
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
> 
>    * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#14098] / [i915#6095]) +59 other tests skip
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#6095]) +82 other tests skip
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#12313]) +1 other test skip
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>      - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#12313]) +3 other tests skip
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>      - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#12313])
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#12313])
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#12313])
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#6095]) +24 other tests skip
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#10307] / [i915#6095]) +158 other tests skip
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [SKIP][200] +213 other tests skip
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#6095]) +49 other tests skip
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6095]) +45 other tests skip
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-3.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#12805])
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#10307] / [i915#10434] / [i915#6095])
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#14544] / [i915#6095]) +10 other tests skip
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_cdclk@mode-transition:
>      - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3742])
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_cdclk@mode-transition.html
>      - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3742]) +1 other test skip
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_cdclk@mode-transition.html
> 
>    * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#13781]) +3 other tests skip
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>    * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#13783]) +3 other tests skip
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
> 
>    * igt@kms_chamelium_frames@dp-crc-single:
>      - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#11151] / [i915#7828]) +4 other tests skip
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_chamelium_frames@dp-crc-single.html
>      - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#11151] / [i915#7828]) +8 other tests skip
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@kms_chamelium_frames@dp-crc-single.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>      - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#11151] / [i915#7828]) +4 other tests skip
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-fast:
>      - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#11151] / [i915#7828])
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>      - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd-fast:
>      - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#11151] / [i915#7828]) +11 other tests skip
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>    * igt@kms_color@deep-color:
>      - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#12655] / [i915#3555])
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_color@deep-color.html
> 
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#6944] / [i915#7116] / [i915#9424])
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_content_protection@atomic-dpms.html
>      - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#15330] / [i915#3116]) +1 other test skip
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>      - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#15330])
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>      - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#14544] / [i915#15330])
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>      - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#15330])
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>      - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#15330])
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>      - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#15330])
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>    * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>      - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#15330])
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>    * igt@kms_content_protection@legacy-hdcp14:
>      - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#6944]) +2 other tests skip
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_content_protection@legacy-hdcp14.html
> 
>    * igt@kms_content_protection@lic-type-1:
>      - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#6944] / [i915#9424])
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#6944] / [i915#7118] / [i915#9424])
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_content_protection@uevent-hdcp14:
>      - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#6944])
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_content_protection@uevent-hdcp14.html
>      - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#6944])
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_content_protection@uevent-hdcp14.html
>      - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#6944])
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_content_protection@uevent-hdcp14.html
>      - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#6944])
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@kms_content_protection@uevent-hdcp14.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-32x10:
>      - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#14544] / [i915#3555])
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-256x85:
>      - shard-tglu:         [PASS][235] -> [FAIL][236] ([i915#13566]) +3 other tests fail
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [FAIL][237] ([i915#13566]) +2 other tests fail
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-64x21:
>      - shard-rkl:          [PASS][238] -> [FAIL][239] ([i915#13566]) +2 other tests fail
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x170:
>      - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#13049]) +1 other test skip
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#13049]) +3 other tests skip
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#13049]) +1 other test skip
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#13049]) +3 other tests skip
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#13049])
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x21:
>      - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#8814])
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [FAIL][246] ([i915#13566]) +1 other test fail
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-max-size:
>      - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8814]) +2 other tests skip
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][248] +30 other tests skip
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>      - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#9809])
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>      - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#13046] / [i915#5354]) +2 other tests skip
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>      - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#9067])
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>      - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#9067])
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>      - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#4103])
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#1257])
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_dp_link_training@non-uhbr-mst:
>      - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#13749])
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-mst.html
>      - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#13749])
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html
>      - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#13749])
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-mst.html
>      - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#13749])
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-mst.html
>      - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#13749])
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#13748])
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#13707])
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_draw_crc@draw-method-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#8812])
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>    * igt@kms_dsc@dsc-basic:
>      - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#3840])
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#3555] / [i915#3840]) +1 other test skip
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3469])
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#9337])
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html
> 
>    * igt@kms_fence_pin_leak:
>      - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#4881])
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_fence_pin_leak.html
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>      - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#3637] / [i915#9934]) +6 other tests skip
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-blocking-wf_vblank:
>      - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#9934]) +7 other tests skip
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-fences:
>      - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#8381])
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9934]) +2 other tests skip
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
>      - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#14544] / [i915#9934])
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>    * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>      - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#3637] / [i915#9934]) +1 other test skip
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>      - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9934]) +2 other tests skip
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-glk10:        NOTRUN -> [INCOMPLETE][275] ([i915#12745] / [i915#4839])
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>      - shard-glk10:        NOTRUN -> [INCOMPLETE][276] ([i915#12745])
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>      - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#2587] / [i915#2672]) +4 other tests skip
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>      - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#2672] / [i915#3555]) +4 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>      - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2587] / [i915#2672]) +2 other tests skip
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2672] / [i915#8813]) +2 other tests skip
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#2672]) +1 other test skip
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#14544] / [i915#2672] / [i915#3555])
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>      - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8813])
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#8810] / [i915#8813])
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#14544] / [i915#2672])
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>      - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#2672] / [i915#3555]) +4 other tests skip
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#2672]) +4 other tests skip
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>      - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#15573]) +1 other test skip
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
>      - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#15573]) +1 other test skip
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
>      - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#8813]) +1 other test skip
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>    * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#15573]) +1 other test skip
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode.html
>      - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#15573]) +1 other test skip
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:
>      - shard-dg2:          [PASS][296] -> [FAIL][297] ([i915#15389])
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>      - shard-tglu:         NOTRUN -> [SKIP][298] +65 other tests skip
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
>      - shard-snb:          [PASS][299] -> [SKIP][300]
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>      - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#14544] / [i915#15574])
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>      - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#8708]) +7 other tests skip
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
>      - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#8708]) +12 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
>      - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#15102]) +4 other tests skip
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
>      - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#15102]) +1 other test skip
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:
>      - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#15102])
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>      - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#15102] / [i915#3023]) +29 other tests skip
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>      - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#1825]) +15 other tests skip
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#1825]) +48 other tests skip
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
>      - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#15574]) +2 other tests skip
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
>      - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#15574]) +2 other tests skip
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
>      - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#15102] / [i915#3458]) +7 other tests skip
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
>      - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#15102] / [i915#3458]) +5 other tests skip
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>      - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#9766])
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9766])
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
>      - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#14544] / [i915#15102])
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
>      - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#14544] / [i915#1825]) +10 other tests skip
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>      - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#5354]) +21 other tests skip
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
>      - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#15574]) +3 other tests skip
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
>      - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#15574]) +1 other test skip
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
>      - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#15574])
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>      - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#15102]) +14 other tests skip
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
>      - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#8708]) +3 other tests skip
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-suspend:
>      - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>    * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [ABORT][325] ([i915#15132])
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_hdr@static-swap:
>      - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#3555] / [i915#8228])
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@kms_hdr@static-swap.html
>      - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8228])
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_hdr@static-swap.html
>      - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#12713] / [i915#3555] / [i915#8228])
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_hdr@static-swap.html
> 
>    * igt@kms_hdr@static-toggle:
>      - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#3555] / [i915#8228]) +2 other tests skip
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_hdr@static-toggle.html
>      - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#3555] / [i915#8228]) +2 other tests skip
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-9/igt@kms_hdr@static-toggle.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-dg2:          [PASS][331] -> [SKIP][332] ([i915#3555] / [i915#8228])
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#15460]) +1 other test skip
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#15458])
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>      - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#15458])
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>      - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#15458])
>     [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>    * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>      - shard-dg2:          NOTRUN -> [SKIP][337] +9 other tests skip
>     [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>    * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][338] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
>     [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
>      - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825])
>     [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:
>      - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#14544] / [i915#15608])
>     [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
>      - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#14544] / [i915#15609] / [i915#8825])
>     [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
>      - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#15608] / [i915#15609] / [i915#8825])
>     [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
>      - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#15608] / [i915#15609] / [i915#8825])
>     [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
>      - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#15608] / [i915#15609] / [i915#8825])
>     [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
>      - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#15609])
>     [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5.html
>      - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#15609])
>     [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:
>      - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#15609]) +7 other tests skip
>     [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
>      - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#15608]) +13 other tests skip
>     [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
>      - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#15609] / [i915#8825])
>     [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5.html
>      - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#15609] / [i915#8825])
>     [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:
>      - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#15609] / [i915#8825])
>     [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7.html
>      - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#15609] / [i915#8825]) +1 other test skip
>     [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>      - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
>     [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
>      - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#15608] / [i915#15609] / [i915#8825])
>     [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
>      - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#15609] / [i915#8825])
>     [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>      - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#15608] / [i915#8825]) +3 other tests skip
>     [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>    * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
>      - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#15608]) +27 other tests skip
>     [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7:
>      - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#15609]) +2 other tests skip
>     [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7.html
> 
>    * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
>      - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#15609]) +3 other tests skip
>     [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier:
>      - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#15608] / [i915#8825]) +5 other tests skip
>     [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
>      - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#15608] / [i915#8825]) +3 other tests skip
>     [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_plane@pixel-format-yf-tiled-modifier.html
>      - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#15608] / [i915#8825]) +3 other tests skip
>     [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-7:
>      - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#15608]) +19 other tests skip
>     [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-7.html
>      - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#15608]) +32 other tests skip
>     [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-7.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:
>      - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#15608]) +13 other tests skip
>     [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-7:
>      - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#15608] / [i915#8825]) +5 other tests skip
>     [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-7.html
> 
>    * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][367] ([i915#13026]) +1 other test incomplete
>     [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>    * igt@kms_plane@plane-panning-top-left:
>      - shard-dg1:          [PASS][368] -> [DMESG-WARN][369] ([i915#4423]) +2 other tests dmesg-warn
>     [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-17/igt@kms_plane@plane-panning-top-left.html
>     [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_plane@plane-panning-top-left.html
> 
>    * igt@kms_plane_alpha_blend@constant-alpha-max:
>      - shard-glk:          NOTRUN -> [FAIL][370] ([i915#10647] / [i915#12169])
>     [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max.html
> 
>    * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][371] ([i915#10647]) +1 other test fail
>     [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
> 
>    * igt@kms_plane_lowres@tiling-yf:
>      - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#3555]) +7 other tests skip
>     [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html
> 
>    * igt@kms_plane_multiple@2x-tiling-x:
>      - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#13958]) +1 other test skip
>     [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-x.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#13958])
>     [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-yf.html
>      - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#13958])
>     [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>      - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#15329]) +6 other tests skip
>     [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
>      - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#15329]) +4 other tests skip
>     [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
> 
>    * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
>      - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#15329]) +9 other tests skip
>     [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html
> 
>    * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>      - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#15329] / [i915#3555])
>     [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#12343])
>     [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#9685])
>     [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
>      - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#9685])
>     [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#9685])
>     [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_dc@dc9-dpms:
>      - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#4281])
>     [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
> 
>    * igt@kms_pm_rpm@dpms-lpsp:
>      - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#15073])
>     [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html
>      - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#15073])
>     [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp-stress:
>      - shard-rkl:          [PASS][387] -> [SKIP][388] ([i915#15073]) +2 other tests skip
>     [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
>     [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>    * igt@kms_prime@basic-modeset-hybrid:
>      - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#6524] / [i915#6805])
>     [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-5/igt@kms_prime@basic-modeset-hybrid.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>      - shard-glk:          NOTRUN -> [SKIP][390] ([i915#11520]) +5 other tests skip
>     [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>      - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#11520]) +2 other tests skip
>     [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#9808])
>     [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#12316]) +1 other test skip
>     [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>      - shard-glk10:        NOTRUN -> [SKIP][394] ([i915#11520]) +1 other test skip
>     [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>    * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-snb:          NOTRUN -> [SKIP][395] ([i915#11520]) +1 other test skip
>     [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>      - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#11520]) +3 other tests skip
>     [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>      - shard-tglu:         NOTRUN -> [SKIP][397] ([i915#11520]) +6 other tests skip
>     [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>      - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#11520] / [i915#14544])
>     [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>      - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#11520]) +8 other tests skip
>     [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@page_flip-xrgb8888:
>      - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#9683]) +1 other test skip
>     [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html
>      - shard-rkl:          NOTRUN -> [SKIP][401] ([i915#9683])
>     [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
>      - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#9683])
>     [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html
>      - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#9683])
>     [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-7/igt@kms_psr2_su@page_flip-xrgb8888.html
>      - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#4348])
>     [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-move:
>      - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#9688]) +9 other tests skip
>     [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-render:
>      - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#1072] / [i915#9732]) +31 other tests skip
>     [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>    * igt@kms_psr@psr-basic:
>      - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#9732]) +17 other tests skip
>     [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-6/igt@kms_psr@psr-basic.html
> 
>    * igt@kms_psr@psr-primary-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
>     [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr@psr-primary-blt.html
> 
>    * igt@kms_psr@psr-sprite-plane-move:
>      - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#1072] / [i915#9732]) +11 other tests skip
>     [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_psr@psr-sprite-plane-move.html
> 
>    * igt@kms_psr@psr-suspend:
>      - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#1072] / [i915#9732]) +14 other tests skip
>     [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_psr@psr-suspend.html
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#14544] / [i915#9685])
>     [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>      - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#5190])
>     [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>      - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#5289])
>     [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>      - shard-rkl:          NOTRUN -> [SKIP][414] ([i915#5289]) +1 other test skip
>     [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#12755])
>     [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html
>      - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#12755])
>     [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-4/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_scaling_modes@scaling-mode-full:
>      - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#3555]) +6 other tests skip
>     [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html
> 
>    * igt@kms_setmode@basic:
>      - shard-tglu:         [PASS][418] -> [FAIL][419] ([i915#15106]) +2 other tests fail
>     [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-6/igt@kms_setmode@basic.html
>     [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-4/igt@kms_setmode@basic.html
> 
>    * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
>      - shard-dg2:          [PASS][420] -> [FAIL][421] ([i915#15106]) +2 other tests fail
>     [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-8/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
>     [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-dg2:          NOTRUN -> [SKIP][422] ([i915#3555]) +3 other tests skip
>     [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc.html
>      - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#3555]) +4 other tests skip
>     [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@kms_setmode@invalid-clone-single-crtc.html
>      - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#3555] / [i915#8809])
>     [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#8623])
>     [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_vrr@flip-basic:
>      - shard-rkl:          NOTRUN -> [SKIP][426] ([i915#15243] / [i915#3555])
>     [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_vrr@flip-basic.html
> 
>    * igt@kms_vrr@flip-basic-fastset:
>      - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#9906])
>     [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-dg2:          [PASS][428] -> [SKIP][429] ([i915#3555] / [i915#9906])
>     [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-11/igt@kms_vrr@negative-basic.html
>     [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_vrr@negative-basic.html
> 
>    * igt@kms_vrr@seamless-rr-switch-vrr:
>      - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#14544] / [i915#9906])
>     [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
>      - shard-tglu:         NOTRUN -> [SKIP][431] ([i915#9906])
>     [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>    * igt@perf@mi-rpc:
>      - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#2434])
>     [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@perf@mi-rpc.html
> 
>    * igt@perf@unprivileged-single-ctx-counters:
>      - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#2433])
>     [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html
>      - shard-dg1:          NOTRUN -> [SKIP][434] ([i915#2433])
>     [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html
> 
>    * igt@perf_pmu@frequency:
>      - shard-dg2:          NOTRUN -> [FAIL][435] ([i915#12549] / [i915#6806]) +1 other test fail
>     [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@perf_pmu@frequency.html
> 
>    * igt@perf_pmu@module-unload:
>      - shard-glk:          NOTRUN -> [FAIL][436] ([i915#14433])
>     [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk1/igt@perf_pmu@module-unload.html
> 
>    * igt@prime_vgem@basic-fence-flip:
>      - shard-dg1:          NOTRUN -> [SKIP][437] ([i915#3708]) +1 other test skip
>     [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-16/igt@prime_vgem@basic-fence-flip.html
> 
>    * igt@prime_vgem@fence-read-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#3708]) +1 other test skip
>     [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>      - shard-dg2:          NOTRUN -> [SKIP][439] ([i915#9917]) +1 other test skip
>     [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#14544] / [i915#9917])
>     [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#9917]) +1 other test skip
>     [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-19/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>    * igt@sriov_basic@enable-vfs-bind-unbind-each:
>      - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#9917]) +1 other test skip
>     [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>    * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
>      - shard-tglu:         NOTRUN -> [FAIL][443] ([i915#12910]) +18 other tests fail
>     [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
>      - shard-mtlp:         NOTRUN -> [FAIL][444] ([i915#12910]) +18 other tests fail
>     [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
>      - shard-dg2:          [INCOMPLETE][445] ([i915#12392] / [i915#13356]) -> [PASS][446]
>     [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
>     [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
> 
>    * igt@gem_exec_big@single:
>      - shard-tglu:         [ABORT][447] ([i915#11713]) -> [PASS][448]
>     [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-4/igt@gem_exec_big@single.html
>     [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-5/igt@gem_exec_big@single.html
> 
>    * igt@gem_exec_suspend@basic-s0:
>      - shard-dg2:          [INCOMPLETE][449] ([i915#13356]) -> [PASS][450] +1 other test pass
>     [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html
>     [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html
> 
>    * igt@gem_pxp@create-regular-buffer:
>      - shard-tglu:         [SKIP][451] ([i915#4270]) -> [PASS][452]
>     [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-7/igt@gem_pxp@create-regular-buffer.html
>     [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-10/igt@gem_pxp@create-regular-buffer.html
> 
>    * igt@i915_suspend@forcewake:
>      - shard-rkl:          [INCOMPLETE][453] ([i915#4817]) -> [PASS][454] +1 other test pass
>     [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@i915_suspend@forcewake.html
>     [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@i915_suspend@forcewake.html
> 
>    * igt@kms_async_flips@async-flip-suspend-resume:
>      - shard-rkl:          [INCOMPLETE][455] ([i915#12761]) -> [PASS][456] +1 other test pass
>     [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
>     [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>    * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
>      - shard-dg2:          [FAIL][457] ([i915#5956]) -> [PASS][458] +1 other test pass
>     [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
>     [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-rkl:          [FAIL][459] ([i915#13566]) -> [PASS][460] +2 other tests pass
>     [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>     [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>      - shard-tglu:         [FAIL][461] ([i915#13566]) -> [PASS][462] +7 other tests pass
>     [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>     [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>      - shard-snb:          [TIMEOUT][463] ([i915#14033] / [i915#14350]) -> [PASS][464]
>     [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>     [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>      - shard-snb:          [TIMEOUT][465] ([i915#14033]) -> [PASS][466]
>     [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
>     [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>      - shard-dg2:          [FAIL][467] ([i915#15389] / [i915#6880]) -> [PASS][468]
>     [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
>     [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>    * igt@kms_hdr@bpc-switch-dpms:
>      - shard-dg2:          [SKIP][469] ([i915#3555] / [i915#8228]) -> [PASS][470]
>     [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-4/igt@kms_hdr@bpc-switch-dpms.html
>     [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-rkl:          [SKIP][471] ([i915#6953]) -> [PASS][472]
>     [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html
>     [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-dg2:          [SKIP][473] ([i915#9340]) -> [PASS][474]
>     [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
>     [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp:
>      - shard-dg1:          [SKIP][475] ([i915#15073]) -> [PASS][476] +1 other test pass
>     [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html
>     [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>      - shard-rkl:          [SKIP][477] ([i915#15073]) -> [PASS][478]
>     [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>    * igt@kms_pm_rpm@system-suspend-idle:
>      - shard-dg2:          [INCOMPLETE][479] ([i915#14419]) -> [PASS][480]
>     [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.html
>     [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html
> 
>    * igt@perf_pmu@busy-double-start@vecs1:
>      - shard-dg2:          [FAIL][481] ([i915#4349]) -> [PASS][482] +4 other tests pass
>     [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
>     [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
> 
>    
> #### Warnings ####
> 
>    * igt@api_intel_bb@object-reloc-purge-cache:
>      - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#8411]) -> [SKIP][484] ([i915#8411])
>     [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
>     [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>    * igt@gem_ccs@ctrl-surf-copy:
>      - shard-rkl:          [SKIP][485] ([i915#3555] / [i915#9323]) -> [SKIP][486] ([i915#14544] / [i915#3555] / [i915#9323])
>     [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
>     [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
> 
>    * igt@gem_ccs@large-ctrl-surf-copy:
>      - shard-rkl:          [SKIP][487] ([i915#13008] / [i915#14544]) -> [SKIP][488] ([i915#13008])
>     [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
>     [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>    * igt@gem_exec_reloc@basic-cpu-noreloc:
>      - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#3281]) -> [SKIP][490] ([i915#3281]) +1 other test skip
>     [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html
>     [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-wc-cpu:
>      - shard-rkl:          [SKIP][491] ([i915#3281]) -> [SKIP][492] ([i915#14544] / [i915#3281]) +4 other tests skip
>     [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@gem_exec_reloc@basic-wc-cpu.html
>     [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads:
>      - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#3282]) -> [SKIP][494] ([i915#3282]) +4 other tests skip
>     [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
>     [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-buffer:
>      - shard-rkl:          [SKIP][495] ([i915#13717]) -> [SKIP][496] ([i915#13717] / [i915#14544])
>     [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
>     [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>    * igt@gem_readwrite@read-write:
>      - shard-rkl:          [SKIP][497] ([i915#3282]) -> [SKIP][498] ([i915#14544] / [i915#3282])
>     [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-4/igt@gem_readwrite@read-write.html
>     [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_readwrite@read-write.html
> 
>    * igt@gem_userptr_blits@dmabuf-unsync:
>      - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#3297]) -> [SKIP][500] ([i915#3297]) +3 other tests skip
>     [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
>     [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>    * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>      - shard-rkl:          [SKIP][501] ([i915#3297]) -> [SKIP][502] ([i915#14544] / [i915#3297]) +2 other tests skip
>     [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
>     [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>    * igt@gen9_exec_parse@bb-oversize:
>      - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#2527]) -> [SKIP][504] ([i915#2527])
>     [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html
>     [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html
> 
>    * igt@gen9_exec_parse@unaligned-access:
>      - shard-rkl:          [SKIP][505] ([i915#2527]) -> [SKIP][506] ([i915#14544] / [i915#2527]) +1 other test skip
>     [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@gen9_exec_parse@unaligned-access.html
>     [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
> 
>    * igt@i915_query@hwconfig_table:
>      - shard-rkl:          [SKIP][507] ([i915#6245]) -> [SKIP][508] ([i915#14544] / [i915#6245])
>     [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@i915_query@hwconfig_table.html
>     [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@i915_query@hwconfig_table.html
> 
>    * igt@i915_suspend@fence-restore-untiled:
>      - shard-rkl:          [INCOMPLETE][509] ([i915#4817]) -> [ABORT][510] ([i915#15131])
>     [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
>     [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html
> 
>    * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>      - shard-rkl:          [SKIP][511] ([i915#5286]) -> [SKIP][512] ([i915#14544] / [i915#5286]) +2 other tests skip
>     [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
>     [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>      - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#5286]) -> [SKIP][514] ([i915#5286])
>     [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>     [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#3638]) -> [SKIP][516] ([i915#3638]) +2 other tests skip
>     [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
>     [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>      - shard-rkl:          [SKIP][517] ([i915#3828]) -> [SKIP][518] ([i915#14544] / [i915#3828])
>     [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
>     [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>      - shard-rkl:          [SKIP][519] ([i915#14544]) -> [SKIP][520] +7 other tests skip
>     [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>     [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>      - shard-rkl:          [SKIP][521] -> [SKIP][522] ([i915#14544]) +6 other tests skip
>     [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
>     [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>      - shard-rkl:          [SKIP][523] ([i915#6095]) -> [SKIP][524] ([i915#14544] / [i915#6095]) +3 other tests skip
>     [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
>     [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
>      - shard-rkl:          [SKIP][525] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][526] ([i915#14098] / [i915#6095]) +9 other tests skip
>     [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
>     [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>      - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#6095]) -> [SKIP][528] ([i915#6095]) +5 other tests skip
>     [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
>     [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-rkl:          [SKIP][529] ([i915#12805] / [i915#14544]) -> [SKIP][530] ([i915#12805])
>     [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>      - shard-rkl:          [SKIP][531] ([i915#14098] / [i915#6095]) -> [SKIP][532] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
>     [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>     [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>      - shard-rkl:          [SKIP][533] ([i915#12313]) -> [SKIP][534] ([i915#12313] / [i915#14544])
>     [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>     [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>    * igt@kms_chamelium_edid@hdmi-mode-timings:
>      - shard-rkl:          [SKIP][535] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][536] ([i915#11151] / [i915#7828]) +2 other tests skip
>     [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html
>     [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>    * igt@kms_chamelium_frames@dp-frame-dump:
>      - shard-rkl:          [SKIP][537] ([i915#11151] / [i915#7828]) -> [SKIP][538] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
>     [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_chamelium_frames@dp-frame-dump.html
>     [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-rkl:          [SKIP][539] ([i915#15330] / [i915#3116]) -> [SKIP][540] ([i915#14544] / [i915#15330] / [i915#3116])
>     [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
>     [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-rkl:          [SKIP][541] ([i915#14544] / [i915#6944] / [i915#9424]) -> [SKIP][542] ([i915#6944] / [i915#9424])
>     [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_content_protection@lic-type-0.html
>     [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@lic-type-0-hdcp14:
>      - shard-rkl:          [SKIP][543] ([i915#6944]) -> [SKIP][544] ([i915#14544] / [i915#6944])
>     [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_content_protection@lic-type-0-hdcp14.html
>     [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_content_protection@lic-type-0-hdcp14.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>      - shard-rkl:          [SKIP][545] ([i915#3555]) -> [SKIP][546] ([i915#14544] / [i915#3555])
>     [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>     [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>    * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      - shard-rkl:          [SKIP][547] ([i915#9723]) -> [SKIP][548] ([i915#14544] / [i915#9723])
>     [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-rkl:          [SKIP][549] ([i915#13691] / [i915#14544]) -> [SKIP][550] ([i915#13691])
>     [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html
>     [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-rkl:          [SKIP][551] ([i915#3555] / [i915#3804]) -> [SKIP][552] ([i915#14544] / [i915#3555] / [i915#3804])
>     [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>      - shard-rkl:          [SKIP][553] ([i915#3804]) -> [SKIP][554] ([i915#14544] / [i915#3804])
>     [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
>     [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_dsc@dsc-basic:
>      - shard-rkl:          [SKIP][555] ([i915#3555] / [i915#3840]) -> [SKIP][556] ([i915#14544] / [i915#3555] / [i915#3840])
>     [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_dsc@dsc-basic.html
>     [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-rkl:          [SKIP][557] ([i915#3840]) -> [SKIP][558] ([i915#14544] / [i915#3840])
>     [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>     [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend:
>      - shard-glk:          [INCOMPLETE][559] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][560] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
>     [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html
>     [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
>      - shard-glk:          [INCOMPLETE][561] ([i915#4839]) -> [INCOMPLETE][562] ([i915#12314] / [i915#4839] / [i915#6113])
>     [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
>     [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
> 
>    * igt@kms_flip@2x-modeset-vs-vblank-race:
>      - shard-rkl:          [SKIP][563] ([i915#9934]) -> [SKIP][564] ([i915#14544] / [i915#9934]) +4 other tests skip
>     [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-rkl:          [SKIP][565] ([i915#14544] / [i915#9934]) -> [SKIP][566] ([i915#9934]) +3 other tests skip
>     [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
>     [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-rkl:          [SKIP][567] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][568] ([i915#2672] / [i915#3555])
>     [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>     [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>      - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#2672]) -> [SKIP][570] ([i915#2672])
>     [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
>     [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>      - shard-rkl:          [SKIP][571] ([i915#2672] / [i915#3555]) -> [SKIP][572] ([i915#14544] / [i915#2672] / [i915#3555])
>     [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
>     [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-rkl:          [SKIP][573] ([i915#2672]) -> [SKIP][574] ([i915#14544] / [i915#2672])
>     [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
>     [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>      - shard-rkl:          [SKIP][575] ([i915#1825]) -> [SKIP][576] ([i915#14544] / [i915#1825]) +15 other tests skip
>     [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>     [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
>      - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#15574]) -> [SKIP][578] ([i915#15574])
>     [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
>     [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
>      - shard-rkl:          [SKIP][579] ([i915#14544] / [i915#15102]) -> [SKIP][580] ([i915#15102]) +1 other test skip
>     [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html
>     [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>      - shard-rkl:          [SKIP][581] ([i915#15102]) -> [SKIP][582] ([i915#14544] / [i915#15102]) +2 other tests skip
>     [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
>     [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
>      - shard-dg1:          [SKIP][583] ([i915#15102]) -> [SKIP][584] ([i915#15102] / [i915#4423])
>     [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
>     [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>      - shard-rkl:          [SKIP][585] ([i915#15102] / [i915#3023]) -> [SKIP][586] ([i915#14544] / [i915#15102] / [i915#3023]) +7 other tests skip
>     [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
>     [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>      - shard-dg2:          [SKIP][587] ([i915#15102] / [i915#3458]) -> [SKIP][588] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
>     [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
>     [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>      - shard-rkl:          [SKIP][589] ([i915#14544] / [i915#5439]) -> [SKIP][590] ([i915#5439])
>     [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>     [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2:          [SKIP][591] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][592] ([i915#15102] / [i915#3458]) +2 other tests skip
>     [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>     [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>      - shard-rkl:          [SKIP][593] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][594] ([i915#15102] / [i915#3023]) +5 other tests skip
>     [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>     [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>      - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#1825]) -> [SKIP][596] ([i915#1825]) +11 other tests skip
>     [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>     [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
>      - shard-rkl:          [SKIP][597] ([i915#15574]) -> [SKIP][598] ([i915#14544] / [i915#15574])
>     [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
>     [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
> 
>    * igt@kms_hdr@bpc-switch-suspend:
>      - shard-rkl:          [SKIP][599] ([i915#3555] / [i915#8228]) -> [ABORT][600] ([i915#15132])
>     [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_hdr@bpc-switch-suspend.html
>     [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-dg1:          [SKIP][601] ([i915#1187] / [i915#12713]) -> [SKIP][602] ([i915#12713])
>     [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
>     [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
>      - shard-tglu:         [SKIP][603] ([i915#1187] / [i915#12713]) -> [SKIP][604] ([i915#12713])
>     [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
>     [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-rkl:          [SKIP][605] ([i915#13688] / [i915#14544]) -> [SKIP][606] ([i915#13688])
>     [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
>     [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-rkl:          [SKIP][607] ([i915#15458]) -> [SKIP][608] ([i915#14544] / [i915#15458])
>     [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_panel_fitting@legacy:
>      - shard-rkl:          [SKIP][609] ([i915#6301]) -> [SKIP][610] ([i915#14544] / [i915#6301])
>     [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_panel_fitting@legacy.html
>     [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_panel_fitting@legacy.html
> 
>    * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>      - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#14712]) -> [SKIP][612] ([i915#14712]) +1 other test skip
>     [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
>     [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>      - shard-rkl:          [SKIP][613] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][614] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
>     [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
>     [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>      - shard-rkl:          [SKIP][615] ([i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][616] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825])
>     [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
>     [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
>      - shard-rkl:          [SKIP][617] ([i915#15608]) -> [SKIP][618] ([i915#14544] / [i915#15608])
>     [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html
>     [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html
> 
>    * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
>      - shard-rkl:          [SKIP][619] ([i915#15609] / [i915#8825]) -> [SKIP][620] ([i915#14544] / [i915#15609] / [i915#8825])
>     [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
>     [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
>      - shard-rkl:          [SKIP][621] ([i915#14544] / [i915#15608]) -> [SKIP][622] ([i915#15608]) +1 other test skip
>     [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0.html
>     [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0.html
> 
>    * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
>      - shard-rkl:          [SKIP][623] ([i915#14544] / [i915#15609] / [i915#8825]) -> [SKIP][624] ([i915#15609] / [i915#8825]) +1 other test skip
>     [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5.html
>     [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5.html
> 
>    * igt@kms_plane_multiple@2x-tiling-none:
>      - shard-rkl:          [SKIP][625] ([i915#13958]) -> [SKIP][626] ([i915#13958] / [i915#14544])
>     [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none.html
>     [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>      - shard-rkl:          [SKIP][627] ([i915#15329]) -> [SKIP][628] ([i915#14544] / [i915#15329]) +3 other tests skip
>     [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
>     [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>    * igt@kms_pm_backlight@fade-with-dpms:
>      - shard-rkl:          [SKIP][629] ([i915#14544] / [i915#5354]) -> [SKIP][630] ([i915#5354])
>     [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html
>     [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-rkl:          [SKIP][631] ([i915#14544] / [i915#9685]) -> [SKIP][632] ([i915#9685])
>     [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
>     [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-rkl:          [SKIP][633] ([i915#14544] / [i915#3828]) -> [SKIP][634] ([i915#3828])
>     [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
>     [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-8/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-dg1:          [SKIP][635] ([i915#9340]) -> [SKIP][636] ([i915#3828])
>     [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html
>     [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>      - shard-rkl:          [SKIP][637] ([i915#11520] / [i915#14544]) -> [SKIP][638] ([i915#11520]) +1 other test skip
>     [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
>     [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>      - shard-rkl:          [SKIP][639] ([i915#11520]) -> [SKIP][640] ([i915#11520] / [i915#14544]) +2 other tests skip
>     [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>     [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr@psr2-cursor-blt:
>      - shard-rkl:          [SKIP][641] ([i915#1072] / [i915#9732]) -> [SKIP][642] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
>     [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-2/igt@kms_psr@psr2-cursor-blt.html
>     [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html
> 
>    * igt@kms_psr@psr2-sprite-mmap-cpu:
>      - shard-rkl:          [SKIP][643] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][644] ([i915#1072] / [i915#9732]) +7 other tests skip
>     [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html
>     [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-rkl:          [SKIP][645] ([i915#9685]) -> [SKIP][646] ([i915#14544] / [i915#9685])
>     [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>      - shard-rkl:          [SKIP][647] ([i915#5289]) -> [SKIP][648] ([i915#14544] / [i915#5289])
>     [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>     [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-rkl:          [SKIP][649] ([i915#14544] / [i915#5289]) -> [SKIP][650] ([i915#5289])
>     [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-rkl:          [SKIP][651] ([i915#14544] / [i915#3555]) -> [SKIP][652] ([i915#3555]) +1 other test skip
>     [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8722/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
>     [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    
>    [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>    [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>    [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>    [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>    [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>    [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>    [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>    [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>    [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>    [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>    [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
>    [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>    [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>    [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>    [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>    [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>    [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
>    [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
>    [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>    [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>    [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>    [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>    [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>    [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
>    [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>    [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>    [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>    [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>    [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>    [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
>    [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>    [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>    [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>    [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
>    [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>    [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
>    [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
>    [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
>    [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>    [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>    [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>    [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>    [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>    [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>    [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>    [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>    [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
>    [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>    [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
>    [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>    [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
>    [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
>    [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
>    [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
>    [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>    [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>    [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>    [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
>    [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
>    [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>    [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
>    [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>    [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
>    [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>    [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
>    [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
>    [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>    [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>    [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
>    [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
>    [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>    [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>    [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
>    [i915#15573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573
>    [i915#15574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574
>    [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
>    [i915#15609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609
>    [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>    [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>    [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
>    [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>    [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>    [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>    [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>    [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>    [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>    [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>    [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>    [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>    [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>    [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>    [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>    [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>    [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>    [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>    [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>    [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>    [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
>    [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
>    [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>    [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>    [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>    [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>    [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
>    [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>    [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>    [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>    [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>    [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>    [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>    [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>    [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>    [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>    [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>    [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>    [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>    [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>    [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>    [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>    [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>    [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>    [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>    [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>    [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>    [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>    [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>    [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>    [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>    [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>    [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>    [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>    [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>    [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>    [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
>    [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>    [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>    [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
>    [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>    [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>    [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>    [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>    [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>    [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>    [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>    [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>    [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>    [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>    [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>    [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>    [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>    [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>    [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>    [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>    [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>    [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>    [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>    [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>    [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>    [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>    [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>    [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>    [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>    [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>    [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>    [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>    [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>    [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>    [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>    [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>    [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>    [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>    [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>    [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>    [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>    [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>    [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>    [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>    [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8722 -> IGTPW_14439
> 
>    CI-20190529: 20190529
>    CI_DRM_17900: 8059f097e25f736bb3da09af6a9b283079abfd4f @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14439: 14439
>    IGT_8722: 8722
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14439/index.html
> 

