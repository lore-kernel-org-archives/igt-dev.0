Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2372CC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 17:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502010E94D;
	Wed, 23 Sep 2026 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DizfXKue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06310E94D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790186289; x=1821722289;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lo3Nap8LZjsC9/jX2jPIBbljgNIALoH4RSLUMLmSIB4=;
 b=DizfXKueCnaWMnXTBRSFcHYfdF4sUQCc/DJk6z6DgZSBd7ewaxW73HxJ
 ai3vsfFUXhceRjpx/O1IFGvtgqJPOZS6HilxPgi934ck+Vr/USqebZLSp
 n0arFKqEn30vM3+ZDOQSNpZvNUpm+55TBvTH+XGfRAH7NITksMeMPZWGd
 o4dV75v3QO9CdtLd82pIBsNVtzRJEhNwqu+Hn+QwTmnylHK8ObN2Ps/uR
 fbkwegdlyh7bU0gwkcCEUoI2KJwszXXvTYVTXYuOChxO3U1sApLkd0vP+
 /SidXWuYPkiUu7rIKoYHDn8LO50c+JmhnZWiVDWMZhgutKf7ytjCJx6km g==;
X-CSE-ConnectionGUID: ECNwLQQ/Rhudx1J6ws8hXw==
X-CSE-MsgGUID: ysuHTfyBQ6amrPFZtzZ4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90936230"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="90936230"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:58:08 -0700
X-CSE-ConnectionGUID: 4X1UYljNSI+pR80Qy/bAwQ==
X-CSE-MsgGUID: D7lMsgrlRO6eAT3anJIXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4838569"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:58:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:58:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 10:58:07 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdK9fxSJ9behLSAPUZatkTudocLw4WCRkWEGKFTdV97NnIzeq33Na77HvTqycInUe1BQSOJJ0UGbBCsSdOL/H8fo+g5CMiWrMCN9CoDUH+mcSFTaCvAmpi2X4HK5R/ISW+yLt9HdjucgvjfxJra0y3m7dcGkmje3BxPoJ5mK5Q9rSjFyJvIpdZqMHGsISxJjc8InkGl3EazXHCfg0OOAyMOrxwkUVuYWv7SZ1ZcrOBYYCOt4za1j6oonQOldCZG7choWPaCc/yq0QePDOTi36nkwt6bB2Lmychqm6mZFnvYEkLTVKslEyEnWwbhCfAz/mQW0qPkei4v72PbYk8VJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fp/8kJcKv+lSv6+zFB3w0fCDXc/4YLNEJ+c9/SoI3Ms=;
 b=NM3UqDslq9BBDT1gz4p7Rjhl9lwT1amls7Ii1reEBONODAoXSMMcxpKcHjjH2lQOOamWoPtdENBcJY3vLc0eQvk8WVAQcVWJRT+G04bzyUtOpwxdFAuaZfC0egW+6MM+O3kaHzVlkwiRF+6YAG9dKRtro+/uZUabwVugAWMPKEqx/nAB98fmG0dfFK/RlhsSbgC6877Ij2ILvSgBDh0oT1nPHZtlgBCeNkyOOymLp/EHzziLZDKCyrmbmNvfFDw/J4+QN4ri2NjYqScU202PLtT6w2e9hUpJERKt4hd9ZKtGPDXq4OuTYzbq0BljuCWXy/o8z9n1bOyvh2vuVKXBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Wed, 23 Sep
 2026 17:58:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 17:58:04 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Karthik B S
 <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
In-Reply-To: <20260820103535.6o7wkg7pfm2bow3t@kamilkon-DESK.igk.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
 <87ik57b7bn.fsf@intel.com> <87bjaxc3ez.fsf@intel.com>
 <20260819205513.GR8279@mdroper-desk1.amr.corp.intel.com>
 <875x15bxnb.fsf@intel.com>
 <20260820103535.6o7wkg7pfm2bow3t@kamilkon-DESK.igk.intel.com>
Date: Wed, 23 Sep 2026 14:57:59 -0300
Message-ID: <8733uzj1eg.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ed130b-adeb-4814-143d-08df199c370e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w22Eyu3Q72Ot6Vy0PgZPN7Vt0B6vXWm0/o1EXEyMM3ZwzXSbjfcLHtshdwF6tW0rkh+fl1g58pD5M8+yXJQm2sFEi2T/3EdqEXDuBaDMqSkrOD1aKrEE0222cJJMNUaP3ZUqRsAVx4JRS6SB1I+9y0SqB+CtYoKlBTgpxwiSZcocScyqL2ehcepov/KauRUaXXRZ906F9prno1L7fDleiJz4dQzvNKo3u3cm/5WQU4OjMPSYKeHG6uha2zEVYoSTUwF2qZD6CxrQhFpsuKhIGCd81Vq8YUeDPfGnjS91HAShIkdNftuhLM1B1SsKzWz184O+S/Aa4SXADiD01//1bWibNaX7pl6hH1svPrmBD1/jLgtPp7F8Mf8qJTZgjbddG3G3jZqczXO7/BRDZ3v9ZZjQknGhlJaODjDEoh0WAgF0mMJeuOut+npAZXJiNTJzPvI27/RPwhohyE9So5abE7wir5fhwk8TTRc18HnBMRUgn1R9paPC+w56gI9RCUpLIGAN617xvs5jJdyv2SQf78DfGD14KYskv4ySarNcmPfG9XoLtkKbZj6bPBXAQ4Yh7ShN919yK8R4ugwiJDBtQ0pIsFoYR6wWXEIeUSSuDJNE/TY4EiqR2E+Fyttz6C1gfUrtgTWSwlYKIu5C7u5d4ypmB2BvWCToez8GsKfG+jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBW+BddaldA+RaoQ8TDBzcSYqnkCjIhy6CZIhFFvF759BGinSyt4GPkgeNwZ?=
 =?us-ascii?Q?xyf/2MLOEsQHAAjCOA9fEPAM4HUlCrexsPbxf/+1Ocx5ZGyAQJ4enDr5XL2e?=
 =?us-ascii?Q?bmmdOsndVUiFutbKKUlvVPqyLSpTyrLcGI9rviQuX2tFiBDQYERke9s6baG7?=
 =?us-ascii?Q?YoOU9zPPQUAFzobW3pw141AyxnrBHmG6o1Cd7IGy7lHOCpfDibq9Mp+uzrG0?=
 =?us-ascii?Q?h50U0kP2c4MzTfZYFwkSIh2EhQGoUIWn80b79fc6JdUA8PBcK66FNgb+Ixz8?=
 =?us-ascii?Q?2ky0/2ebvRkWIiU7yNljyLWNBI1+rGJGm08yYBlKx6VfRbUBYPxIhmzsbduV?=
 =?us-ascii?Q?mz5/RjePl9LlOyt75aKOze4GLMSqy2P3WNVGGxuo5IyzRJjD4dResZxREFEb?=
 =?us-ascii?Q?8HoN6eviUldsYt7/AsmjUs9kJttyqM5eGIRGVkV3Qv+yryAL5fYFfpT/JW6C?=
 =?us-ascii?Q?YcLFpzrhK8wotoyYh2i/ig6X9Scet9xmRPqevUD8+6JQT1Gs8vJFKxy6WYPq?=
 =?us-ascii?Q?/lViEKcgeyOmS3ZPhvSRi/vyZw19l1SUQYMQdtXOabso6PGxEH918S/whBlQ?=
 =?us-ascii?Q?n2nDY4l1QqZQRuPTxV2s11cVyWaBBohyYgoGRWMryYtSSBxbvWWQG69/u+GK?=
 =?us-ascii?Q?Ns5EZID4ucrAQaqWTGv95BbKcPFc2v/WDYJes+l93p0fYowGqdZfLvtGEjTP?=
 =?us-ascii?Q?ffoGFIHKVjeIZ2V0tChfaenQtqH6QKvYZ1ZzA5K2FuNTmaql+xHAfbL/4lAN?=
 =?us-ascii?Q?u8nuQPYBb6/njdhLTlY27kX3BzRIJW4IBEYqTH/RDxbM6zlVIMdVYfEltANm?=
 =?us-ascii?Q?zmYKMM6iFS0XczcJA4RYWo6gojWfGHlVQ8EUELizrWigGOjX4Hj9kwUNCvGr?=
 =?us-ascii?Q?HukOIldTUDN6TS5ZRT8AYQTRpmDAyEsZlhMMkkgwf361HZDVGCksxzBY5OCE?=
 =?us-ascii?Q?q+hz+HG1Hd+IJPCuOOQCUTkcI5/rTyHWF9AKa+jY2bEePW6wO7IazHFHlrrA?=
 =?us-ascii?Q?1B3XaIBCKt3n4ROzsDmA16hP8Fb8f9aMnSO1mSSRNdgPEwuPxkeWS+/w2Xac?=
 =?us-ascii?Q?/tq2BsUwF2KF7rR0Ox8B2VXaiK9SRCv7bp8XHn/YE5GXl/weibAamqEXnw2j?=
 =?us-ascii?Q?Ei/xHJJnfi3Y1pOjbHNkhoCh2ymYw1n6JMBFvfZCqSF1VOoWQtwc4ODQrX43?=
 =?us-ascii?Q?RU02BeAurEQMNvaXqE6orEoiYvEhKWfll9m2s7d/IM1ZenUVY8/lCEnI9Z9/?=
 =?us-ascii?Q?3LFB5dKfrhyMKE+C2H+UJhovfjjI9mVDVoFhE4kPVZ287soNypV0Uzez2GMr?=
 =?us-ascii?Q?kKEa2xHu7O0sXjeHV8V0RjwNPqAWelKlk+xAs+QQ9OOHzsr/OMs5UnnZRu/G?=
 =?us-ascii?Q?ZD45KT+WEXjQnW1NvLp7w0TBUotWfKiVtQhiSKEDY6L99pbIQOXnFR1UCAW/?=
 =?us-ascii?Q?P0FP6UGjxezrDv7mausfjdSJQrzceHOmf83Bn3IiwNPbms+3xC2A+89eC3c4?=
 =?us-ascii?Q?TrKkZs5czMLd7uTiaioChxSZZDZWBpGXAkVHIpKXLNsYYAbVGGOtBgs9u/H/?=
 =?us-ascii?Q?3VJKwMXJ+1MSRB9049qfKDg6SnY9DF3nzPu1ZxqEPs8AecrDGm12sPVe5pDu?=
 =?us-ascii?Q?XjOaKsz+1evjbpZHqNJTvWbzveNlEcRSCC4HypUXO1t2GRmYbZTAC5zYZ2nU?=
 =?us-ascii?Q?j/XGC4RnTotNSG/NHZcTnr2qmEbqO/WkR4gu5Ct98e7+l6kILj4I7MQTcDoo?=
 =?us-ascii?Q?IhWXe6HSKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: p6xI5UpTpqXTREmA2ohuO8a4ckh48rQhK/E8NHH/6c8gcy582Auk85pEuWx+pV2yts6roUf//dm+PowqArRsQ5C3pPPr3wRnPRbK8HMHTXE4gqExCcBktOdQHHlZm5X3+afeak+2A+l7QtlDEI172v87o+Iwl5wD0FWyHcSKd4B90kkrPo0vQcTnYeXhMDAKSorjBtRf2iRnj4cxH2gczQNKfp+hBFTRqMhta220c1OmZrcmPPsIkolHQrQ4krHTRk2lTAn+tDbdzckbgzzXXldFZohX11iIWjW/E+KrKqUCH2JMOQmtBiHJ4bZoSw5Q++fFpzDlapbo+CHxOptMTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ed130b-adeb-4814-143d-08df199c370e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:58:04.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ8RgB+VKVpevHe/VKjbIR/VcDThTtI67BLRm/GZw0aSfKt6RV0BcIi8ew/cztQ/5uPgBzBKwuNj+rQ8xNX2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Hi Gustavo,
> On 2026-08-19 at 18:36:40 -0300, Gustavo Sousa wrote:
>> Matt Roper <matthew.d.roper@intel.com> writes:
>> 
>> > On Wed, Aug 19, 2026 at 04:32:04PM -0300, Gustavo Sousa wrote:
>> >> Gustavo Sousa <gustavo.sousa@intel.com> writes:
>> >> 
>> >> > Matt Roper <matthew.d.roper@intel.com> writes:
>> >> >
>> >> >> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
>> >> >>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
>> >> >>> name is present in the debugfs dump.  Using strstr() would match the
>> >> >>> workaround name anywhere in the dump buffer and with that we risk
>> >> >>> producing unexpected results if the checked workaround name happens to
>> >> >>> be a substring of another workaround present in the dump.
>> >> >>> 
>> >> >>> Fix that by making sure we match the workaround name with the full
>> >> >>> line from the dump.
>> >> >>
>> >> >> There are other parts of IGT that use regular expressions from either
>> >> >> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
>> >> >> it be possible to use one of those here instead of opencoding a match
>> >> >> function?
>> >> >
>> >> > Yeah.  That could make this function more readable and easier to extend.
>> >> > I'll take a look at those options.
>> >> 
>> >> This new version of debugfs_file_has_wa() misses the fact that some
>> >> lines will contain multiple workarounds separated by comma.  So I
>> >> decided to implement a more robust version.  I have two versions, one
>> >> that is still not using regular expressions and another that uses POSIX
>> >> regcomp/regexec functions.  I have a slight preference for the former,
>> >> but if you prefer, we can go with the latter.  IMO, both versions are
>> >> more readable than the one currently proposed in this patch.
>> >> 
>> >> I would like your opinion before sending v2 of this series. :-)
>> >
>> > It might be best to ping the IGT maintainers and see what they think.
>> > Today IGT has a mix of open-coded string matching and two different
>> > styles of regular expressions.  It seems like the kind of thing they may
>> > want to set a standard direction for with new code.  I don't have much
>> > of a personal opinion.
>> 
>> Kamil, do you have a direction here? Feel free to add other maintainers
>> as well.
>
> imho it is better to use regex lib, even if numer of lines are
> the same or little bigger.
>
> +cc Ashutosh and Karthik
>

Thanks! I ended up replacing this patch with another one that does a
full parsing of the debugfs dump layout instead of simply matching full
lines.  That new patch is using regcomp()/regexec().

--
Gustavo Sousa

>
>
> Regards,
> Kamil
>
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >
>> > Matt
>> >
>> >> 
>> >> Note: I also created a separate commit adding a simple test for this
>> >> function in lib/tests.
>> >> 
>> >> Version without regular expressions:
>> >> 
>> >>     | static bool is_eol(char c)
>> >>     | {
>> >>     |         return !c || c == '\n';
>> >>     | }
>> >>     | 
>> >>     | static bool is_wa_sep(char c)
>> >>     | {
>> >>     |         return isspace(c) || c == ',';
>> >>     | }
>> >>     | 
>> >>     | static bool debugfs_dump_has_wa(char *dump, const char *wa)
>> >>     | {
>> >>     |         size_t wa_len = strlen(wa);
>> >>     | 
>> >>     |         while (*dump) {
>> >>     |                 /*
>> >>     |                  * Each workaround name is indented by one tab
>> >>     |                  * character; unindented lines are used as "section
>> >>     |                  * names" identifying the type of workarounds that
>> >>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>> >>     |                  * etc).
>> >>     |                  */
>> >>     |                 if (*dump != '\t')
>> >>     |                         goto next_line;
>> >>     | 
>> >>     |                 while (!is_eol(*dump)) {
>> >>     |                         char *other_wa;
>> >>     | 
>> >>     |                         while (!is_eol(*dump) && is_wa_sep(*dump))
>> >>     |                                 dump++;
>> >>     | 
>> >>     |                         other_wa = dump;
>> >>     | 
>> >>     |                         while (!is_eol(*dump) && !is_wa_sep(*dump))
>> >>     |                                 dump++;
>> >>     | 
>> >>     |                         if (wa_len == dump - other_wa &&
>> >>     |                             !strncmp(wa, other_wa, wa_len))
>> >>     |                                 return true;
>> >>     |                 }
>> >>     | 
>> >>     |         next_line:
>> >>     |                 while (!is_eol(*dump))
>> >>     |                         dump++;
>> >>     | 
>> >>     |                 if (*dump)
>> >>     |                         dump++;
>> >>     |         }
>> >>     | 
>> >>     |         return false;
>> >>     | }
>> >> 
>> >> Version with POSIX regcomp/regexec:
>> >> 
>> >>     | static int debugfs_dump_has_wa(char *dump, const char *wa)
>> >>     | {
>> >>     |         size_t wa_len;
>> >>     |         regex_t regex;
>> >>     |         regmatch_t match[2];
>> >>     |         int ret;
>> >>     | 
>> >>     |         if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
>> >>     |                 igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
>> >>     |                              wa);
>> >>     | 
>> >>     |                 return -1;
>> >>     |         }
>> >>     | 
>> >>     |         wa_len = strlen(wa);
>> >>     |         ret = 0;
>> >>     | 
>> >>     |         while (*dump) {
>> >>     |                 /*
>> >>     |                  * Each workaround name is indented by one tab
>> >>     |                  * character; unindented lines are used as "section
>> >>     |                  * names" identifying the type of workarounds that
>> >>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>> >>     |                  * etc).
>> >>     |                  */
>> >>     |                 if (*dump != '\t')
>> >>     |                         goto next_line;
>> >>     | 
>> >>     |                 while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
>> >>     |                         char *other_wa = dump + match[1].rm_so;
>> >>     |                         size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
>> >>     | 
>> >>     |                         dump += match[0].rm_eo;
>> >>     | 
>> >>     |                         if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
>> >>     |                                 ret = 1;
>> >>     | 
>> >>     |                                 goto done;
>> >>     |                         }
>> >>     |                 }
>> >>     | 
>> >>     |         next_line:
>> >>     |                 while (*dump && *dump != '\n')
>> >>     |                         dump++;
>> >>     | 
>> >>     |                 if (*dump)
>> >>     |                         dump++;
>> >>     |         }
>> >>     | 
>> >>     | done:
>> >>     |         regfree(&regex);
>> >>     | 
>> >>     |         return ret;
>> >>     | }
>> >> 
>> >> --
>> >> Gustavo Sousa
>> >> 
>> >> >
>> >> > --
>> >> > Gustavo Sousa
>> >> >
>> >> >>
>> >> >>
>> >> >> Matt
>> >> >>
>> >> >>> 
>> >> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> >>> ---
>> >> >>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>> >> >>>  1 file changed, 38 insertions(+), 1 deletion(-)
>> >> >>> 
>> >> >>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> >> >>> index ff5daf529831..d44431e7e61f 100644
>> >> >>> --- a/lib/xe/xe_wa.c
>> >> >>> +++ b/lib/xe/xe_wa.c
>> >> >>> @@ -13,6 +13,43 @@
>> >> >>>  #include "xe/xe_wa.h"
>> >> >>>  #include "xe/xe_query.h"
>> >> >>>  
>> >> >>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
>> >> >>> +{
>> >> >>> +	char *a = dump;
>> >> >>> +
>> >> >>> +	while (*a) {
>> >> >>> +		const char *b = wa;
>> >> >>> +
>> >> >>> +		/*
>> >> >>> +		 * Each workaround name is indented by one tab
>> >> >>> +		 * character; unindented lines are used as "section
>> >> >>> +		 * names" identifying the type of workarounds that
>> >> >>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
>> >> >>> +		 * etc).
>> >> >>> +		 */
>> >> >>> +		if (*a++ != '\t')
>> >> >>> +			goto next_line;
>> >> >>> +
>> >> >>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
>> >> >>> +			a++;
>> >> >>> +			b++;
>> >> >>> +		}
>> >> >>> +
>> >> >>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
>> >> >>> +			return true;
>> >> >>> +
>> >> >>> +	next_line:
>> >> >>> +		/* No match for this line, advance to the next one. */
>> >> >>> +		while (*a != '\n' && *a != '\0')
>> >> >>> +			a++;
>> >> >>> +
>> >> >>> +		if (*a == '\n')
>> >> >>> +			a++;
>> >> >>> +	}
>> >> >>> +
>> >> >>> +	return false;
>> >> >>> +}
>> >> >>> +
>> >> >>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> >> >>>  			       const char *debugfs_name, const char *wa)
>> >> >>>  {
>> >> >>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> >> >>>  
>> >> >>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>> >> >>>  	if (debugfs_dump) {
>> >> >>> -		char *has_wa = strstr(debugfs_dump, wa);
>> >> >>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
>> >> >>>  
>> >> >>>  		free(debugfs_dump);
>> >> >>>  
>> >> >>> 
>> >> >>> -- 
>> >> >>> 2.55.0
>> >> >>> 
>> >> >>
>> >> >> -- 
>> >> >> Matt Roper
>> >> >> Graphics Software Engineer
>> >> >> Linux GPU Platform Enablement
>> >> >> Intel Corporation
>> >
>> > -- 
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
