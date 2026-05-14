Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A4CCD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA3C10E366;
	Thu, 14 May 2026 06:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPCq2ksC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CAC10E366
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778739889; x=1810275889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ag+r1IMuuUlcdRBpy8swKy3of29rTnf9d+xLV8BzG0M=;
 b=RPCq2ksCa76zvA0c7TAGz8HT68Y+cxOmYoSnF1taQnLxLE4tFk7TIBG4
 4Jan2rt8bufOX2o2znZ5ePUTnmyT9m69eopACga6RCu2ll3ms7Lo0Cr12
 uMLuMkUQzV6BFLuhWIxpS0OhPnmxkT3jYNnHjEKXFJXZ/9FWecwhiwD00
 yNFIhFP06zjCbCBZRZg+vtjeUuXFGGrdjwvLeqD29tYjtFkMlcMpmdPYn
 dNd4R/adapkAyLNvXLip2ME8XhlbeeZf8+GYInKBP5dZaLMPaAplbbqvN
 dWm4x+woahyvlotEcPt+SzQx3OLiqCBH8KsSFqqpOh/krlzv4jMyfShbs g==;
X-CSE-ConnectionGUID: A/cRXc3JQmiqrk1E6K5DRw==
X-CSE-MsgGUID: llgS07vZRSeP62WtXk2yIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83290528"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83290528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:24:48 -0700
X-CSE-ConnectionGUID: zAk/sklWR/6JS4b2MVep5w==
X-CSE-MsgGUID: j+h5fud5TxC4cEZHQ4CHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="243268350"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:24:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:24:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 23:24:47 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNBudnN6KLrmp2V0G2pg9Iy+gdYP/b+HeWpYl6eU33A4bn/9BHlPGPyHXMbYtI67DAKbBIpQKFK3RBvyov4MTP92JZvq9tDNl2r5hLsszV5xf+nSc2VUJT3dJJqLoh+qYHVZORFle3bTAzX5iTyhVDoigcmJOirwk9ZbpZkQdDpwCDUKJ1E9cXxpxbMErz9MpurY0zsMvoLk+KdnvDjCZYs3M+Q4ylBIM6HxehkgtviczkW+S7pWOX3Zv79ZrXuw/BIXGt1E5+uqcDwD9BJ+gUt6uzcnm5VnBh/2ZEK+mjDIwAizbjCPdrlcO27uFeaNyjSw3PaaQ/EhO3O8BUR7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lX05VTMuSnx9pXwGKLxHFNyG+v4HeUNarFIb3qxc/5k=;
 b=djSxzuDXzjFX6tOCBw5XpmqZi8s1c3DrmyXgvvwN+/AOokWeqAc9sA54vLNAXrQPKtcevybfMPjdGbcZjozUq5274vgRdvFdhJJM6XdW0Ck3z12Y78SK9v/jEIV5Hr0DLeIjtwAFuA4yY3YHAkExxGo0c9WX7B1r+8MkT5GQd9RDe4259iME+uWYqaAIV22keTpd5vo9m/UV0nf7VOCumEAOV9EPfPyyjO12x9rad8K/p+2xqHv0MrvCQGeJMeV+PG0uJ87jOri4W6Z5BW6ifWwafMY3/imZtbJ55EJk7kILGJU4vL0/4LuiWIvnETO+mLLBr7BwgPeTwaF6X35Dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 14 May
 2026 06:24:37 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 06:24:35 +0000
Date: Thu, 14 May 2026 06:24:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
Message-ID: <car3nevjbneip32s4naz7lmh6sbtp3kc26eilvl2ikh6wmm6nc@qlae3k35lslf>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260511081117.2315474-1-karthik.b.s@intel.com>
 <h5mztj3fvrf3rjiikxq5uzk2xojmpwnbhwcgmzxznhwbpbejgi@hahdvd2v3g7u>
 <76a8a114-392f-414c-b9c8-437f1479f551@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <76a8a114-392f-414c-b9c8-437f1479f551@intel.com>
X-ClientProxiedBy: VIYP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: d37a7623-72c7-4f48-3274-08deb18177dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|11063799003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: +8tsxN7v8ImJG+w29s1OvAqZkma/IdrMcDxycNI1LPQ4KPpSjROpm+7rwGI+zmwc5S5KFjDEi9qYV6AiXEPwCW/n2u0LRA+pPu9Y1ZFFkgu2LeplOo7rq/Q2gcqSxWoutIIEBuyDmibPfzZttENjYjGf2V+g4FHH2nRNCXTNwkL/LvjClk7SfPL7bfn5hSzTNBTK0/0sSRSS8Lh8qhpvOzyziATyMJihAipalgoRXEk8WB1rW+wa0tVN/xOJieP217BO9iDOBwi77AlL5ox/bCqOs2WENYCR+WJ4y0YptJX/jAJcsvJhTYrP64BYGglLoFSfUZ6q5qMrMAuw+6YAKaEU8AXL9ydmKHNiQ0ikDHe3O5lkTZojRBNK/eCVzSeJyoDJBVXRxQ9+cqc6eilBbf6Yo40WfG8kF5ULeL4D0bYP1JLOqzDnO6ARk4/3/6hlsQh4EmMWOUdzlyTFIwiHMj1eGV+qB6Qd9j4kQvECb5U/r2I50WiTc/exGekiR5cYQFZa1jJswe9TaI+A1Dqej7U05QBz6qoRpjyr9HoTe+jbU1/HSoVhckGj2OEZRhK9SBAumIZI4GpjxFRfmTr4TneEFEwHffLPhPd/dgXPLrCM8CXiT0ful0U91/11+Krma2qwnlWGjpCyf9mKbEOgi6SPurClyYUHgZ8Yh+qDdOSDUGXHlmxLs/etTH8jONYm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(11063799003)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFzZWlkeTd3NGJWOHFEOCtiTUN1N2doVXRwOUoxMkY4Uys1d0JhWkFvNm1w?=
 =?utf-8?B?VjlsRTZrNFNIbDNnbCsra0ZYQ0phV1Z0d052KzNMRmJyTGhkbUhFZmgzWmdh?=
 =?utf-8?B?SmcxZ2Q4Y1hjK1hXMXZTa0x0WkEwMVlXK05yUWJadlZBVUpLOE5wNGFKUGtP?=
 =?utf-8?B?RUZwcGFpeUh0M1EyMkNXRHQ1VDFZSm1wZ2dMS1RPY1ZuU2I1V0ZSdWNZSmxj?=
 =?utf-8?B?Y0JUYi9aaVRwZndUeFRZdDM1ck04a2g5QndaMGJtbUlXc0VtZFhMKzJiVlFa?=
 =?utf-8?B?VHM4dW1jZjJzNHkvb0tlclMyUVc1RncyWngzSXBaMXNJSnp4R2pqb2ttZWsy?=
 =?utf-8?B?U2FKMEhRN25VVDNCTzdFaFpCeXVmQmtSTlBWa1ZNRXZyOWNqU25HYVVEbnJa?=
 =?utf-8?B?bUpoZCtHeEUzM1FpdTlHS1h1K09GWGxDb3RNUDdpUmdMQWVPbEVhMUhuQ2V6?=
 =?utf-8?B?S0o4bEhpdmxnOHUrRGUxSi9McUtwS0k4Z1dBd0V0SGtTc3IrT3BKRWdsak5r?=
 =?utf-8?B?NC9BWDZsWDdING9sZjZSV1hGOVVRaDJtVmw1VnkwdFpPTmRucGRPT2N4Tkg2?=
 =?utf-8?B?UkIxcWJ4TWlKWHoyekdBZWJXeGMxMktXWmpvTHdleHdVMFl6SFJkR044ZFc2?=
 =?utf-8?B?c2U4dDg3VVFVeFRMSTBzTk11eXVndlQ0YWJ5OFRlV2tEcllLZFFib2Vic0I1?=
 =?utf-8?B?MHJLRHN0eTFKQ2FqQTNMRW5veFMzQkJxdXFxclZzYlNaUlUvMVU3VFloeUs0?=
 =?utf-8?B?Z3RBRkc1OVpwK01qOEM3OXU4RU9PR0QvQVRhNlA3Zndhcko5M3VveTc2eTRq?=
 =?utf-8?B?TzFRZHNrODNreVNkeTlRcC9nbHVSNVpLUnJGWmJDNEFnOERpU2RSVS9JMGhU?=
 =?utf-8?B?T1I3YkVTbjRTRnF6OXZ4eUpTZFJ2TDNNZkxnZUxFSTRBOWRSYlUvSFVLRlBl?=
 =?utf-8?B?VjR4NzZKQitXM1czT283c1JUdUtkSkkzTlhxK0FZa004Y1ZOZE9xOXpPenlV?=
 =?utf-8?B?Ynp2RkYyRXpSNjY3Sk5aTFZiUUdBb1VuQ1E2T3ZHc2FqK3Rya2NoT0V1ZWoz?=
 =?utf-8?B?VmxNM0NBNGFpeFJWa2c4OWFjTDJITkowRTV0eW0rSFJhR3pkaFJ6a2k2cU5K?=
 =?utf-8?B?QjJRdHZNMmdkZTVPYi9aQk1EQk5GRkVCMXNiQkRiOGlLL2M0aHlEY3M2c2N6?=
 =?utf-8?B?aldMR1ArSEVNQ0F0TnpsRXhaZndSUU05WDZHVEFaUHp4NlVCVnpGV3FsMXBJ?=
 =?utf-8?B?eWtOOSs3RHRRNi93Nm5GRnhKYmczdnFzTEVBdHA5bHR3M0d3a3h3d0FuK2lh?=
 =?utf-8?B?M1djTTlGZzhEUDNBc2VBQVhHa3d3dW9XSkc5SWtMRkNVWFIzeThFRTMrM3FR?=
 =?utf-8?B?cEh2ODFORVdlMjUrOUFKSjY3RmdTbVZPT3d3eHhJWVE0VmdtUnZUN3JkZVMx?=
 =?utf-8?B?SUlyOXNDdmkzL2pNOCt2NUN5SlVyTHE0cEJPWkRtSmFnaFBwem9QVXNWM2dC?=
 =?utf-8?B?Sm5PSG4vOGRmd25LV0JjdFRzSDZWajFMVU5sUkFUbTU2QUhYNytlNkc1cERM?=
 =?utf-8?B?dmY4eUkrRjlQRWJqYUxHQTI2am91enIxbCtlWENZcGtJcjdNck5XdTgzQXhy?=
 =?utf-8?B?VEd2M0JqWG5TayszekNBU0ZENmk4Snliam02R3dVTFoxeVdHa2ZjUjIyblFO?=
 =?utf-8?B?dmdrd3NGYTVYdW9QQThpSVEwT2lIUkZTWmFVL2lCU0U4TGwySDluM0gya3Q0?=
 =?utf-8?B?bUZBK0JmaE5vVWtXT01uMk16dk9hVFdOSGUxVUNHNUVGTDhFWGdNdURkNGdC?=
 =?utf-8?B?QllVdnZibmdyVEQzME5PeHZXT1VBYTlHV3V6ck55RzNhaHZmQ1BvK0c4K1g4?=
 =?utf-8?B?VytMdVdvWThsWVNIWXdraFdBRHIvbktmWjduUzNVS0hCbFZnTDVjRitjV3hC?=
 =?utf-8?B?OEtJMElUc1lkdFZWNCtiOUFReTZ2OUFyVlgxdmhSdG52d21KSmNDYXlhcEJM?=
 =?utf-8?B?OU9iRi8rRU1PdHcyb3Eydk9EcXE4ckU3eHhOZ0U0QU9PdDd5WmdvYkw3U1RQ?=
 =?utf-8?B?RWk5dklTNW1tMEVOZ1Vyb0JHbFA4bm1FbHdML2VuU1VCdWJtMFlMY2YxeGxs?=
 =?utf-8?B?OGJ4aHBPZHI2dWtyTWc3bWp2ZFlZMG1TeUZCNHVtMmszV1BubHI5U3BDQlh6?=
 =?utf-8?B?N0hPMldxZmxSTVlKQnhVRkhSck9XYlFyZ2I3bFkvR29kUXNTdFFmaGMwaFNJ?=
 =?utf-8?B?YUlCUVlMWVdjWm5VS1l1U1B1Wlk4S0NaU1gvRmpxcHBuenFxVXpMVjg3Rkow?=
 =?utf-8?B?K0lRSGdnVklvcjJMQTd5eVF4NVB0VXh2OGdYUlN1TzlvWjZ6elplTm1Vc0pQ?=
 =?utf-8?Q?mFbkoJkaU2GMO/F8=3D?=
X-Exchange-RoutingPolicyChecked: HDPRbAzgIrDjvyKKkklNCC9G3YnrUyeNH5JIUiPlsYQwX7baq1N/ZAi+sn9JOg2fAbHiAtcbLk6VIEzj7KSv5jZaDNkpvlSCUDMd3qtrPB1iEtKJ/BztASY4AMFFVFyHdg3D3/wEsaVoU+BX31loYfqSayujd0iVPxrO6hYnzT2+PWBNFnfEtaZVP8JJ0aUd+HYnuAM2qmJeEQALI1s1IIoVhtrg4i0ekX0emRCUFWUUUyMSauLcN4qGclScVl1Tr1YF0BjHZJRcYLm02SM3K7QpHBoSRjTPU08+TC5PFyYanVs10vFVKZGJnAQy6sQrPePd/kVXN0uBydPnPu2/TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d37a7623-72c7-4f48-3274-08deb18177dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 06:24:35.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBXRxDoSXi4N2MDsUdidEugTOfn6ZAA48pHycQIF89MAkwyHOs0axs0ItTpKFZ9MkjPwH6AGBnFQhP/6JIjGqHGxvh2Xb16eA9OUTM7NBow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
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

On 2026-05-14 at 11:42:57 +0530, Karthik B S wrote:
> Hi Krzysztof,
> 
> On 5/14/2026 11:35 AM, Krzysztof Karas wrote:
> > Hi Karthik,
> > 
> > > The premature-update detection window between the NONBLOCK atomic
> > > commit and the CRC sample used a fixed 100ms sleep. On
> > > high-refresh-rate panels this 100ms wait covers many vblank
> > > intervals (~24 at 240 Hz vs ~6 at 60 Hz) and is long enough to let
> > > the display engine enter PSR/DC5. A subsequent CRC read then comes
> > > back as 0xffffffff (read from a powered-down well), causing the
> > > test to fail spuriously on these panels.
> > > 
> > > Replace the fixed sleep with 2-vblank wait:
> > > 
> > >   - It is the minimum wait that guarantees one full vblank boundary
> > >     has elapsed past the commit, so a same-vblank-latch bug in the
> > >     driver still has a deterministic window to manifest before the
> > >     CRC is sampled.
> > >   - It scales with the panel refresh rate, keeping the wait short
> > >     on high-refresh panels (~8 ms at 240 Hz, ~33 ms at 60 Hz).
> > > 
> > > Cc: S Sebinraj <s.sebinraj@intel.com>
> > > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > ---
> > How did you find this issue? Should there be a "Closes" tag
> > somewhere if that was reported by CI or community?
> 
> High refresh rate panel not present on CI execution so no bug on gitlab. But
> able to see it consistently on my local runs on multiple HRR panels.
Hmm, okay. I do not have anything against the code, so:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
