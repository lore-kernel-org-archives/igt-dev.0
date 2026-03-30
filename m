Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6D1FF4956
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88410E1C4;
	Mon, 30 Mar 2026 07:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTqzooJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DF410E1C4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774855503; x=1806391503;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u2kyyTqWTlo9VjHZa2aJc834kme6Dqg3ncYaeEQcbU0=;
 b=aTqzooJiLDmAEZtcE5G1Nqm+i1YiZ8cqrJJ6I+iDU4XWnroSzAWqy89k
 pzo4u4gOoe2/YdxsFY2Jmtrbs9PhLletD4zdg1UJCmXdLsSoC0qbWW4EA
 8RND8d0o1zK1bOmUAkAzdROzRFO3IonLt140Lx6RpqHS9WRs5PydyWlB5
 lECAWDXVsekHVQSBKSvsHIvcZe3LF3McZSq4V8aO7PbKMwNeYFqcx6DPB
 w1UQBWr3z9Z9fM4V/Mf0RXGVQOb/GsX2NGwTjjOm1hHobcyIbdvdl4pDy
 9Wj84E+QGrOgJQhRQJMJYoHCe0yte1YpBDvT6Qa7RpWqtF0KoewOaVQLm w==;
X-CSE-ConnectionGUID: ZZ2euwzBSOycSngEIr1qHw==
X-CSE-MsgGUID: OChrBuy3QwqU72Mp9dGdHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75551220"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75551220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:25:02 -0700
X-CSE-ConnectionGUID: JCbnWfvxToyI0UHWdhaN9g==
X-CSE-MsgGUID: 98uTpIgkTKeKQKKgTCvINQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="221102601"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:24:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:24:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 00:24:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgvXQZZb/Vsq3KrIkCQM+8HCFv5ION42qTnzMsgK4J4EXcZ9sWTNpdDNRjjkAYliqdRIq2cFivw+J+TvPLdVS0v9zzzGzVwflAKFbhoUqyQnc/eKdLlNC255iYdttzO5dc/VsIY3aPRMMs1Df5CqtyTEwl3jNkjtUe3FTciV4WMkSxy9AW+RA35KElgoxT803669GKeFNblpQg/wu8WVJr2Meg7mQob1/j2CebXZnXxa49hMMl72DKjLnZh8ieie3k7whtnSTvFVG8B1CCIRiId+Bcar5dZWt6JAoDajBUMj/21h2A4axlCn20W07SOdmHR8F1VcZZNO3ssdKQ03GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPi6Yq17dLJfYxV++7WLkGaLFajcLdUWQLrngFmj6Ms=;
 b=ZfYUD2FiFlviI0lCnBZdiQ2wSXdteAUZxTGLb3qH/+GW2OIiCRjUgryObSzhzudMjngcwgIF8pW8VVfPVfLAx78FiW2o9wyPfYYR5RONJDEGjeNTEQrKv++pAcYCloGnInzx/ImiU2X28zHdFm3gdwE8Nlm638JkXeiXGCkKjSSHT5j0AuXeJ/WXUDsDMpmRYEZD6xute0V6MVHMKtdQEnxkU9ODTZfHJcidZvyCVEsWhSfaALLOg7Rs8kXdduzxf12rWKbnjc7ydu89ZMUhBbKcG9pxfRR0RX8kiyajNt8a2ElK71kxRtisvPPPqlYcKTMvm7ph+SygucIOJuMOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 07:24:57 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 07:24:56 +0000
Date: Mon, 30 Mar 2026 07:24:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] scripts/hooks: Example guc log copy script
 to attachments dir
Message-ID: <szzdnszlwbhnw2bl3zidgpbohxzjheu5nusp4m5pqgcfq6ibrb@b35ixkkjgzwh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324131235.712916-12-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: DUZPR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CYXPR11MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 68212031-ea41-431d-cf79-08de8e2d71cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qu6KDUZpJ2rtczmeGrcLjYe3vG1hiRQTOWfUM3Q3mjLu5MmgHpUwaWeBp41un8jtTJZ+Alld1nioPeq+4kQvfFbVFNR8HPCyqx9wS2td4OfTBdxWqJBq77EpevRQ/rbkmTcsfgdnC97lI/o3kK+TEhgb8wAdKmXYFPYTH3wMqWYviPA24oviZV0Nwy+ayqUY8CwpYksnUCEg9fp8M9wSN/f258xt8kJilHo4f0vt2LyIblBS7NP7jNsqZPDhmf9/nqvLMnhISLjQPu7ykqz+MHaEEyvQuwQV3QLW8OJCSI3hUaO8+PI2lLjgiunz7W4LBHthhujcJ1ngfmpavp833K0aPnBVd+RqKBDfjDDWRNu3xHuBfovcj81+Li2Fe7Ta5QGhcRZduGx4vU17UkGQExcbsnnDoUJ7RATSMJee3wDW03W7waNASAA659JI+dsXvNK2d4pS9EC/IjLv1kDerppjwImk+Yv0Tx09e002PkAFaLXB1XoGf0KR0esu2iN/MjL5MKdnQdNLGDCkfd08Wu85PITSLyWQiaydepFH8vE2WrYbfPkIbLYW0SOafxBfJG1zTyLnEfLEznYjlCkRBc+FbVqe7O6h4wBvKC83VNcuq5Jp4ay1g7Bbak31rIyo4iWnvUF+b3nFo+5Lq9yzCGfqtgp1waC1i175X7i/zjKGR9ZvI6KU+8t0TAxxw5RLxq+OMk6WWscPX3WdPtIL5sV35jMPwD4qKy0NxO0FnPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFQ2MnBjMERsVXp0Q3RucGZLTzR4cVBsdCtES2FqWWhabEtPejF1Z2VjUXc4?=
 =?utf-8?B?c3lsa1NFNnlSTndkZHhmQ0k2TnBKSlkyMldKS2pnd2tEbC9EQ3dDZHdKNE4y?=
 =?utf-8?B?dm9JZGdzSkRqM0hEcTRFcllWQUUydzJGWmFBME5MVWE2N3gyZEVaZXlyYmNS?=
 =?utf-8?B?RjZubUtHNkxnZlJsVGlJQUNrai91SzJicHVjbWN0Q2FZTmI4L25KbVhNQkJM?=
 =?utf-8?B?L1E1NXhCekorMzY0aHFHYnhUNDdZOThMVWEraUgzdkFhMWI1V2Y5cnpkRTFY?=
 =?utf-8?B?b2F5MUdzdE1oVDF2Qm8ydnZ1MXZ4cjk4RGhIVndjSWZDOGp6dStTMExLeCtN?=
 =?utf-8?B?ZzlFSjJuV2d3YnhLTWNqQWlMYTFsMGxXNkFzRE9wMkxiN1pXUjNxQkVTeDB1?=
 =?utf-8?B?enN1dk5OZzZFRlJoTmxmUXprbGJKY1VDa2FFd2RKY1UvMUduQllkTFBZRjJ1?=
 =?utf-8?B?VG1scUVzTzRFSXBCKzBiTGlSbVZHMlRWOVkydW9tMktzTE5BcUJjbnRidFB4?=
 =?utf-8?B?L1VnL3ZNMHkzdmtZTXczd2M3cU9hTDVGN2xMZjVpdFZKcFRKR045KzZYN09u?=
 =?utf-8?B?Rzl1dHFZbzhMZ21jQ1R5RlBBWTVTeCt1V1VWdjdzNEUwRTFXeml0MW54Skc2?=
 =?utf-8?B?OUduMjBEL0MwVzl2YVk3MkV4elc1eEhLdlVCcEMwRTN0NmlUM0JyMzNmaGFB?=
 =?utf-8?B?Tm5aOWxNSUo4OU1wc0Vmcm1sVVBrbW42SnBVQmo0ZXZsUEZJVnBwYi83cEFD?=
 =?utf-8?B?ZmRPVzJKZWVMeVE2TWNSMFhkU3dNV0lRZWlKV1J5Vnp6QU9TNTlBSWl1a2xL?=
 =?utf-8?B?d1oydEExeGdYaGl4NzZxN1lwamhHaEdES0NxNHRadTFlVk9MSVJETWZsaDlU?=
 =?utf-8?B?TEN6eTEwYUtqQkhFWFJBMXp1aGZoUXhUN0RUWCtub0wzZnprUDhJTUVUMjhU?=
 =?utf-8?B?OGg2bFZHZmV5UWtIZE9UWUNYY1FNSG41RnVESUlWV1p1Z0hBVHlYc2g3clg2?=
 =?utf-8?B?UlgvaFNWbGFYUC9NYjRpVUluSUg3WURaWVF6dnRoSmpIMGRQdXQ2OHErZXpx?=
 =?utf-8?B?K0dKQWdRNkY1ZVpUWlBqV0w1eVdsdlhNeTR0ZHd6Z3Q3MTVrSWlPdTZ6MXZz?=
 =?utf-8?B?bUZFSmRDWVRCQXBRdmZzdzJMVkU5QXNpcDZSTEhPZDNmN1Y4UTNvcEFocDlw?=
 =?utf-8?B?L3VybE9IZi93M1o2UWU5cmtPdHkzU05JRThCby9zM2xQT3laSkZaQVhSSXls?=
 =?utf-8?B?SDRlVDRxQ2FIZlVqbkhpSGJVcTRLZGtIb1BvMnM2a0lRY3NFdUd1bVUxWFFp?=
 =?utf-8?B?aE00eVBXOEloQjI0SzlvWEtNUmx5dHVOMGJ4eDd1aE9sNFpFeU1DbXdUR1pC?=
 =?utf-8?B?c3lhQ0NoNmtHTmhPMVZqVVJzaHNMQW1HUjdDYjF5NGhZUE16dHRUeW9RUmRC?=
 =?utf-8?B?QXJvVjluVlROOUJrMzRRT2FLbmN3WDdxczdPcWVHMmh1SEptMEZ6TGNVNXdu?=
 =?utf-8?B?WXlraVVpd2d6SnZYeXBmQ0NDZGoyV0dURDVpMURKSnpTQ2tZUiswWFdNMEl3?=
 =?utf-8?B?SElybHNFUk4xd0t3ZUFpZnBwU2s4RitQV2dWYlVRaXNmUElLWjc1a3BtUEY1?=
 =?utf-8?B?OXNoUVJyWkMzNzNndmI5cWR5V21iVkpGMHpGMDN2TlB0bkdLZXhibm1TQS9I?=
 =?utf-8?B?R3BaVFJ2Q0Fmd3hwTFNqV1RDQkNPUXBsZVBxTDNRZEgrVFhsZHY4NjRqQVdj?=
 =?utf-8?B?MGRDYlVoWm1vcWJRSDZtbjFvd3I1R01VenJOTk5ONmQzSm1pYUtoS3VuYUhE?=
 =?utf-8?B?enlLQVphSnI4d0ZvOW9kbjhPQTZPbUdpNTlpYW1pVkdLbWhRQkFYaW0rVmpq?=
 =?utf-8?B?bXdnem5ZdHJmK0RNMzFuMXI1ZzBaWWxIeGNYS3Mxa2JhSTUyd3d3TDBSQjl6?=
 =?utf-8?B?aHJkVmpqTjZWNXR0Ly94UytjdjhSa0g3VTA5RVdGdkNPWHQvNS95akFvVnhx?=
 =?utf-8?B?ekFNbmc4UXpWNG1FTnM2V3hLdFlDUGhZTjBuS3FqYjFMYmtFb2w0UkUvb0xI?=
 =?utf-8?B?RXYvTUQzVXVLMFA1b0VNVStpUXVoeFNzRnNPYnJsL0JrOHZXVHY1dkNiNW9D?=
 =?utf-8?B?OEJ5N0tqWDBKbU82Wk9RbWs4QVN2bXdRTHlqU3FQYjJmM3pqSm5wZjg3Snh2?=
 =?utf-8?B?VWh4NmJIVVpnc0FyMVMvc1lBSktzTFpJT2VnbjluSmtLYU9FaTF1R0V3M0Zn?=
 =?utf-8?B?UCtxb25Jd3lMamErK0xIYmFaTEdqa2FaVkJZTXpWU1M2UFJYanA5a2QrNXVk?=
 =?utf-8?B?bVU0eVVTUFhpSytnSnphR0QyaHduMEZDMmhRKy9OTDVEcEFpbk12T2NIWnkr?=
 =?utf-8?Q?dnGLu12BOlYCKMbo=3D?=
X-Exchange-RoutingPolicyChecked: Hu/mgVEpdb/SzRpoWs2rz3PjzyiFTWr236aAWjM8+obkKD1vdrVM1E21c5A57UAOtlPPHpMsVhmguaV5gFQLEEKTXTjJ5/7UOTiX6TS9pw6kSsYDtdBNU6FQ1BFbufE6oKcze7GnSrWQKn3Z5wI5UyQCO7HVUphu8mvFT9j6tjHsz9/NBq2AdJEd3Ee7MhjKAASy/O3fnZO/4ughLA9Q23uk08uuvf021RYmvb6gAXseY/dzwL/bl0iOlZ4dUTfYx1EwHUDxtnX4c/znzkbz0F4BE8DSIc9nDhqkap6G9QaziEuEM/Hp9Klfop6UrzhGLMP4ppDnPjzwlhPiSx18Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68212031-ea41-431d-cf79-08de8e2d71cd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:24:56.8704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ1ehgBqfAm8oc2cj0OlEKW/eK8Ewpkpmbh2MKyJIYjm5chhfLpbORVYcEB4srbjcB1Ix9yXVMxRobZ5BdGXG303J+q9BgsGwjzCXsj0uZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
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

Hi Zbigniew,

> We need to explicitly extract guc logs for failed tests so add
> hook script which does it after subtest/dynsubtest execution.
> As copying to attachments take a lot of time do it only for
> failing subtests.
> 
> Adding this hook script to CI will extend its execution time much
> (all failing subtests will copy their guc logs to attachments dir)
> so introducing some form of allow-listing will be necessary. For example
> exiting immediately on tests where we know guc log might be not useful
> is simplest solution.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: install hook to datadir/hooks

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
