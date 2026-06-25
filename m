Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACE7CDB466
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 08:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF0710F1B9;
	Thu, 25 Jun 2026 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO+0nnNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEBD10F1B9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782377212; x=1813913212;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=PQOeyUxEGA9nhW9i0DBzA4CqiKsmxsrkhjJkAfcV6Us=;
 b=nO+0nnNkppVu5kMLN2Oo5ZfEXGx3i3X8x+sJOe9UkVRpIQ+HIWlsjpvV
 liyXgVrAYunT+ahNtDKDrHj69h7oiqtf38amSoGF6wrbz8+k0ZgrrnvVP
 +VNvusXWk7zk/EX86QHaPsh9faJfeslO+eNn+rK7FCOcBSfBAMHysIkDX
 x1hliMu352ZlxIMjfj7uQAvtB6k0O4WV6NaWa1tJ7ElkERozY9Jhx9WsW
 WzuX4bNdrX8AvZCwLVVAs3ZQl1d6NvVChtRhA392lRmzwhsBJfYxIzHG1
 tSD9ztNCO4hvlJX3ERtZAUJp6kfrbjfB3SQp2mAxM92OwfGlU+Ji52NLd A==;
X-CSE-ConnectionGUID: cOaU3RfSTUiUtj+ZNdUXCw==
X-CSE-MsgGUID: XVcJKp0ORFa/G9vV1Cjwug==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82919008"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="82919008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 01:46:51 -0700
X-CSE-ConnectionGUID: 7WKgCMPYRbeONmWijxrteg==
X-CSE-MsgGUID: g/BgxcG2T8KRZ9iJ9kDVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249078458"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 01:46:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 01:46:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 01:46:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 01:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hL/BQo8xTRclJRT/dtj9ytlLo9XhDkVKnvwBx1jacIWFUubTSiji396yaLyF+QaX5l8r1KC2WzHCd5rwH+GqlkzyoRY2sLh9iemIbA3A1aFBImBvQzvmALvl9QeahrrT43L5oO3ONyhGXLy2mDaEin+IagrwUk/A09DAy/s0bdwkMxgPvaOFL3paBTSynC6ze6gSGFwmY/t9PoXlOC7mvfppzhSMugd5Mt5HhS+2+BdQ9rEqqrT1hlIJ/wIPIkesDqL9NEhBZ3tQFZEMj9RBBAF2Zal2lJEp+Y22w5QhbGlkbRKXdqCPNAhs3g40hSLsLPZVnNUxXU/SGXJI5eEALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enRfvtOJuEbU9QD/deQlqF76U82Kvv0RrLdNBrVNVqw=;
 b=stfO9XFhA82ErdBtpfUGw1d4D/uuS4KKkAsqK+nPOx+s2fzSnPet3P+rixJekdlBkKgVMUiRsoa8NxDcK58k6sO5VTLCiybHjtsyMjThz5aXbThPsBHkzGXNChIdmtlf1JE3PQVRQPYNWQKDpxU+HDgVfs8zcbzobWokw7ftfU19I/gBl1CKn937x+1Z1mr0q3ZiMzNV9F8XNeKamT4QPuw6/r2zA96APpasH5Zam5AwAaY01baSnT0AZ/HkpqFvgoU9MXnwQ4EheqAhraWWBIM1CdTKSfwCuoJqnnn1a/I9Mjzk5rxLIdGuoRAqZw93eseN2aiDz51ZGcb9Tm4T3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 08:46:42 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Thu, 25 Jun 2026
 08:46:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Jun 2026 10:47:13 +0200
Message-ID: <DJHZZX3NBXVR.2GWSSH9B7LDLL@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 00/25] tools: remove unnecessary shared library
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <878q83q4od.wl-ashutosh.dixit@intel.com>
In-Reply-To: <878q83q4od.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: DU2PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:10:232::30) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 5482ba5a-fbd0-4333-9212-08ded29647b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|6133799003|22082099003|18002099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: dXEYUbyQvXehbedFW88yGplPW2GZokfPrHjUQe9sOzEI8zVoQD3wKcqBASR9IbeisHJfSWIbDlkm9EZgml1/HzQZYh0+WRw7IwAbDaX6kzJwFkx3U/otHhWDUrbqBwdCh/9uwlMh1uLK8H/FvaJtrsaxAH2iHyPefHmq23siZCaPxL5isazsk2fkFCzAmf1WwbNcHew1POrVHLytv4CPdGOBH6yaWR7pgF6nFh0JHNZVM2bqUH7R7tJne7X/ZjojwZGbyvWwV8wWSCT3MDcI3+oH9sV3AplnAEwMN+ZrG5X1mAmLAjqRi53w/mSwgu49PK3Z7nhl1tuauTta7JVksa4ink+so4fBIuPm5wuQcZ7h6awkWGQfY4Hl7qo7B3NeTc8HAY28o76LBkWulVaR2eYObDIKgBsh/Nng/DkYiVkVENlG0X4drePEKS5OC1JlUKLyeFmsrL7hH2pUOLvWN4VLi8YmQjYNz1pU+KEkpYduVM4s59CvZBTehFqGL8t9lc0Hkqqm6YT95Sm8K2PDSNhSUuKy0fEJKuHytAVP2p7LtQl4MGbrELkDU5gqFIB4VYv5J/IbBQvrgxl4bXeADnlPdQmLXboXhwfbf8XsvOed+SsWLssfJ7MHlUP9+etY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(6133799003)(22082099003)(18002099003)(5023799004)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGcza1BIY1Q3ZmNhQ1BralBIdndXZHg5T3A2TFN5UzVMTTFiQUwwMzB0MytJ?=
 =?utf-8?B?NzNSNVNrOGI5WEY4RzZ2RzNVZUlmNVNVRVI3ekZKcEgxZkpmU3laOUw4ZmV4?=
 =?utf-8?B?V1U4UWRhanFXTFJCWmhjdXNqK2IyVisrT1FjVThwTXI3SGZEUk1ZVmlVa2Vz?=
 =?utf-8?B?RVZzSS9SYmpiZUxmVFVvcktqQUxNdkdCV2Uzd0wxdDREL25BblhvcGJNbnNV?=
 =?utf-8?B?TVlocTd6UFVZdTB5bkpmeW1JeGMrSFVmcjA4VXRyY2NmenhCcnZ3ZlFNbW9H?=
 =?utf-8?B?NXkyMDEwR2R5ZFhyaWVPck44cTIvbStwWVBVbnZkVVVjV1h4QVdGM01JdHhs?=
 =?utf-8?B?YllNSFpITE40dHZGT3VrSk1SOUpnN3FWeHZwUzRMYXpPWldwL3lONHgzRFBI?=
 =?utf-8?B?OVdKbjVsbWNKdSs4aWV4Snd4NWl1ME5rN0RpQWZoSVRBaCthaWV3bHBtOG43?=
 =?utf-8?B?ZGJXTk9vanlBS1JWKzJ5Zm5XRHh6M0QyRXFTd1Axck5HekFGNXdzcXhnZEFm?=
 =?utf-8?B?aWp4WEtVajdWYkd5OVUxS0VRWGdRUk1aL2c2YlpTSU1YVlc2R2RUVDlqVXh2?=
 =?utf-8?B?U1NaYWJYUlFjSjdzdEEzZ3RHRGgycmZtR3htWXVFMjlNZFV2UmxtYWRCRHdJ?=
 =?utf-8?B?VVFQSW1mVGtBaFlEbWEweDNTdFZRSjlueGRja29aRUgxK3dvNVhDU1BSVk91?=
 =?utf-8?B?cFVINkJyNHU2clU2VE9kWXRtVDBjcmlRbDMwL1BnVlF2ZjZzancwNmcwRzM3?=
 =?utf-8?B?cjJRZjhLdElONHdyanR6WlE4UlorQklHVjUxWEpTWnUxSGJraUI0UW5rVTVq?=
 =?utf-8?B?cFZaRzU1UU5ic2JKSENTd2FjMUljeHJvb1NtRGNZN2NyODJJM1lVZkpQQnpW?=
 =?utf-8?B?R2hRSE13SGZjL0c4NmwybEViNm5ablNHZ0pHZ01qR1loM0dNZnJPUXdxY2I1?=
 =?utf-8?B?ZE1sd2xYekFnVlBGL2xEeGV5TU5xQmU5SG1jZytPZzRZbjc2d2hPSDhEVm1q?=
 =?utf-8?B?a3grd3U2VmRwRUYzU1lNN0IvcEg4cU9JcmJJQ3NPbnozYWdLTTRGOXhRRXh6?=
 =?utf-8?B?NGg2OUNjeHJQM1NGcGUrMTJhSjNhYzA5TlpHR3dPWUZHNDNEVzg5WEhORHRF?=
 =?utf-8?B?dmR1bzYveWpXWmhmZkpnOWU5eXo0T3Z1WjdNYlV6MkYrbVNzaTBEME4rd2hO?=
 =?utf-8?B?cnR4ZWNvSTMvWmNqZVU2L296MldmZWovR3pBOSs5VjNSekVwd1ZwRUlZdkdF?=
 =?utf-8?B?TmJZZ1M1MSsrdGpSeE5BM2xMMEtYRVpBbWRVVDlaUG9TUFVmblJzY2Vic1BM?=
 =?utf-8?B?bTZqMjExcklVM1JuaXgwWDRwR2VLeWFFNWFDUllHN0dFYmU3aFJBQWNJS1JL?=
 =?utf-8?B?RG1GWk5GWDRGOVA2Y28vVWVheUErZDd6OFlDYnpuOW01N1c0WFdnaWRCb3k0?=
 =?utf-8?B?OTd3bUFmL01zeWlFbm5URWU5T0d0eFdnbDlub2h4cWNTd0NwZTM1TjF2OWw1?=
 =?utf-8?B?MG5TNm5YcGJCRFIxYlZ3Mms4M2FBVi9mWkUxWGltVVpjWVYvU2NyamVqK1N1?=
 =?utf-8?B?TTlKNlVLMnNFcEpiMHc2WlkzRUJhcC90Yi9oNHdVbFhRdkVPa0l6aXhLNlV0?=
 =?utf-8?B?U3F0dHR6NjkyWU91dUF6WlpESGxTOW10SkVxU0p3TC9LMDJjOHhRdGE3cENr?=
 =?utf-8?B?WGxCcnN2USt0Z2djM3o5dndoY0J1eEpBai9SRXVabmtOMktrOTM5eW15aEhJ?=
 =?utf-8?B?TE9KWHF6TCtDaW5uYldDd1hSWVltajB0Y1cxaFhUakZsVjRlWmtKWllteGhh?=
 =?utf-8?B?cHhXeGxISFovOWM4bGpIYVJGckEzbTV1T2NDa0xiOWxqTFRIU1hJeFNnZTJQ?=
 =?utf-8?B?OSs2N2dGb3BQcHpiZ1NQQURsZXpxTXBIQlI4TGtMdUJDWnB6NEZTb0tJYmxL?=
 =?utf-8?B?VnFnL08vRGJkMjZ5VURueDlsSDZGZ0ozaFNrSkdVdXdCMkQxUXEyTTdxNHpo?=
 =?utf-8?B?eGplbVoxYVdReWgvYlRxczhSZkhMOW1oSjNlWTN6RHhQNVdOWGNZYnFFNnhS?=
 =?utf-8?B?aldjUUdJMlBoRk4veDQxV0hGZXllWWNyTXNoWExLVjlUSHI1YTM1R2JMcWRR?=
 =?utf-8?B?Vm5wRUxpQVlJSTdsRm9DM21zRWRGZ3U4UTBYL05HVUpjenplOFBvcmhmSy9n?=
 =?utf-8?B?cVdlblFMN1J4MVpFV1RuczcwVGk5N0JUMUMyZHE1V2dRbXVLeTM2ZnBqTlgy?=
 =?utf-8?B?bzQ3LzFXZVZjRTY5aGU0amMvNHp3MWpTc2Nkb0F6a1p2R0ZTOTRnL2ZkQVc0?=
 =?utf-8?B?dUUwZlZCQkpGWUF5MVlINjJaakZDbXdKcWsrQS9aYmtuTFZRUVZBdFQ5MUZ4?=
 =?utf-8?Q?+cWmlk6YRK4z/bMA=3D?=
X-Exchange-RoutingPolicyChecked: HNB9wEaHWR7x8rvizgMN7ZwDrwpaQSp/xjrcpPb7Q780wiNEZpNRVDrjuChv+Mq2hm9E3ElXBr06FGErbXH5aO0s/L0lKG+RL+cvZpARzU8WKkzdu3lfO01r2Q6hSMylOs83Fb4tHEWW85b3Zoov6NgsxdR5v8fgfQpdcJzwesmFUcWBiAiyG3yZp80/7zgM71k/HhTPPikt+/fhcIS+afQa3HepBWayzx8xupL5D+XEZkHvNed8dehiDZh85ND6G+w9125oRjnCqv3LOJ8LkPd71vlEW11fDISEEqox6x2IsFlYvnGFYcGRJJapTmxxMBcdXeAQHm8hDDoDRZmmmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5482ba5a-fbd0-4333-9212-08ded29647b3
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:46:42.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/HGM+0+VMVt/zmUfiPMPn/RjmG/05dfcB9Ak+87YXYXmVSx589LffE3PElOU0u2tkwG1r/66ZwjyIrN4QjeeypGsgFrYHuhwnvsN6myXf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Hi Ashutosh,

On Wed Jun 24, 2026 at 6:33 PM CEST, Ashutosh Dixit wrote:
> On Wed, 24 Jun 2026 01:47:07 -0700, Sebastian Brzezinka wrote:
>>
>> Standalone tools linked libigt.so as a side effect, pulling in cairo,
>> pixman and libX11 even without framebuffer use.
>>
>> Following intel_gpu_top's approach, each tool now links only the static
>> sub-libraries it needs. Five new ones are introduced:
>>
>> lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
>> lib_i915_decode, lib_igt_reg_tools.
>
> So I am trying to figure out what is the "real" reason for doing this.
The motivation for this was explained in 2019, freedesktop bug
#110249, by Eero Tamminen:

"It's annoying to need to install these redundant dependencies on
e.g. headless media transcoding server if one just wants to use
intel_gpu_top to monitor GPU utilization."

Chris Wilson fixed intel_gpu_top back then and said "One down, the rest
left to an adventurous sole." This series finishes that job.  Tools should
only link what they actually use. That's basic. intel_stepping does
not need Cairo. intel_backlight does not need ALSA.  Yet today they
both pull in 30+ libraries through libigt.so. This series fixes that.
I shouldn't have to explain why a tool that reads a register shouldn't
depend on a graphics rendering library.

> If tomorrow the tool uses a function which is not present in the tiny
> library but in the big library, what are we going to do? So, isn't it
> better to link against one big library, rather than tiny libraries?
>
If a tool needs new functionality in the future, we add it to the
appropriate sub-library or add a new dependency. That's a one-line meson
change, done intentionally, with a clear reason.

That's better than the alternative: preemptively linking everything
against a library that drags in Cairo, ALSA, X11 and 35 other things
"just in case" someone someday needs something from it.

> Since it should use dynamic linking, it is not that the size of the
> executable will change one way or the other.
>
The point is not executable size. The point is runtime dependencies
what needs to be installed on the system for the tool to run at all.

With libigt.so as a dynamic dependency, you cannot run intel_stepping
on a headless server without first installing Cairo, X11, ALSA, freetype
and 35 other libraries that the tool has absolutely no use for.

After this series, you just run the tool. Nothing extra needed.

> So what is driving this change? Maybe I am missing something.
I appreciate the question, sorry for not including the link in the cover
letter. This issue was raised by the community back in 2019 and is well
documented here: https://bugs.freedesktop.org/show_bug.cgi?id=3D110249

--=20
Best regards,
Sebastian

