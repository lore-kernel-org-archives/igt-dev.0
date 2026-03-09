Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B1FC9EDF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 06:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E27010E0ED;
	Mon,  9 Mar 2026 06:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3GtpFbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0FA10E0ED
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 06:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773036472; x=1804572472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yLcpcm5U6/blvh3wkCqAjn2G2rgcQsnPFa1Ks4fLPss=;
 b=a3GtpFbjMJ2FyVqQCfRLqtnQLLRUmh8Tz1phigW9uUUSB+yutfAwSWHK
 FQA44njv2onHVfZWZjs4zwDQY3HnQKMq1SA5ksEn8ZtcQIjnLKM9Q4tef
 XJgDbcf6rfIZRr5k+Iq1/Pj5vMh3wiBxPxxuM4b/V0rsVo21EWLDfKYIO
 hlQS/uu53OOcdb8vqbeBzVesq8W4SPwPVSJiaqA0q0br1969S7bvLiLra
 iXb1QvPAI/761aUQOae0D4xFoL3BSHVX/oDKrh2NutDXen1cuVXU7bMLQ
 ARpgW0qVwTKnmTTMdcy95BftcRtgOXzWW5/Pddwmf5Bfy2VY2q9Vd+Cr7 g==;
X-CSE-ConnectionGUID: NJ478iasT064lIY+8qMgfA==
X-CSE-MsgGUID: rTCSeNRuTBSm4wcdgBuOJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74164927"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74164927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:07:52 -0700
X-CSE-ConnectionGUID: z2G/ZOlHQbCpErj1KmqUyQ==
X-CSE-MsgGUID: OgIVpU+SR3yfTwhxlyiKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="222332466"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:07:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 23:07:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 8 Mar 2026 23:07:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 23:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVGEcG0J3jNUGibFEcOzqtcHXWpIsapsyOL7ePPW41vdMU2vTYmlsjXRPYEW+WbpaDZFnFQh2rlc4HuSZUHs5GyN1StwdIw03gCqAcTcWqMNDpPlSQJF4yAQtcrkl9mnH/0dd73CeNXGxUYMOjcknxcWrtuWgc/0k3BRQPeMuDw3cTHqLJTNgbElfTeHB7DBwOwgcSZoXB0ZSOEmNvNgrJG53J1oeJmpBVBCoqVRcwyLwK93EfdngkSaRHpHd5r+XpHxJd5/CWpY4iCCPYWScYdxvEAJTU+RAVQtW9vVtvJhOkeSe/I5nOE7wahDEmhN38cPInD4H6Jz5ga7SMTRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQvNadVHXpREiqcFp1qFgwloGwqDhEzgTnxQkPKgDpo=;
 b=xbpZAVyIjIm1/g2AVqFZ8xyUUcfEBKXqePr09NQm8OgDlNUVHn6bNkBvrxwZElIgEweR3+MguhqfMBq4A3Gz6lRsdka/asnp0rwOSSwPpBwsys5zCTn3PiZBdRWQ3u00C1NsBUALSZkOISG+JtZLcEIKjOYy6feXKMq9ztyEWY21OGRf45xKudZ0uhvmCY9lDzyo9nuNIYo1U7Zyf2FRpfkTJVzVWh5ORjVa8yeQ2UE8hq4gGqI6BI39o0heLmrM3n0TGBvOzEWj0UWgGNcbhF8iN69BN1TLO6TRXsgO8UyWkD4e0XiXiviTdamoLzhb7WoSsuRDVm9OpWyZmDFKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 06:07:48 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 06:07:47 +0000
Message-ID: <6103cf07-7e83-4395-b646-36e2adfbdc7c@intel.com>
Date: Mon, 9 Mar 2026 11:37:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_content_protection: check sink
 capability after modeset
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8DDE1FA1963B0F504861F8E37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8DDE1FA1963B0F504861F8E37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0d8bc7-4d68-418c-dd0a-08de7da22fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: sQovLIyECyGAyJ39nLdB9Myww69xXnrfLYkhYIhr729x5N2Nd0kJ49euG7wx2MXgZOhP5nE0i5aot/2MkT9gWRlXA+ukCQ0Ay5ZN4fvB6LjXKHUCJ5k9I8SRR8v9JQCYVO/0Vi+4q5oOKjmNH+8aVSUg5eLP1fl/Alm9qWyabFXoGHIQ5SZx8IQnN3SVadihGPFkzaWUYXReL/Vb2ZVKihLG3VY54OUHZqPS9ycGuz8LrUXr6AODWb0Aijby/4Em7476VjAqmXOy6M9T9+LggODpP8AiK4CVPUKDiBK8keSf2eGFkxqBg2XsI+aEWQacXMfPSfj5PjhFq6anpWYDZZGY0/hIEW2fUPTKTOF3ybd08dZ5ui9oQjiklGVfJwRt2kbbD4LlBkUuoVSYHmzO3Ue1SW+9uWGA8rfrxMOK6T4e9FDXOEljBqNtHvBo/jz3Oxo9G218Q/NGX7EhBoCaEofLWw5ffwp2UVP3UtzQsO7tcdKhq2/JtyL1GHcdOh6xzqJVyLxwNa8dJRZ0dCi6QlhrHnzvzFvWNFvQEPZ+3SRmT1w42Y+Ot5QO9xMghr16LhXdetO3vnT1qJzuGaEiiTuxkcW26qTgob6hZuGrzWHMi258d5M2d822O82YntPD+qGaApfidTr81w4pqR1hfsH1+yljzwUKB1TG+Iw9YvT+ASG6A8FqiB4IzPFjBV94NshtIZRFG5rXMs2WvOdHGmvSPGbKU8hkHqjsBu3fWvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2N1K0RURTluTXF4NGlPajNKcVg4WkZrZ3dpZDBiUUw1SzNpclluN3dYYm02?=
 =?utf-8?B?R0V4THJyQmUxeXJVT2dEaFJXQ1dzVGhYUW5LQXREME9lUkFweGJ4VGg1WGE3?=
 =?utf-8?B?VVN3andrdW1ScjBZbk9TUmFSd0tpQ3ZYYVRIU2w0MlBlZDlFa0s3QWoxQWsr?=
 =?utf-8?B?L2F0RUtEcHRRU1d2U0tLTUF3SUFFOGRWQjd6OU1Va3VHK1NsWEVJbjl4aVM2?=
 =?utf-8?B?VSt6enVEU2lKZ2lGT251L1dnVlNJd1k1VEhDNlh0Tkd1b2dXVTFnbVM4V2Fr?=
 =?utf-8?B?ZkVKc2pQUDN1ZzFKK2E3WVVUc1JMaCtHUUtrRnc3TngxWmwzZTNJdk1Wd0g0?=
 =?utf-8?B?OFd0YXFJYXFwN29jSnBVTEsrdXB1c3V2OWp4cXJSL2V3cUlPai9Pa3NOclRo?=
 =?utf-8?B?YVhGRFNqZFF5WE5kVlR1bTNkcDZHRUViNVRJcXhQR1RwQ05LN0VnTW9KYm5q?=
 =?utf-8?B?KzJucnNZNDB6TC8venRCVHNSN3JMSHU5L04rTEJaQmV1S3JlQ04rajJGTmw5?=
 =?utf-8?B?emxWOHpoSzVNOXFQR2E2d084bEdkVUtGL2t1UXZOYUpya1FMVEpOOEdmMDNu?=
 =?utf-8?B?SFpRVVphLzZMaTJRS2EwYWJuUXBCc09JZFFTS2Q0bGFFSXNPSVgwdDR5Zm9x?=
 =?utf-8?B?cXdSOEhJSFJaS2N2cDJ5eTRXRTNEc21KNHNaNk1CNGZGa1l3T2VPdzNVSFJS?=
 =?utf-8?B?eVprN2Z6ZFV1QUFVa0IwVUc3cFFJZkU2Slg2WHVHVDVPVDZLRG1QWDk5UGU2?=
 =?utf-8?B?TXJpMnNoUHFaczdlbFVaSmlCNTVwN1hRM3NmU1ZZUVQvckZCNUovWDAyeUdD?=
 =?utf-8?B?TU1UdWk1RlovTzBqWFp5Nno3MUhsd3VTVml1Z0pLcWR0U1pUUEhQVXlPUXhu?=
 =?utf-8?B?RXF4d0NIbFpSS0lDRWlGYWp4MkVMclVDbGEyaWVBTEVUbTlvNDJpd0thOUxs?=
 =?utf-8?B?MzdrdWhoV0JXNkJRa1hieDF0NDRrWHcvWWxhRmZwMnhwSVQwNUJJVXRITmM0?=
 =?utf-8?B?Vms5anZzTXEwUUwrSHpIajh3RlJJczMyN3czU05QS1lyRTFXT2xOOEZMaFUr?=
 =?utf-8?B?bkYrdnp6ODl4enNYd3dIZlhQbzAzQ3pPYTIxZjk4b2dEMkZ0enhHd3JqTTR0?=
 =?utf-8?B?QzB5bVo5alhQNzY4QUxqTXd1ME5hNkpOWWtMRk92Mm9SUFg0S21hVVNtTTlx?=
 =?utf-8?B?WWRLZEs0aHJJZWR4QTFmY3pYNi9iVVlFaE1NWTZsWFF3RU5GRjJqSlliWlYy?=
 =?utf-8?B?RDhpMzN3R1hjTjVSd0ZYSFhEb1BKL005OUtGTVFjTVlMVjVjVVltQkcvVjUw?=
 =?utf-8?B?V2JIV2pZckROYk9RRldpR2EvWXhZZ2Y3Tk0xNVp6WFVGWUQrMHFGQ3RBbzlW?=
 =?utf-8?B?ZWgwY3pNN3JPZ3lTMkI5Z3pZY2UyRG15ZFJYT3djY09LZE1SaFhFQktrM3lW?=
 =?utf-8?B?S0lBOUNKelJhTS9nTU42Sjg1WXVQNkRqcTZKU1g1c0pzT3ZkWlRqeWZmMHZN?=
 =?utf-8?B?bDBaTHpHNDJ5NjBXVVF3cndKMlNPc2dHQW9XTnh3dUVnUFNzVnBkS3VBWGg2?=
 =?utf-8?B?MTV3enFTS0tDdGVyRFEwUGhsK1RCMVJFTVhCYS9HMGdJcWMyVHhrK1M1QXpG?=
 =?utf-8?B?TklSQ0lXMHdOWVZwSTZaNzdGalgwSTFHUHpiZmpTMXdvQ2dBOS81Z2xCc1pF?=
 =?utf-8?B?RnRQWjVrRE9aRzVtT085NDhrZXduT2tNTEdYTUVPaHZwRzg3Z1BqTFF5cW9k?=
 =?utf-8?B?Q2gxYlQ4d1N3ZUlOenpKWkxtbEpVTlFSMHE0YmxLOEQ1UndTYWJjM3VwZU81?=
 =?utf-8?B?NndUTGs2QnNrUGpteWZHRWp4c3pqRERnK3NOYWVqQ2YyWTBaQk9TYi9zSitS?=
 =?utf-8?B?ZkliTFIrb1kvclozakhiOVcyUmR0Zk5lMXE0TFFkK05DS1B4Z0hDcWJzSytj?=
 =?utf-8?B?TDErSnR4UXR2N1Z2eFlBVFlOQlhJZmJzR0hEOTM1YStsWWZtbDJ2dGYxSEhP?=
 =?utf-8?B?QUFRRVg4c2xiMUUwZzJ5SVBVV25vWjh5ODdzRWg4TFhrSG1Va0hZTE5HdThB?=
 =?utf-8?B?WXRmT29kdG41dVRGMlo4ZWtYMjJwRmhCRnRzZDBwS09wWmxmZVJoY0o3V09M?=
 =?utf-8?B?cnFNUlg1UVR3OWtWVmRpZW1IbHpYSXZLOEFnemRPRDgvam0weDlRRWd0cVVP?=
 =?utf-8?B?UGZ5c3o4SFE1WnkyT3pVOFBTTlY3d2lTbzBxR0plTTNNMGRCSGlEYTZJQWNS?=
 =?utf-8?B?VlVYNUZueitHMmllUlVzVSs4eWhwZlNlbGczVnBZbG9vT2tYOWlwUGM1YW1U?=
 =?utf-8?B?elpremRPeis2bGN0VTNWUEhWR2xndjFFZjNYMWN5enFlcDEwb2tveWlsR0Z2?=
 =?utf-8?Q?p3mJrxTTbSYt0PHjXZ210lSKPvO4rUDOyIEHk?=
X-Exchange-RoutingPolicyChecked: C2MCrwDgPpoqBCAVCWAY+binxXnxXMoXb51CgQn8bghlFgF8DCV7GdMYw5CrhVNMaGDo5pF7ZF64nujFZYei3DLS7R/IMynPr89mR5WNdY8HhWMgSXNE4uq+NdlIrlCMe39v2maYG2i3PYkDbZEAlb5/38bsppIxYqD9jAOuJ3RBW6kps0a06W1y/oi5KI5zFLhiryvZav/3yeQB4goKEM0apxZ6cuM7ckSpuLXqYQKdRqaFLRZeh9PM/cAwXs/oZ6kX5Fm4sns36aciUHWDyk3TV3qQ4rDZJ1j38RF1EQwqnWexjwGha91Ejn5EU7jp7TkbBrYOq3gmqrPuWAmVMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0d8bc7-4d68-418c-dd0a-08de7da22fe8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:07:47.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UfdPiffE++rkl1CD1/unMGeCQDPUP4CaLMdkZojIt0RindMe/RpvOk/K/KQiWF3RCumvTgyisZ1W48NJnXpX0wnKLVALxJdZ4gktYmxJfJ9+hzTyigLEtNDFZm1U559
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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



On 02-03-2026 08:24, Kandpal, Suraj wrote:
> 
>> Subject: [PATCH i-g-t v1] tests/kms_content_protection: check sink capability
>> after modeset
>>
>> The loop checks HDCP sink capability too early, this makes test skips on multi
>> display panels with "Sink has no HDCP support"
>> on valid connectors.
>>
>> Fix this by validating output/crtc combo, do modeset and then check for sink
>> capability.
>>
>> Fixes: a85208a45759 ("tests/kms: Use igt_crtc_t instead of enum pipe, part
>> 4")
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_content_protection.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 2c2ffa150..1f1f45fe6 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -725,21 +725,22 @@ test_content_protection(enum igt_commit_style
>> commit_style, int content_type)
>>
>>   	for_each_connected_output(display, output) {
>>   		for_each_crtc(display, crtc) {
>> -			if (!output_hdcp_capable(output, content_type))
> 
> This is weird that after a modeset that the sink starts showing HDCP capable.
> Does output_hdcp_capable belong in the outer loop instead of the inner loop
> Which iterates over crtc. Why keep checking output_hdcp_capable for each crtc if the
> Output remains same.
> I think optimization in that line could fix this issue with lot less code movement

My Bad! There are two issues here.
1. After rechecking I observed that the regression is not because of the 
mentioned Fixes, but it is because of the (86971fa4d531 
"tests/kms_content_protection: Check for HDCP before setting displays" )

2. As you mentioned, will move the checks to outer loop, This will avoid 
printing log messages repeatedly for unsupported outputs per crtc but 
this wont fix the current issue.

I will work on this and float a new revision.

Thanks,
Santhosh

> 
> Regards,
> Suraj Kandpal
> 
>> +			igt_display_reset(display);
>> +			igt_output_set_crtc(output, crtc);
>> +			if (!intel_pipe_output_combo_valid(display))
>>   				continue;
>> +
>> +			modeset_with_fb(output, commit_style);
>> +
>>   			if (is_output_hdcp_test_exempt(output)) {
>>   				igt_info("Skipping HDCP test on %s, as the
>> panel is blocklisted\n",
>>   					  output->name);
>>   				continue;
>>   			}
>>
>> -			igt_display_reset(display);
>> -			igt_output_set_crtc(output,
>> -				            crtc);
>> -			if (!intel_pipe_output_combo_valid(display))
>> +			if (!output_hdcp_capable(output, content_type))
>>   				continue;
>>
>> -			modeset_with_fb(output, commit_style);
>>   			if (data.is_force_hdcp14)
>>   				set_i915_force_hdcp14(output);
>>
>> --
>> 2.34.1
> 

