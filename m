Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1395C44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 11:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ADE10EFDF;
	Wed, 15 Jul 2026 11:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bsd8iRuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BF710E11F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784114062; x=1815650062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VHOGEGXbi3GGQ+hRDLqWgGKmVfPggI34knF+NBibPJc=;
 b=Bsd8iRuIfNI8zOD0hGc8UKfDsKgk4wJufVcRHxiILLZdFT423grcuhJi
 7gszRJGs3qeOV+eaIvqm2TAU2l3tNyhfsTkyUjdYo1ZtlbOP61mlnyGi1
 cGrUxasmbM8QoeFVpFHhdTa50oq2RV2WMAFgPlSZiIbpC/JlLvOZyXKWQ
 aS+GJO4JXb0skja4XoR5DZCeSQ/U1lj4QTC+NeHE+ipb6pOnRIVBq26Ew
 7p7/PrV3mldffs1pqBnwEd5xSporP+up11ZKTi3Ws3kBIhEVVCTeYXAED
 20oOh711iWTi3DDbBZtVYoWBbQeIiUEMCWyWBJkvgQj00TBa7vwnNHrGJ w==;
X-CSE-ConnectionGUID: GjU4IMCGQfaRupBbQ5CqIA==
X-CSE-MsgGUID: yKuvWtz8RyeemqJZ+W9ufw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95103521"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95103521"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:14:22 -0700
X-CSE-ConnectionGUID: xDt2DHqGQ16DEkWz3E9qSQ==
X-CSE-MsgGUID: 0ieQ2D/mSzCSpvVu44KpYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252759180"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:14:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 04:14:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 04:14:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 04:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JamZDveEeKRKLE3euK3iMCzPGbl5L1Mz++fbVqeVz1xRKqugApbPzYuF4gE7vuZwrCHDV+XrxZj6vy1Bf6MCNpYz7/OnZEW0qCh1hwqMNpGkZmichYnTXTq88JpqpzTvbRTYhoAAAk0JQhSbZs1lEPbNHbUS7pTJ/REGq/aytyjot6b3mUwYJzqAUETVxU7M3qCB4ypBRBL0TROc82w3qcHFkvmvTj/VdS9POtIKrF2/K4AXQ5NysFN2I27XD6Oqr/BUBMdk74WJMNnqx2A/B3qxzTWIF6iEA3jtO1vHuWQ5UGNK0teR5wURsa2XRznf2qkNsPFJtKCezhfmhWfIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckDgoWgOgQL153ODsPK/C9m0lOR7yd/lWs4joFaLv3Q=;
 b=mw1KgmFKCRZlp3KYDyPFnIBExOgQkAhnNC0ad/Lcz/t2nuJqWh0TiZvAPbHyuxrHJX6/CpgooewIt9gRfY+GP+A+STPysWkPROm2z5Sa9JTaUiGPmPaPMSISRWXp6jjGJcrwGXhYFifGcHBgrORZmUY23jBF02g8QjBElGDKrQ6zNvpXHjKr+5n+KiZRkhyjHcuV7IVzM+n1KoefY6wtI/hIrw3cWSc/S5KtvTrI3B59DjtYgI30t3jAInzk30JPSsPZvbslUCfOpsd8gIJVmbtNB4w1fJ40K20f5BaeLj9Ea/MZXlis9wcuTS6B5c4/PAAiBnaZdcF801dGBVtllg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by MN7PR11MB736799.namprd11.prod.outlook.com (2603:10b6:208:5ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.20; Wed, 15 Jul
 2026 11:14:18 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 11:14:18 +0000
Date: Wed, 15 Jul 2026 11:14:08 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, VijayaKumar Nallamothu
 <vijayakumar.nallamothu@intel.com>, Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
Message-ID: <6tavrd2bxmpfpvwpthxp367byh3hsdxecl2yixz4srcuo6y4ok@vfastyxfjizy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
 <6373280c-ac15-4bbb-88e1-e35dd820b610@intel.com>
 <dd4d6e2e-a816-46c8-b2fb-4eb4c9a1d8db@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <dd4d6e2e-a816-46c8-b2fb-4eb4c9a1d8db@intel.com>
X-ClientProxiedBy: DU2PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:10:234::7) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|MN7PR11MB736799:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb2f46b-d276-4a5a-0bd3-08dee2623673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|4143699003|11063799006|56012099006|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: mtP8LWoLtONJU7Cn0JSpPc+7GDL0VAccSjqtCCyZfgjihb1Qd7jBAPi0FMfh9AMvBzOSgVxJ91B5uyH/vGZ+P01C6XW8Fl9HqCBhtFFR5EWXiDxR/iFZfozGmsIw8W/L2z77Ndj8YuXVirwdP4zhIYGDWp3g749YpMZJDmjDd7KyT2IYgZoIyiPkLRaOZ4/I8OVr2ISP3Y0Sb9R4O9ASfLZwQADXJu/7gO5Gd76NGlpzHS80AWd1r08euTjNBqnx9h6xauzAPey66sT8rTbV1teMy0OSxQOFro8nrU/42DuqH6uJz9E73BJkCQbxlslVmkQrraLISR50EbhWWatGrDGuh7Vfv11wg3XnkbK1F1Qt3c/uY1QIf+SC8ta1ZpuZXb6A3I7hnITbvoVE65+il1I6xEWK07QVafZtVOMk1Q+8F67aFaWbk8qu2mUM2+d9GnvlITx+/OqCj0Yz3IzptLEUFhNud7nKjR/wEZRS1xv5HIXI0261DXvE8AlqFCGlpfLghT3ZJT+alw0lj63/IZU3z1aOXSPW0yDxaZAlV6njrHhuGVyrnHBrE1vSxChm6JqWLjFuWlWt+dh35PQ8QRqjTOG7ChG75J89aQD1y8sNDu9pMUsjrZNKBsKks2u7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(4143699003)(11063799006)(56012099006)(22082099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy8rQnVhaGNJWFpTWllWYjRmK2JaMys1NUZzYnhLMmxaVlB2c2RqUDM0eDJZ?=
 =?utf-8?B?R3hTdWVjWHhXajJ6MXFCeG5RRXo4Z1YvRU5KMzZUSzArMEt3MUMwdzZXWmFU?=
 =?utf-8?B?cUd6bE9admF0QVJZajYrbkN1Sm5wNGNyZEFvQlBxS0ZkWUZBaXZGQlRjR00w?=
 =?utf-8?B?SDFFNXo4QU4vSjYvRHFBOXh4aDNhYlJ0d2lVcDFCbnFxTEdiMzJ0U1lmUklp?=
 =?utf-8?B?dC9UWmdFMFZaN0plTjZLOFNYaHBiVVJTcWNGdStnd3NkdTNtM0I2ZlVaeU5Z?=
 =?utf-8?B?YlNReW43TVhWUG1JeENxQUo1dGFUYW5MRkdQMk9Ja1pEeTE4UjNxUmdZb2Ew?=
 =?utf-8?B?WitoRGtMRGdqS21sSFFRR0l0WGVuMllyVU1WV0J0bTVFMktLZkNIMTJvQkdt?=
 =?utf-8?B?Nm5SejBDVnJ3dkF6UTNOamM5TTk0T3pyNytkREdvUFhrdjB6ZzVTUElYNjdE?=
 =?utf-8?B?RUdtY3hjdkVDWmMyVDJDcnZIQllDQ2RQM2E5cFlDZXZ0My9pa055SjRVeW9j?=
 =?utf-8?B?U3FJMy9pTVNSMnhXOXkyNkd4RDBjdG9FMWxTR2ZhZ2FtV0o4ZWlyazNZbmVh?=
 =?utf-8?B?ZlI5QTBiQkNoQ2hwNEM1WVJLZ1N0dEdwMk0vUjdzNmNzZmtVMGpXY3M0MnJw?=
 =?utf-8?B?N2FFZUV5TllMN2FUT3FzY3pDemNkQU5mK3lscWtGMFRBTG5KcXFpa05rU0lt?=
 =?utf-8?B?L0tmOG1WaW9kMkJRZTQ3T2x1MThYSC9CamZIU3VvMmdya3A4OW9XbVpSWUVo?=
 =?utf-8?B?L1ozMmFPbWdreWFZaU5KczVRUnhZSElmVjJMaFZselJMQkJxRFdUUHNaY1BS?=
 =?utf-8?B?bUhZdWhWeGs3UkRFZWhCVGRucFRGU01zcS9Ic2NJT2pwQmlVaFErbVdpaWFH?=
 =?utf-8?B?R0IxdHpFaGFWR2hiRk5iRXphNHZtUkJBa3JQbUJ0eEJXeHk4WGl6Yk1LeXlv?=
 =?utf-8?B?NVR6L3FwcU0wT2pTRC9GK0lISXd2b3JHZndGTzRUQzhoenAzYmphQjhOSXd2?=
 =?utf-8?B?eGtySUNyc1loVkdENWxocnhKdGJVV28yaVVnMTlVT2lsVTZ2SGk3ZE5YaDRv?=
 =?utf-8?B?K1g0dTBuN1N1T2JuSEhJSUpENGNydVltdWFVeWJ6MjZqQUdsSC90WWIrRjRO?=
 =?utf-8?B?Nm9yVXJKUFh0NmZkRE9ka1pZbFcxTU5jQ1NBSmNza0NTWFE0TWFzZm5maTlw?=
 =?utf-8?B?QWdpYXZ4ZFNzV2lzTHN6UVFHUjkxcDRPZC9aaHpFT2JuMlpiazY2cEZlUzNZ?=
 =?utf-8?B?cXAweS9ic1FQOGo0c0tDd2Q1SDJGSndOZis5bUlpd1dGL2ZjamZaUnkxR0Yx?=
 =?utf-8?B?LytPTklFTHp4OXl4OTcwQzVjMWNwb0hLeUdoZkxKRWNObUhyZkJUSnltMXBU?=
 =?utf-8?B?VC9VUC9uWWtiS3YwMnN2MVlhelpodTgzTmlxK3J2SWlnMXFwM3hOd1FhdzNu?=
 =?utf-8?B?dWMyOWxxcWZJZUlRSjdxOWZBVmVsR3hCdEVnM0kzZkgzaEFJU2l0VnNjajEr?=
 =?utf-8?B?Y0tXbS9LVDBKTS9MSzNTRzNpTC9sZDJNZC9lNENTclV0c05LRFdYdjVaSlMw?=
 =?utf-8?B?ZWdtaTE0VS9ySlloMy9iSHkwc0RRTEhqN3IwNjdUc2JiSHZaeFBEampNa01V?=
 =?utf-8?B?Z2hlNmVhMkVpYWpZc3RqRHUveEJoQ2R4RzdwdnF0UUNjZzZkVGNDRmxwbjlS?=
 =?utf-8?B?SlhMa3lTT1VJeFNEUUZaNjl1SjZreWdmbmNkQ0p0M044cHlPSmNhYTNiRVk0?=
 =?utf-8?B?T0dnMU1EUkNwdWEyWUhkTGxBSnN5SzhJTE8wcE5pMHBpVmNjQUg2a0Fta2ZK?=
 =?utf-8?B?cHMvRHAzUXAwUEMxSGdlWVVYaUNBSVBxMlBxd2NST1FiMzJKUmxGNXRxem5L?=
 =?utf-8?B?N0ZmYit4ZytjQVMySjl1NFNpVWNMek1KcVY5VmNSMDBJRXFDalZqSlpzYWJK?=
 =?utf-8?B?aS9ZWTFqRUNxazd2OWZvc1NRT2I2OUt4bG41Nmd0SVIvVHFRWnU3eDM2Sytv?=
 =?utf-8?B?ZjVyenZaeGw3N1pXYmwwTnNjMnV1Wkp4WHVrd1NaMytyVFNkc0dmT3Y3TVls?=
 =?utf-8?B?TUVYVW5rbkd4cm9TVFFaYkU4MjA5UjFaS3NxZnRxZzZ0bmZzd21Uc0kyMFdj?=
 =?utf-8?B?Z244bjFwV09HOTdidjMvc3Vkb1g3eHErZ3RCa09QaEtZR1FDeW5CUm50MXQx?=
 =?utf-8?B?VUxDdjRkMHUreGk0aHlkbWE5SFFQSmVkR29BZ3QwVVNPTStTNEN4R013S1B1?=
 =?utf-8?B?QURaQzNvZWhhbHdVbFczRHpCVFY2NzNsdTI5YTh1M2JIWE9Rb2NNN3IycUh2?=
 =?utf-8?B?bngvZG9Dc3NUQ1JnajFxUGU2RzcrQnF1R0M0TFp2dXI0NloxTFMyNUprMXA0?=
 =?utf-8?Q?XQuHFDjyVRXqXShw=3D?=
X-Exchange-RoutingPolicyChecked: Rl9VO6IClAGuibFyQ1gusFIqlhlLHJQIMmdDjKolDwj9PrLYn4wCLLG7/X0Nkkf9P2dy30uzhflX7Ui2T3JomIkn427gsMOCdylTRD6VBOJ5XXbJrhmUunoDvD0tC1YSM2Y9GEiHd0s4pQtTG7cWJmbIOV1aU8IT7llJ2R5iitZdb03heuCL1Az1xy/zPfeqgOBkrKRcEkZkycwY7tejpOO6Xz98jVxbsRgHhPfdn20gOMog4YIjqOsDn9Eu8bs6Or+sJktrxn7gAP/GuHdQDi3KIq2ayJFQMcyCe7mx07OPYKeDWqE0DyOni+gYYa5CbvOLydetwqIUJ3N5AQWbBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb2f46b-d276-4a5a-0bd3-08dee2623673
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:14:18.2456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QQd1K6sLPwYN75zONkYgTfnQyNvy4kWYZin5TFYD9WFkMfL/x/rCectFUpLY9OX7N4aqSvQWfLtZP3x1XvubYWTd3bGuvievTIGdzmqhbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB736799
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

Hi,

[...]

> > > @@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
> > >   #
> > >   # The feature query_cs_cycles is not supported on VF
> > >   #
> > > -igt@xe_query@.*cs-cycles
> > > \ No newline at end of file
> > > +igt@xe_query@.*cs-cycles
> > > +#
> > > +# Tests related to EUdebug
> > > +#
> > > +igt@xe_eudebug.*
> > are you sure you need this?
> > it looks that we don't build this test anymore [1]
> > 
> > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ba8c03812b2593752b1d7ab31c104bec63ca21ec
> EUdebug support may be added to the kernel in the future along with the
> tests for it in the IGT, this patch will ensure that once it's added testing
> won't be triggered on VMs (or VFs).
Unfortunately, we do not know when EUdebug will be added in its
final form to the upstream, whether it will re-use names of the
tests or have new ones.
This patch is valuable, but it cannot be pushed as-is at this
point in time. Re-send it when EUdebug is available in upstream
and ready for testing with IGT.

-- 
Best Regards,
Krzysztof
