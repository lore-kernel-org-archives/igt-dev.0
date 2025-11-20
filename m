Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F812CF8859
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 13:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57C510E0E0;
	Thu, 20 Nov 2025 13:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YW5iyFt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20410E0E0;
 Thu, 20 Nov 2025 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763645526; x=1795181526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z3yBpYL1HCyyBuKeuNYz6Mcc0w/EoYVwmiPqJcXKCy0=;
 b=YW5iyFt1LSCe/8ZmZF1OkzLY4AFEiwbpl5VrUwm382RF7FH426CAMr1v
 dyHZVCvXJBWAO7jKJzhIcaLKhUhcKF2QcqGEuCQcZOHvYAEYT5NZLe3F8
 Nfih7E9Y85YgI1vXXZsnBJ9w3UiRcEQgSYgNmeJEpDSSbrtDqc5I2rIBJ
 WCBdBsVuGBwdALNEpHsreU16Q/U/sbYvAjfXfsL3Om/p1pBBnFei8ELp0
 JEL0PAEWFgpXCX5RzqOeJ23y4lVy0xucNpLVMAJVOh43xgvB6sJ1AQojd
 JXXUtYyINdrQzhs6081593KXBdOJkRK2Ieel2RUyP8wPKecnL/IRlSFr7 g==;
X-CSE-ConnectionGUID: hAkX67R+ThuvYDfEAuroKA==
X-CSE-MsgGUID: Ukd6D4dtSOmEVFzcldW/zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76394041"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76394041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:32:06 -0800
X-CSE-ConnectionGUID: MfB8Zri2Tbu4r3Srhq082g==
X-CSE-MsgGUID: PAE/sjMWT1uFzDvtx+RzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="214732117"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:32:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:32:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 05:32:05 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:31:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAKDYSgtO2veHqW3g1T78ic4IzWoX9CWk5MokFy5vKonejxOs1GQdTb7pHbtXBDuqjVT9i62TuqQePxCiN5z9sPWSbdtePh3bVejrtepjMZQBO3o4kt0Vd28dggnCWuC3NTvetcu/DIiXsnsp2mPZj/41S4LuNEz8XHTDjJ1Goi9jQT9Acb5Ig2mlHm6yCnjFiiffyzUWXq6D8sFiXqL08/T4t3IrgZ280Dsd1I2Lg5i+mIocn0F2pSC3g5MusNlDdTW2XStuz5jmq0voHhhWptgdN8SKNOBW7YPg8c8OyKw0g4Is/v53EUXp02W80kfI4JztRgH1YFUU/g9Ou/acQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTGsIB7X9mjHE+x1p7vcm87WsxqK+Y30w6qcOnM8+UY=;
 b=T4b1W/Bsds2lbeIctvU6ESHAANPgX6G7zr+e4Aqb3tDopmH59pgDhBt24XAvPlH7whmaf1Qq3M7rYVPJEgBhcLCW9Z5fuTQ/qR+aOM4LWQtAcqL9JsjhS7MuRY/LuHQyUjzoknOgbXGRhV76m6GCiRu2RHwpDLm9YjGR9T7vwcBSXIn/VptEq5ccRsN6eDiGmevU5HejdeLnQTp+asjNHcxEnDwx0ZXcIKyYaQkQJgBK5dWNlDmYSB4vn/oD1CaeYClG/5DbPnuAlqZwWinA3Qb4IBuVLF5RVuqSxdcYVn/2i5g3lTirdE5n8PuKwhPd6yTVKtpUgH/ZUWB0bf3P5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Thu, 20 Nov 2025 13:31:49 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd%4]) with mapi id 15.20.9320.019; Thu, 20 Nov 2025
 13:31:49 +0000
Date: Thu, 20 Nov 2025 14:31:38 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?=
 =?utf-8?Q?lure_for_tests=2Fintel=2Fxe=5Feudebug=5Fonline?= =?utf-8?Q?=3A?=
 Introduce pagefault stress tests
Message-ID: <aR8YOhebjyDB/O1K@ART-DEV-395>
References: <20250526001304.2899977-1-jan.maslak@intel.com>
 <174822733954.19430.1302441528162758370@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174822733954.19430.1302441528162758370@1538d3639d33>
X-ClientProxiedBy: VI1PR0902CA0060.eurprd09.prod.outlook.com
 (2603:10a6:802:1::49) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|DS7PR11MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 3020bac0-9105-4adc-ee52-08de283928a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8ahoSsJ7uXQCKcqEIOgGqAnpsnz6c9t+4x0Lf0/B5uf/NUAt0U43dWkpTB/?=
 =?us-ascii?Q?hKpDLwFn3jYRSpiFbWlLMyKV4h6/j3S7zeMaQNA7JECWb2hI0m0/6FITLTeX?=
 =?us-ascii?Q?+tJ1fvAsXN15Vl5G1DXM51N6lzWDq786PIHyXOb9i/K+FXZVn2yuVhCaLaR8?=
 =?us-ascii?Q?vm6ypTYd81zkLyZMmx+okqpW955p82J+8qvoNGVogGLOS7GHw1tARBkicDSR?=
 =?us-ascii?Q?9IBe04QBZauDvRm5t1JtqZ5y5oGXiMKtRXe/+dEdNSoAiqJA3ORquOAQjR9i?=
 =?us-ascii?Q?FZ2hGpK+rkNqtgJMEpogQNGautCIxpVhNuxF40fZA8953Kla9sJSexcChK5P?=
 =?us-ascii?Q?uqMA6M684h3paxSbJwuqwr2pdj0+HP8j26NZxNHgXdHchqsm5lbY7hMcxjdr?=
 =?us-ascii?Q?wVjaBZ3ec5olpGFb1kPUj6tyZjHHEBB2pgKlNIrvD6YKQA/vwtCkZkE0wc15?=
 =?us-ascii?Q?GXiOWqFIhOTfD4kIrpJmm1DS5r30vNxGAeWCNmahdAunfUO02MO8ijcbhSII?=
 =?us-ascii?Q?4/VHuaHFJePK8Sf37Hx9OI+ykQuNyxdocySz2u9q8aen6qJtmB+8E0CHhYge?=
 =?us-ascii?Q?nTlwdcubLgQAzrLxQHc8Vj8QxXyjSKYSSb0v5tGNDbChj8MjAcCpP0lUne8U?=
 =?us-ascii?Q?6DLTBuYBRXTGMEnkclmf8qEmXOdAUjP9MZRxB1MpjyXxvEeJmSOzN30uMFMl?=
 =?us-ascii?Q?UTQYfDn+UtjleZ3TVrq/DHnsb5DDviFUi2uLhhTjbD2S2M6HgWZBzw3aW/vB?=
 =?us-ascii?Q?AdTM1W6YyjCt+VzX3TXc24i31WBevuUuJq5dDQLkP7h9eTwuRUwc7Wg174dK?=
 =?us-ascii?Q?U5bemmRPQIKBy2SVCuM8RsAurMLRBDpLVVC5WpQmP4S2jawPbvsJRk8ejB4z?=
 =?us-ascii?Q?Kw9Ho4PGS6UmAWsavXtBbPQv7KtELaQUYiQrPk9u35qQ9rRxYYGsQ3zam4Sz?=
 =?us-ascii?Q?IDm7EUG16DJcHAOr1581tiCFvfhgg/EgedcPFmxBDMtY+bdsOJfSDIGXPuXg?=
 =?us-ascii?Q?2IDS03O9mqY1azHABYIzTwBN+YvNHxlMVIw+JI9deHXVCgCXhNKAdj5Lwnwy?=
 =?us-ascii?Q?0K/2MZ4WZ2y1uQ8KfCwugxbs6WlRxX+nkrsB2PlZoFeyuCfad2OA6YzzjTQF?=
 =?us-ascii?Q?VGHgAc2reDLMXuP82RceW+gs+MdM4GZ0luj4+K5/c+R9I5VBvX1b2IVchHG2?=
 =?us-ascii?Q?wul0grnajz6QJvAmk738bP08Jdnq51nQjqRpOuJxInZAaBe4m6eJ7iGfzbeA?=
 =?us-ascii?Q?erQNAKrhEPGFBeZNDrOeqqaKPzFcDWozoTvbKeBQfGVvAQnB6uWo247bONEo?=
 =?us-ascii?Q?YlYTFUT2D5BA5qBGaEYOCSMh1tTPo5Mot9SYHw2MDnz/qemygJ0u0BqC/oqK?=
 =?us-ascii?Q?WS7mOhoH4T7TOLlMKgIk6t10d4IEV9+9D0s9jRz2kdpS+WO9hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ls+vVIUREq+dNGkUqxX3tCZ7wmN/S31q/1bbPq2z9T9qrzY/EoOOBbgP3kbU?=
 =?us-ascii?Q?xjc4HA/rZXEunpmguri3y3bwyDwvP/KvzWXJVmBumeXbYambAXaQlCUzvtA5?=
 =?us-ascii?Q?iDipO0io/2/jzvqHx6lJS0orBXa1mVrZPs0sOT3Kh30xsoWkCPZ1Ujsvvur5?=
 =?us-ascii?Q?bWwMP/TkiZsvj6eZGEkfFNYvhDjVgr3T22ksOi8rlYSqmkovpeuoWD4qP3CV?=
 =?us-ascii?Q?PrOMShOq61L3VJ7W3tgMC//vwfdwpIdOzD4LGXCLaeuovndI+Mxi9b7OeEHi?=
 =?us-ascii?Q?XSUqr5T31ZiqP44voHJeQxPAEGO0U1QtdF4l3IM55cRf2Ga2BvyrSXcKIF81?=
 =?us-ascii?Q?cfk2LMStuttk7h17EGjP0fO90WkUIG6gCbYIX9t5H8EWb/SNih8iUGTtd6aL?=
 =?us-ascii?Q?vA9D061GGoObeiDmt0QeaM4y8N+Kj+NJT33enxRTZqwImcX/Jz+m7FqNmAVw?=
 =?us-ascii?Q?p3y31UoJ+GiZSrg8aara1Dswb0czO2We0i123mJyJHHMeuGAwNjOKay+Gwtn?=
 =?us-ascii?Q?CMek8TKNHeAUS/AIuIY3iXKKsSyiC2uNRcQLTta+xmgmh0HqUc1pcuUc+JrB?=
 =?us-ascii?Q?mvIRQeKhT/15ExNIW7hcK7eI/Gw5irinMX4BDkNpuIyIhTsDcoi2rEDUmtC/?=
 =?us-ascii?Q?ZK8Q4TrH2UI9TBuCHeYlsMS0LMF2oXHqBznU0l+921bBu6O0r5RasPgg3SVH?=
 =?us-ascii?Q?qBxsFzsdH6Otbh3YkXzDtY1ToHc38uLGIsOYBsRfohp2FsBkm9/ayHStE+sg?=
 =?us-ascii?Q?lr6SqjjXLxG37BmhT1E6Mzy300AWDBOHhyt+N1D1jdYlzxPvD01Lif6MOV1k?=
 =?us-ascii?Q?FutS3HeMAYWGR8FRCQ2Wn5rweZ1fXAmrw+iJkQ7csqmrhT323PT3ac/uoYrn?=
 =?us-ascii?Q?xaSALKb2atbZCnUOZKYlo6TMCcoTQIVGomk94ML8cqySzqBhyn/tcHsDIiBR?=
 =?us-ascii?Q?VGyiqcBLOnTrbDr+M6zEwAizxQQy/0RWH6Ou4ieW/B8bLflh8dLwE0b0WPAw?=
 =?us-ascii?Q?OzwQfayXnoK/8U/uzUZTbLhgCzBoYQLTHYwRa/GgD0sVdDpDeaNDihkXG7wb?=
 =?us-ascii?Q?Rdgy2u5TAx18LXgB1NJskWhpHa7EIhjJiuLvnIIVlB6xrm9mqamrKtr0gJxo?=
 =?us-ascii?Q?0sqs5/Mp0XHfT7krvfgOHnp3mzbxhQSYVB9juo7A2r6PQff69vUJvmk24obI?=
 =?us-ascii?Q?WU4m7ruWFZz4+4ypBrUUJc1IAdB5jGzmSh14zW1XvwN8W43MgMEVC2SsCiry?=
 =?us-ascii?Q?Hi8sWU2pncpUPrFF1tD/yAYwYLtGNjY7MmVQ2v/GumDq9AR3GhB+RGFSKqEu?=
 =?us-ascii?Q?0m/1YC3kxfVJ/cUd/fpvqfWPH0pbknV6ZJGz4AseeX1mf/hzLqj8WsUxy6OS?=
 =?us-ascii?Q?+CbFyA1njHdrUOuSGfAagbomO8l0l37QedIQMI8ZF6gNP2rXxbF4s5pQ8N1S?=
 =?us-ascii?Q?KvBlHJTEqsPM9J6LWIhNOs1qHJmHjab98Ige+w+JWBdz6kyxs9/W0094G7Tx?=
 =?us-ascii?Q?2Kh7ygaR5N6U+GWVTyrqb0T2pXURMj9lFIDeQUXsj89qA48kevhFA9ph1d5U?=
 =?us-ascii?Q?PdSJLBcTqsL9YNdmvVt/uPycPJFdZJQryC1GPYSt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3020bac0-9105-4adc-ee52-08de283928a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:31:49.6716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHwr6aAdhUElLeV0ZYbxQwTVsl3Q4J3Zp+RzSmQlqQlQyXBXHOlAjhMHyuegqGKylaq6+ZuhWDY+Lt9HTuyelg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6271
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

On Mon, May 26, 2025 at 02:42:19AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_eudebug_online: Introduce pagefault stress tests
> URL   : https://patchwork.freedesktop.org/series/149473/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16594_full -> IGTPW_13178_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13178_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13178_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13178_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-3:
>     - shard-dg2:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/shard-dg2-11/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-3.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2 (NEW):
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
> 
>   * igt@kms_psr@psr2-primary-mmap-cpu:
>     - shard-mtlp:         [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16594/shard-mtlp-6/igt@kms_psr@psr2-primary-mmap-cpu.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/shard-mtlp-8/igt@kms_psr@psr2-primary-mmap-cpu.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-2:
>     - shard-rkl:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16594/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13178/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html

These regressions aren't related to my Xe IGT patches.
