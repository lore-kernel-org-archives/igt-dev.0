Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C3CA9EDE
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 09:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B3810E8BF;
	Mon, 12 Oct 2026 09:35:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78BD10EF8F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791797643; x=1823333643;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SGC+V+DHZ++G8e1IJxYAGEmsgIxhlKX5s+HTduzSjjo=;
 b=QZgeHdn6/3o5y23Y8q4rWusKRP3gefmKWsG5ZZM4eL9VwnQxSfI1eJCC
 W1hNwMe0YkW5eXg79OsmlIG4SjhSABcbcitKG4ck15yoZ49gJ+wu7biAW
 YjIHdHxi5blDk7994UW67NuV8XJz3kdvkt17bEJe0eexRmRYrmXvqe8UT
 ha/z3U6CncpLPlu1TBHGdkGOKVGdzoBnjXK4HSk6KG8StIMPckYLak3Zz
 WLP8fpph5fvLIuIBR2jUrdBctDErlavTyZ63uZ/UIizFW3m85Q4sbiVlF
 2rmBDSPjgG14CENt6nX/cKPTcsvnyTA0u7pjfx1/3RdxozkxkteZaUE/t w==;
X-CSE-ConnectionGUID: UJpbl2V2R+aZ7xrnGt/isA==
X-CSE-MsgGUID: NPNbYmSiRXOnhlQCwU8vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="491181"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="491181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:34:03 -0700
X-CSE-ConnectionGUID: PV4WAc4pTLeD/rw1g1aBLA==
X-CSE-MsgGUID: Hu5VRNhXQ967dQSomCHIJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1156195"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:34:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:34:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 02:34:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEutNGw93VuBqqAbtITyj6DCod9nZPevpGYxmlKHEIijXl/TLen9YOjeFOkiZDbCfsTKe/zeWCYA4tUHpyYGvFRg9MDAtdcAfTfXE2Zln60T71HQ551TCBivVk3CypIRpEHxeyPtjSFfUl7sRuOY65n0/6/Bac/RuQn1vFplGA5JPIE/dOYbin24VcBKkrhmfjulzYGHNMa4bIrqKoofn7tNtvChoaKmtJtKN/2gYMWSQ7+LerfngGcxwMXqFs/aVQOrmVAmOkDW892q04qCIBDU2zkLfhDf/0Wfb6Qwu4v3YrUDAKah/tV2+GfDnuRQjDqAdphSkT/DCFhrdfzpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUw91MOG16J6pppbQOjog6whx+Zh/p1wOz1xYNC5FTU=;
 b=OhT5brKUSVSqW68Mh6wrCauykoGW78ze2KbLrmfoMDp83t4TYeAwWP8Yd2o+qxp6srss9SgPxq3DcAms18VrXHL5gRMvXxs5prWcgJuasK8EnMU8q2tN/cXYgE1wOyaEv36FAyyOye71DhVFzSRqUXfnLiQWC60nAXHff87hrVQWtQxLhKbYuSFsK0V8uaHRR7lNQBI0Z3oJwTaj5lBvA5jXTZkebTaAUjQYdiC/tn0GJgK6o9NW73WfQZAfaQZJTH4LaF1QufAZy2E2YlTNeBktnOin5RrdUUHKtWZ5NnPeJEpWr4Q0pSdpQctWeYKUipIMx4Ya7uB0/P1wELqyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:33:53 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 09:33:53 +0000
Message-ID: <4e46fc2c-5154-467c-bbf8-08a4d055100b@intel.com>
Date: Mon, 12 Oct 2026 11:33:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,2/4] tests/sriov_pci_config: Add VF core config checks
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20261002113356.3652805-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20261002113356.3652805-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b4da5a-14e5-4363-d836-08df2843ee17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|260925022911599003|260925021311599003|260925021911599003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: d+NoC4LZJdghzlGRT1gv0sLbKxkyhqKpqYSYkA9oK4qdRJXgNKWuQb5GkfzNfSUoN157hYpBURJN5QUTQkZrVcO4/6TpAfVvgOtRvHHIEbAASOashXwzav9Nk4Wn1SHvl0rBj9k/y+zh4yqVvUJ8SbwBCTtJ1r0DD8EACS1S+C+Tpzl9QuMP2xwU2ICHZZB6mRycBoge2Ao9YIVviaaqObw0b1Mqd2Fna4VVdDrPn+fKivZbW9C2ZsUpsx4AphFAuxmQZTehRXI9+Uda93Rl5JU0vBwt3OcCGfY+ImPU1MX2gy9qjaEPuHSD2dHVeel03JderwJm84ea/4OSSsR4mG+mJoC7/1cwlb3/VkOFlXc1kqJM7AIfgy0XHRgPAFNcwm9ezzXNr2BZmLjRxsGDhWTPNpF2lfp3+ZXFj7ikPx9pG/55aYlDFPFwDivUmctSkDEXjzdJhrnZet1usTSsU4mj41I7kiO6w2/YqcHVGFe2kV0WVw6BTlW4WzHjucWsOfYcRPcBzB+02NujW/yrjbHsziRdGwE+GOLR89NKK+Rij4SvHJR9LhRjhAoFSNBDIsCwm7XC+eaRtqLKNDhIS7Alr29/qqIUwXm6v3AWN+dIfojCJ2/hWOLx8t00WM7N2Xmi/G/pOw1OGBK4rGBuv7u6anaeQvCfiRfygpGL9jc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk0wa0xTTWNWbmZXZTdoWnE3NWhFZHN4dDNSUGNTWkRyVmhsY0lqU2luR0li?=
 =?utf-8?B?dWNwR0IxejZmaUMvR1JlY1A3TnB0eHZJK2h3UU1SdElsR3EzTXNvWjRzQXJW?=
 =?utf-8?B?Q2thMnNuZTRDRnZiNEhQejRLeHBUYTQzNmRQWnhRZUp5cW5xcW1JOEZ4YmQz?=
 =?utf-8?B?YXdmb1hNTFpqTkh1SVp2RkswMjZ0Y2hJQTE1OWVBaHJaRkt3SEE0bDZMeGJu?=
 =?utf-8?B?R3NWVVljSWM4ZHdBbm8rTUVIaVhzek9XclBtR1JBT29CK0x1eEYreXVLdjdP?=
 =?utf-8?B?WXQxaGkrem5oR0NncHZub2JzdHd6ME8zcERrMDdDNGxDTzRvNnRranZjV2xz?=
 =?utf-8?B?RVdLSjU4WTBkZ0RibjFZMnFPTjFWdFh2OEQvNkNBOUVBdDhMdGp5NkJUYW5m?=
 =?utf-8?B?RmJtbWdJRWhSandSQkxBVnhTbjl1YWJmVXAvbEtYeXFEanRkVlNzUGFNclFv?=
 =?utf-8?B?UG02cEEyRSs3WW16YXJHczRZaUtVM2Nmd25oODRVc01SRHcxUk16R2laUTRB?=
 =?utf-8?B?UnM1bUU4Q29mWEZwVFZuODFMa0VYRVBPeTQyeVFkRFRpSFdZcU4za002a0tx?=
 =?utf-8?B?Rm9YMStUS0ZHbGRIQVBXbStCYVJsOU93djNaTjhpQU5OZjQzK29IV0pqdTho?=
 =?utf-8?B?NUIrN1FoUXE3Tkl4Y0MzSGpxZ2lmQ2dKM0JhY1RZL0NZR05YUkZxZjdrSkg1?=
 =?utf-8?B?WmlnNWhNMVFzWUJHdDFVSTl2RW1XUGdseHNMSlNLTml0ZjJ0MUk2K2JVZFFh?=
 =?utf-8?B?bURFd2FTN1VvMGpKWVhoUHVBd05pV1NjczFLSWl4WEtJd1VRMEJGbjhqUytF?=
 =?utf-8?B?RUY2UERnQlNOMk1wcnZFdUlHZDlMd2JhK0kwbG82dWE0WGxUNzROYVN4NWYv?=
 =?utf-8?B?UUczdDU5R1prV3djWGQwVWpoTFFnV05UejBtOEp1bERVZkViL2pZZGJUSHJM?=
 =?utf-8?B?K2JkaVNBaWZtSnNXOWt1bkNFOUp5bkNUK3BEcWdhQmU4S1FvTTVBMk5sZmNQ?=
 =?utf-8?B?ZHJPekh1ekljZVNTZU5Cb2RCUXVaVHdQTWFmZTJQM3EzZU83V21INTh1ZWRi?=
 =?utf-8?B?eGN4WmR6bW1iNHpsTWd0Tld2T0NJaWRtNVdiWnFRUVI4Q2poTTRUT1g3OWcw?=
 =?utf-8?B?Y2xOVHc0bVRUN1dGRWRnd1lZY1FPS0s4dmhlSkY0dTFpK21PUXREbGVEcnlY?=
 =?utf-8?B?djhiUHRZRkNwNWVsbVR3YUJvWlpCSWY5SXpXOUtGeGN5TEhKL29YdFkrdTNm?=
 =?utf-8?B?MWt4T1prY3pXN1JwZDZ3eVk3TGVEcXloVS9HQUhQT1hCMFBvTkR2bUhYWkFw?=
 =?utf-8?B?eWloTEVXa1R3WXF4U1R2Tk1sYzQ3SUtoVUdtUlBxRzhZL0xZd2FhRDhjNHp2?=
 =?utf-8?B?bllXYVA5YXN5bTAzdldzTU5Kc2d1V3hiMXZwMEk5KzU5UlY0SFVyc1Z4UEFP?=
 =?utf-8?B?ditvR0JtRFUrbVY5OVNVNTQ4TXpYZW9GVmV5VUVSMjJ5L3B0bXdKaXN4aXVP?=
 =?utf-8?B?S256ZEJPZUJ3Z0dVNEdyS29nQVVCajFYYnhKUEhPN2ZsMGFJU2tuRkUrOXJn?=
 =?utf-8?B?WFJqcVhYWUh4ZnhYT2pnaVg4cU9jNWZwS1V5dWl5b0FLSS9UOHdYaGdQQTJt?=
 =?utf-8?B?bkFEUGlneXg3aG5YOGNyRVhKbFdkczhiZmZUSWdDenJoWkN6RzBpSGp6bjJV?=
 =?utf-8?B?bXQreWdlNWJuSlFKL0lBalV5YlFpSWttUU9Ba2dTUTNZZHlQSjVnVEEvYjlE?=
 =?utf-8?B?SDlLc0k4ajY1L3pqZ01vUGc2emxEY1hqbG5nZjl2L3c1UTNScUJjRTAzUEtx?=
 =?utf-8?B?SDFyUjYrdEtyZHlaOGw3dlVORW81ZGtvajdDZ0hYMDIzbUhBS1pwbkxGVVZZ?=
 =?utf-8?B?UEVHSkw0NnF3enVMZHVkekFndWFMc1Fhc25oNkxRZEEwSW9ld2tzUldwZDNi?=
 =?utf-8?B?ZWE2eXRRa3FPUllxa1NCQ1JIV3diMHVEMWNIb0xFVGpoK1JYVlBvZldmbVoy?=
 =?utf-8?B?TTNlTEk5SFFkbXJoWjA0d3JVaFNJM3lmbGVJUHpua25zbEZCRTYzZUJZL2hl?=
 =?utf-8?B?MzhJUGthRzkzZkp6a0hGZnZsRlJhc3NneWN6eFJ4RDFWamRyUk5iWlo5QVl2?=
 =?utf-8?B?UStNN2RwSVgzcFZYQktZQ0wvTDB6RENoa21LOTJMZlQ0eHVIYmVlQ1BnQ0hK?=
 =?utf-8?B?V0FVWTg0TTVPR2tQY1lmWnp4aE1hS1daOTJZYk8wa2JnSFR6WFhzek9UMW1m?=
 =?utf-8?B?TjBSaEdHOXlWaWpIc1hvc1AybFBnakhtaWFRWFREOENNN0hqNTRZS2ZQR0Z0?=
 =?utf-8?B?NlNEYW1aMmQxeitncCtsYUtNZHhqRW92ZnlveFNObHU3d0RzbXNHdz09?=
X-Exchange-RoutingPolicyChecked: Nl4aMlKeOwwD2IWTdkoYRycNV/WsJwvU9x0eShgPBDDC8mB7To6scmcOsi/ABTlKG+zddQInVJC0VgWKowwfv9KfnN5lV3CusH5CP9wcZ8zbYyCeB/2WbK8JzY8fHuzfGICKOqPe+DdbXWXN8dRKBSCZOwpP7Ieq8O9g3/aHvDu3/oOG8yOEqVLd+QO9PHRHBBEMwOwbEJ0iwbDoBGVQSDuV2PvHbt0rDgNzelFvOaIEVR98kGMLVKkwwSy8Zfx638/q8g03jHM2KfhHixp6Dp1VnghzeWiy9kxGHuLsXTCTDA04M4bUePp5hkS1z59L1RfIxKtQ/lmdZyVJnnKkdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b4da5a-14e5-4363-d836-08df2843ee17
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:33:53.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWuv5rdfx5el6JfV84pFvEZ4+u8HWsUfVj30+s6pldpS3x/+UTftcoH/bYgLBk9AvEd9VAasRif29OYC7xd71g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
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


On 10/2/2026 13:33, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add checks for PCI configuration fields required by SR-IOV VFs.
> Cover the common header, BARs, and PCI Express capability fields.
>
> v2:
> - Enable the VF and read its configuration once in the fixture.
> - Restore driver autoprobe state and disable the VF during cleanup.
> - Clarify test documentation and shorten runtime descriptions.
> - Remove redundant informational messages.
>
> v3:
> - Move test state from globals to igt_main().
> - Add missing blank lines in the test.
> - Reject a 64-bit memory BAR type in BAR5.
>
> v4:
> - Add the PCI register definitions used by the test to igt_pci_regs.h
>    instead of relying on linux/pci_regs.h.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GitHub Copilot:GPT-5.6 Luna

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   lib/igt_pci_regs.h       |  35 +++++++
>   tests/meson.build        |   1 +
>   tests/sriov_pci_config.c | 215 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 251 insertions(+)
>   create mode 100644 tests/sriov_pci_config.c
>
> diff --git a/lib/igt_pci_regs.h b/lib/igt_pci_regs.h
> index 5d6fece776..9ec548f8d8 100644
> --- a/lib/igt_pci_regs.h
> +++ b/lib/igt_pci_regs.h
> @@ -14,4 +14,39 @@
>   #define PCI_CFG_SPACE_SIZE	256
>   #define PCI_CFG_SPACE_EXP_SIZE	4096
>   
> +#define PCI_VENDOR_ID		0x00	/* 16 bits */
> +#define PCI_DEVICE_ID		0x02	/* 16 bits */
> +#define PCI_COMMAND		0x04	/* 16 bits */
> +#define  PCI_COMMAND_IO		0x1	/* Enable response in I/O space */
> +#define  PCI_COMMAND_MEMORY	0x2	/* Enable response in Memory space */
> +#define  PCI_COMMAND_INTX_DISABLE 0x400 /* INTx Emulation Disable */
> +#define PCI_STATUS		0x06	/* 16 bits */
> +#define  PCI_STATUS_IMM_READY	0x01	/* Immediate Readiness */
> +#define  PCI_STATUS_INTERRUPT	0x08	/* Interrupt status */
> +#define PCI_HEADER_TYPE		0x0e	/* 8 bits */
> +#define  PCI_HEADER_TYPE_MASK		0x7f
> +#define PCI_BIST		0x0f	/* 8 bits */
> +#define  PCI_BIST_CODE_MASK	0x0f	/* Return result */
> +#define PCI_BASE_ADDRESS_0	0x10	/* 32 bits */
> +#define  PCI_BASE_ADDRESS_SPACE		0x01	/* 0 = memory, 1 = I/O */
> +#define  PCI_BASE_ADDRESS_MEM_TYPE_MASK	0x06
> +#define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
> +
> +/* Capability IDs */
> +#define  PCI_CAP_ID_EXP		0x10	/* PCI Express */
> +
> +/* PCI Express capability */
> +#define PCI_EXP_FLAGS		2	/* Capabilities register */
> +#define  PCI_EXP_FLAGS_VERS	0x000f	/* Capability version */
> +#define PCI_EXP_DEVCAP		4	/* Device capabilities */
> +#define  PCI_EXP_DEVCAP_PHANTOM	0x00000018 /* Phantom functions */
> +#define  PCI_EXP_DEVCAP_FLR     0x10000000 /* Function Level Reset */
> +#define PCI_EXP_DEVSTA		10	/* Device Status */
> +#define  PCI_EXP_DEVSTA_AUXPD	0x0010	/* AUX Power Detected */
> +#define PCI_EXP_LNKSTA		18	/* Link Status */
> +#define  PCI_EXP_LNKSTA_CLS	0x000f	/* Current Link Speed */
> +#define  PCI_EXP_LNKSTA_NLW	0x03f0	/* Negotiated Link Width */
> +#define  PCI_EXP_LNKSTA_LABS	0x8000	/* Link Autonomous Bandwidth Status */
> +#define PCI_EXP_LNKSTA2		50	/* Link Status 2 */
> +
>   #endif /* __IGT_PCI_REGS_H__ */
> diff --git a/tests/meson.build b/tests/meson.build
> index 4f5c9be7b4..0e1a3faf32 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -74,6 +74,7 @@ test_progs = [
>   	'meta_test',
>   	'prime_vgem',
>   	'sriov_basic',
> +	'sriov_pci_config',
>   	'syncobj_basic',
>   	'syncobj_eventfd',
>   	'syncobj_wait',
> diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
> new file mode 100644
> index 0000000000..925235783d
> --- /dev/null
> +++ b/tests/sriov_pci_config.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_pci.h"
> +#include "igt_pci_regs.h"
> +#include "igt_sriov_device.h"
> +
> +#define VF_PCI_EXP_DEVSTA_EPRD		(1 << 6)
> +#define VF_PCI_EXP_LNKSTA2_DEEMPHASIS	(1 << 0)
> +
> +/**
> + * TEST: SR-IOV PCI configuration
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: PCI configuration
> + * Functionality: SR-IOV-related PCI configuration space
> + * Description: Validate PCI configuration fields required for SR-IOV,
> + * including Virtual Functions.
> + *
> + * SUBTEST: vf-common-header
> + * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
> + * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
> + * Readiness and Interrupt Status bits in Status, the Header Layout bits in
> + * Header Type, and the BIST Completion Code are all zero.
> + *
> + * SUBTEST: vf-bars
> + * Description: Validate that VF BAR address bits read as zero. The BAR type
> + * and attribute bits are static and may remain set; the upper dword of a
> + * 64-bit BAR must read as zero.
> + *
> + * SUBTEST: vf-pcie-capabilities
> + * Description: Validate that FLR is supported, and Phantom Functions Supported,
> + * Auxiliary Power Detected, Emergency Power Reduction Detected, Current Link
> + * Speed, Negotiated Link Width, and Link Autonomous Bandwidth Status are all
> + * zero.
> + *
> + * SUBTEST: vf-pcie-capabilities-2
> + * Description: Validate that the Current De-emphasis Level field in Link
> + * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
> + * and later.
> + */
> +
> +IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
> +		     "including Virtual Functions");
> +
> +static void read_vf_config(int pf_fd, uint8_t *config)
> +{
> +	char *vf_slot;
> +	int ret;
> +
> +	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
> +	igt_assert(vf_slot);
> +	ret = igt_pci_config_raw_read(vf_slot, config, PCI_CFG_SPACE_EXP_SIZE);
> +	free(vf_slot);
> +	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
> +}
> +
> +static void check_vf_common_header(const uint8_t *config)
> +{
> +	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
> +	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
> +	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
> +	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
> +
> +	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
> +	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
> +	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
> +				  PCI_COMMAND_INTX_DISABLE)),
> +		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
> +		     command);
> +	igt_assert_f(!(status & (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT)),
> +		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
> +		     status);
> +	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
> +		     "Header Type: expected Header Layout 0, got 0x%02x\n",
> +		     config[PCI_HEADER_TYPE]);
> +	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_CODE_MASK),
> +		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
> +}
> +
> +static void check_vf_bars(const uint8_t *config)
> +{
> +	for (int bar = 0; bar < 6; bar++) {
> +		uint32_t value =
> +			igt_pci_config_raw_read_u32(config,
> +						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
> +		bool is_io = value & PCI_BASE_ADDRESS_SPACE;
> +		uint32_t attr_mask = is_io ? PCI_BASE_ADDRESS_SPACE : 0xfu;
> +		bool is_mem64 = !is_io &&
> +				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> +				PCI_BASE_ADDRESS_MEM_TYPE_64;
> +
> +		/* Only the address bits are hardwired to zero; attributes are static. */
> +		igt_assert_f(!(value & ~attr_mask), "BAR%d: expected address 0x00000000, got 0x%08x\n",
> +			     bar, value);
> +
> +		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
> +		if (is_mem64) {
> +			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
> +						    (bar + 1) * sizeof(uint32_t);
> +			uint32_t upper =
> +				igt_pci_config_raw_read_u32(config, upper_offset);
> +
> +			igt_assert_f(bar < 5, "BAR%d: 64-bit memory type in the last BAR (0x%08x)\n",
> +				     bar, value);
> +			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
> +				     bar + 1, upper);
> +			bar++;
> +		}
> +	}
> +}
> +
> +static int get_pcie_cap(const uint8_t *config)
> +{
> +	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
> +
> +	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
> +
> +	return pcie_cap;
> +}
> +
> +static void check_vf_pcie_capabilities(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
> +	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
> +	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
> +
> +	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
> +		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
> +	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
> +		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
> +		     pcie_devcap);
> +	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
> +					  VF_PCI_EXP_DEVSTA_EPRD)),
> +		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
> +		     pcie_devsta);
> +	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
> +					 PCI_EXP_LNKSTA_LABS)),
> +		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
> +		     pcie_lnksta);
> +}
> +
> +static void check_vf_pcie_capabilities_2(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
> +	uint16_t lnksta2;
> +
> +	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
> +		igt_skip("PCI Express Capability Version 2 is not present\n");
> +
> +	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
> +	igt_assert_f(!(lnksta2 & VF_PCI_EXP_LNKSTA2_DEEMPHASIS),
> +		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
> +		     lnksta2);
> +}
> +
> +int igt_main()
> +{
> +	uint8_t vf_config[PCI_CFG_SPACE_EXP_SIZE];
> +	int pf_fd = -1;
> +	bool autoprobe = false;
> +
> +	igt_fixture() {
> +		pf_fd = drm_open_driver(DRIVER_ANY);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_vfs_supported(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
> +
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, 1);
> +		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +		read_vf_config(pf_fd, vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI common header");
> +	igt_subtest("vf-common-header") {
> +		check_vf_common_header(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF BARs");
> +	igt_subtest("vf-bars") {
> +		check_vf_bars(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI Express capability");
> +	igt_subtest("vf-pcie-capabilities") {
> +		check_vf_pcie_capabilities(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI Express Capability Version 2 fields");
> +	igt_subtest("vf-pcie-capabilities-2") {
> +		check_vf_pcie_capabilities_2(vf_config);
> +	}
> +
> +	igt_fixture() {
> +		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)\n");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
> +		close(pf_fd);
> +	}
> +}
