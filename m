Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD89606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1SF50ax
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7D10E002;
	Mon, 26 Oct 2026 19:54:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE3810E002;
 Mon, 26 Oct 2026 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793044413; x=1824580413;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5UMtsCAmleeJewc4GZhG7wWmLvy8kYrrbxOTZhYNCgs=;
 b=h1SF50axteZ/3Fhb5NHdzv/DqPdEdRoicSAvXu0lOqdL/mg5SLAlww0n
 yvaXrbWnNIwMwusH3Pl0Md/87OLK5SPv9X7a9/djt5NmtfE3xuVy8VTkz
 PFk9bIzWOI25S/lZVm2Yr2P0Hm7kxH2c1guZky2fhds6l0zmXNfnChI45
 q+8+uiL8vdTf+eaOmpuu1bGGtsRVyD89hIzQ109SOsyWVWVD930grhwrF
 e8lt3B6ULAEwBU92/hr5yN9eNO8jAvq3XHvlw5jqgNS47hcDGhiZ6j1Hf
 zFcO4ioddqH9gFYzI7C65S+cNOdRkEAqHWOYlzd35c0DtAKDS8Aoed+Uy Q==;
X-CSE-ConnectionGUID: CJbYg4H1QbSyI/MaMN4kgQ==
X-CSE-MsgGUID: MlHnAUGBT7qLYmzYCI29tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1615409"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1615409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:53:32 -0700
X-CSE-ConnectionGUID: FQG76qsaRRyGYbNKYcLs7w==
X-CSE-MsgGUID: oF1Zh3IIRUa25MMfvfMCRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4710625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:53:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:53:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 12:53:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpsSG3gWk8of4YLkxp+Q1KDx4jKo+MPn061e6YOyQe1RtAgYpKgKJxqx7r4WDNms+rq7v3idtUErYA0c6wUqbm9Utl/VQqXwourDRq0OUZxdBozf82PPkF6iDvD7MooElGEIF+Hy9rPBIv1evgq3YUxB02pTYOA3uxLX9Sp8+zQ7C4IDMcTckqi6jGIzNYHSddkQGJ2fqf2xm5o4fYixw1TKGT4KEE3iBq+t2T0YH8EbbEe8seNDSj8FCZ1SjDv+Dah6M+nZp+VDm5qOUMpc/jqYOsCwk/iJOhz8ujfcu7Y6FbHpPdHpUNS65bpWHBuTIBY7VEBFFZGwTnN2V+umGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGaBnaaf7ipuOXM/i2CUEVG6rM2TQgcHWpKY+rXtBCM=;
 b=IRmdFRQHhKrS6Ym5EONu4BjAJRtxYxJrkN7bkyvoVnetxtzIs5EEgP7t4w8HgDNa0pkbgRYhDfg12dj/BwCZSOcyJy7+KsA0VhAJLa+4d/J7Yes3PwbD/myp/8Q9CZb1dYlN9q1h+4mtJxHia9R8eODcLu4Qjv3v/857NeqC/6Tp/eNqrreOumOi+BQLcgDLC7yko0P4zdzfZXKnkYcrpBqhooNZzwzOKVUGoqd6v3cGmf7d4zI5sD9g513GsQGFyySop7MUHLjnYin2NON/kBdRny/EbkwdahqyQIcpX5LKgc5siChUMrDi2O8/mE6cbZ3xW0Ze0mAq77seWeceuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 19:53:22 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 19:53:21 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for Implement
 Wa_14026539277 (rev3)
In-Reply-To: <179282973357.64852.593193787333200667@221881a7231d>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
 <179282973357.64852.593193787333200667@221881a7231d>
Date: Mon, 26 Oct 2026 16:53:17 -0300
Message-ID: <87tsm89r2q.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2121dea5-6b77-4790-f361-08df339ac9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|261026121527099003|10067099003|261026135527099003|56012099006|5023799004|4143699003|11063799006|261009223027099003|261022105027099003|261021133027099003|261022115727099003|261021123027099003|261021135927099003|261022075727099003|261021130227099003|261022113327099003|261021121427099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003|261026130827099003;
X-Microsoft-Antispam-Message-Info: frOi+k/45979mYsDzQ6r2W7nxItKg0UyTxXc27lo64IpcfvFn62wGIVMGnBml8tO57s9R5LmqgYnBAd2qGZlaXQMMXs+erjOA/pK/3jhjS2TjiAbcsI4sBrBuJ7nQmhvtbRmVZp0cLu8L8e1pmkEo9ajdGuPAXlxklKfp9sx9ahir0vzI6T+GAjoCKtxFSkrecJizTmSCdOKx9p9udAGWURhQnNnWz1y2cd+VUnBrbjmVANc7nbndrGUUzaCRXU1y10dpDxL+oiQ+evnIlWbY6I9J9tC4vz/2IjyW5JOlb/8emvp4i0EgRW4Ytf38QsxPuPwXLliEFXHr98IQZRgInxjsw+P86R/9SKamGfWG+wh9GKELZtFQAKiIYoVosL8zAOcFv0hE+EGzpZ1vAXtAkK9N7zKwdJ1+uSsLCrQN2JqY73TTvA1YzeF9+eoFPjkENZhqF0tQYaVft+DtXbJZPYCTEtX+aK3uvkt0F/SyGgj2xDeZ4D1QAXJddRL8greIfEdxkeJFl/cxXn0dkEC30HduqEJB6iNkptNzTTGaWekD8klbtQ2NLMFLGNplZAF0QNafYcflX783MTxSM/BHEjtrYjCmMXLIA10DVVqZ2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(261026121527099003)(10067099003)(261026135527099003)(56012099006)(5023799004)(4143699003)(11063799006)(261009223027099003)(261022105027099003)(261021133027099003)(261022115727099003)(261021123027099003)(261021135927099003)(261022075727099003)(261021130227099003)(261022113327099003)(261021121427099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYb8SkZfkUe+4SIqJOGQJDMijDxDlEAKBRFA7PJWXp3TN3ITq3zdyypuPi7y?=
 =?us-ascii?Q?et/e3RYtZjvAbg/5ffeynroppk6smLBhcGvADyy20Gd9UO+2Ttzg3VT5cEEA?=
 =?us-ascii?Q?ufjUqYnlbSJnR99Mah3e/QB+JF7DGq9fE2c9yZTPNzK1HLWnHIquMq/L0ehm?=
 =?us-ascii?Q?L84ruEm8ukjPNJOaElSij+RZRM9lx+svLmUqkOBRnLl1bHivt/ZFwo6c6GdT?=
 =?us-ascii?Q?+mNySMxZxHsIiTjnuMWucjKFHBD0cWA9CduSC/saQKCf4XWFJqRee9pdOhFm?=
 =?us-ascii?Q?iRcevDUSQm8UJsRxQ8PKZ26Hw0sm672LVLpQKNvo5Dqh2CpX08GbuvLH1iC9?=
 =?us-ascii?Q?26YTO3qPLeoETBsT5Q6rB6dGxXzStPIqYFvQj8FYHkD/p+gFWnscL+nFIQte?=
 =?us-ascii?Q?EpNTTulA/XL0rIgF9fKSTaFrAkkZ8O/hYaSjT8oeaViglAb6rN9vacfo5pXW?=
 =?us-ascii?Q?9cx/yo4d0X+gwuMyuIRxFZpQrj93mO5Ri2v1cxABYvKCRTRFpD623L8/AWl2?=
 =?us-ascii?Q?ho0vGYvAR5S2yPErJku+jz100k625wacRAedUDxPRDJzPUWx6ua0YoYOJ/tL?=
 =?us-ascii?Q?y9A/n0khkUR5XkOZ+v/SDuozozOx9qj1N0eKk0dqDA+YMyoyp9nmGPjJPr+G?=
 =?us-ascii?Q?tuLL0Wtt7CNnHavdyF16QCJcin2BgocDEblqe2V8hfDMSQPyO1+PHCyM8CUI?=
 =?us-ascii?Q?rAYL0PamTwlYFNWiCiNxeF5TfyDWk6Cyp9vdW4TPTXj9HfQ9XoCFvgox4e/N?=
 =?us-ascii?Q?ACHRvrsJD5PHa5+MkGqlDVbiUpUvNgVo70puvc2WuKhRk7e96Q9qlZexhvld?=
 =?us-ascii?Q?/tbUTip6JMJJ3GIYyFgFkanVmaJ+YK8t6Ios41mbEHLU58JVyCqcfKOH1U15?=
 =?us-ascii?Q?ZjHg2DXRXi7GKax6hERYzXryEyzmp7QpgvlYiIIY0doTwfJaqm2ydtv3S4/b?=
 =?us-ascii?Q?aTt64fiu46/49YkLKs5M8VIrN37WnTnpBudcrRorVqUo66h+ReC34LARHiwa?=
 =?us-ascii?Q?fVE5Lk2R8pVEwIPMNI+Ftz6aY9RHPEXlLGXeUJfPMCLQ57EI2PTgmDzfd4my?=
 =?us-ascii?Q?OgxFpE8ueby+QYgn/LnWScIWgtf4bSkkxC6XPRcj4PjrB6nkDYjnQsJgrz3n?=
 =?us-ascii?Q?UFApYZnOQtVoAManmu65jwzPk9mfPD+zH1MLqUk4b2KovkkL7YtvLbSpKcP3?=
 =?us-ascii?Q?16/70OXJY1XhXXKTIqYnHx+Lc0kJL80V3T9f/LosvNJDMyuvJpiJbPYbNV1e?=
 =?us-ascii?Q?k4tKIb3HXP4MxWmlQLBJt9NzvkTqjsA6JYMsinQBQJj1yHKaddkgd5gN84fn?=
 =?us-ascii?Q?Y04rUgslPwFHYZOt1KpOByRUD2QRTq67aQb7piSU28YNYHXBvl6kWs62K+At?=
 =?us-ascii?Q?3hBn5EthaaEVdY4t826stzCxltr2ghLQENzQreAwYbhQiRGbhF6mS7RExd/4?=
 =?us-ascii?Q?cE8dPIKAExp9MfwWRK97IhUFttZMhjbrXuTwI3RE56Y7psLWNKO44gGWJwSx?=
 =?us-ascii?Q?Qkv1KmtzPyXLPBXvBJ1sgtIu7XMzAhonoG/n09eF3ykKhZZ6ii/PsGcPHeOv?=
 =?us-ascii?Q?PZY+2AmH5ttzs0DNkw32Rzdn8mvCC1WtToCw+iE5EIpyUccH7aJ6k4Arp6O4?=
 =?us-ascii?Q?dPSzRu2mQEGfrFRJ4ePMAwDLswI/O9jgCNXDzea4p76jwvR03dUBCjw1JCN+?=
 =?us-ascii?Q?fGKPIYUsgAbqZyDqDdF04OumHac5V8XPX1+ikyZMqakIRK6F9UjhD+TcQ1GK?=
 =?us-ascii?Q?C3aJYicjvQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: se5UKqAJA1v4n/Dn6nr3RnBBnA2IMRgw85sIBJ06GXJb8wiEDab9GBiN6nhf67nQNSf6rc7DeNHExn11Pt1tYMFW2+eVYhA/FSUnpa5GNRkwDAOWgs433DNuiJNSHyxAWvFHxSaCZPUIX418CSY+ecJNiwSM+nCx3e/T6FSFDtx393Jf8hSWenn+LQFCtTyH0XWtnN2PEh3TUNBgyXgRVRMmF3kmYBBWj4DvcS21jeEHt+qEpxCgZZlrMUjnv0yi2Qx2D7Q3AhqbEzkAfhbzZDOUpCCx0P0qkM79ybOJFRtqIM/fb8s5aAQbJvQs5Eq6lONSBy1ZFN6Rc/ei9H7YRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2121dea5-6b77-4790-f361-08df339ac9fc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 19:53:21.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68TOJGuXZIO1ZAhluLQCB/c/rIS0Oa/4sewoYFoqkWAD8/bnFi+O0jXwIFWFiwnWBz1dJhRJJgJDXBhtL05vEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: Implement Wa_14026539277 (rev3)
> URL   : https://patchwork.freedesktop.org/series/170844/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_9162_FULL -> XEIGTPW_16044_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with XEIGTPW_16044_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16044_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (3 -> 3)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in XEIGTPW_16044_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16044/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
>     - shard-ptl:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16044/shard-ptl-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

This is unrelated to this series, which doesn't handle any chamelium stuff.

--
Gustavo Sousa
