Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC3C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 20:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D7D10E305;
	Mon, 20 May 2024 20:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klsE3hNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412BC10E305
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716236278; x=1747772278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NJSgUX6CEqW+qq76rFLm80ui9L/Kc2S/MhfdwdOavOI=;
 b=klsE3hNh1liofiQ9//81QjHMSpSKQrYXtQgbJIvB8Hs/oP8nZAjZcj6K
 3q/7nAFTWO6A1gh8gvQqIZf2EhleoC4SUWRfOrKEm+TrGL/n9cUEPh8Oo
 zyK8n5/8yy4Y2oGZWL+QZbJupfKQ+CXawQmjm3gsrfhjrNQf+M4q9eWdl
 cTMuN8camQLXzmL896ED5XIvV3DdT6R0hFuXu2wXNH/5SZEIGE/eWn32s
 d3tYXdSa+x/zkcyhfSpwY45GxKv8+DHTVOw5JExPS30d1AyT4tMrgNQ3B
 KS2V6RxVVupNNYGWMbAJtDFi2149zFfroEnnDEtfLuu56WuwpyJvYDy9j A==;
X-CSE-ConnectionGUID: TW+as8hzT2mg08cpjKz/1Q==
X-CSE-MsgGUID: hW6vT0eeSyaQoVYyy5yfIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16219405"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="16219405"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 13:17:57 -0700
X-CSE-ConnectionGUID: NPCZxgPrTrqXubJ0xG6opw==
X-CSE-MsgGUID: l6XkFG8LSQekS3tAO3hkig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="32817478"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 13:17:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 13:17:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 13:17:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 13:17:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 13:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAGy+fOLnti981pew1BLIvkgkvDXznJAtHyhAHsLcOrFHjwcrwnzts0+iV0Ln7R22Ck5zg57wN+Pi9Kg7/0i7L5EZ4Oruhp49Tz7uL1grxkLRZoFf9gvtpYL7m9oX3juRlE12RayBoD6AXGElWe6RelwIrbDVKDTjo88E9FDQZA0DikmTM37yDaJloJ6lxi1tx/EN2soAhyx/lIl6W8q5LtlJyTEUkHqznp1LxT6hDYY+raRnNhU4j/SyM9z+HjwIw9MAcMxQDSBbrbrZl7K0/ravTaueiHbgphyOHpqm+e788Sa+7DiGoHXLffXvTxl2c9dY0PQckO9UwKZmZNyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dICVz4/laEWEQqtqXQBtpQKtK1YkTpP+opKb/ShViPk=;
 b=QBJDp1pkEej2ufq77HWAiKOUSMkEQ3xfZ0NkjeBeRVIdvpRHfJDcZPegSVnEXDao/19TLVenVoaLqpprRk5b+cWBu22p2hUFBa/TgCsL58YsJLGK1gAy3pu5qcgDl2lAQpg1DQ92ojjP5YXrsG6qU9fXPJDu2Bd99YJLWPsAewvXPG8pGFjf56/zSxxKvxHxhWKEY0eQcuviyWxUyu4GkCfindd6Q90+b969Fi6OOhg72jzYIKPYWULVYYNQw4hjVK+ZDqKjdIkNrYM6uC5bWcL3k4EWDxcEMGuqdoXbLMTngnGRgqaxjAw9ioku/MSNj/gx3Z1ZoeaDG7ZYh2fyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 20:17:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 20:17:50 +0000
Date: Mon, 20 May 2024 16:17:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: s3 vs s2idle: Validate only the
 platform default
Message-ID: <Zkuv64TuIMrZ4b1E@intel.com>
References: <20240520190857.242928-1-rodrigo.vivi@intel.com>
 <nprozwlpjzyhw2k2ab6ynqq2denutk4mpbvcyms6s6ehkuksbj@hlenzwahvpzl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <nprozwlpjzyhw2k2ab6ynqq2denutk4mpbvcyms6s6ehkuksbj@hlenzwahvpzl>
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fe70b2-f6fc-4cf4-96fd-08dc7909ec45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QilSTfOKRhjq9vHPPpSS7Smc+Ze4/UwMCX3PJIh6tki7qJQgv3/KkIC+e5RQ?=
 =?us-ascii?Q?8XOl3jTswqLzrJbAPwffadPn4f1JcPeK/8nz3Zpbt4C8NfkZ8OMoUmyn+QAc?=
 =?us-ascii?Q?8hPItfhPIyEy0G0wjTo1GUZ3Y0jCQbn6UqruHrO9twuXNmYH6jWoxZl/Qo0b?=
 =?us-ascii?Q?SEsKGBp0++G3sUZCqSL8n5fIBimK2gc1jlMycNDv+Sue7prAhRmoWIzriqF+?=
 =?us-ascii?Q?4UpcX1qgeeINHCyJvVUTRlfNV/taL1waq+Mkdc6t0i/5p4Q+xF323QzU3CNk?=
 =?us-ascii?Q?hOpnFoCeVXe3PpjLF1QvtoflUjL5VelN/H5N/+PVWzWgiTSWNs3wpA7mUhh7?=
 =?us-ascii?Q?mI81PLNcx6R1cwpH3w80HGqeolojmcoy2rBv+J9gIYJhENgJN7t7gyFixgYL?=
 =?us-ascii?Q?BoSxnAfCe+Xhg7oIotcfwFna2TzJSx7UhnneAoXzYc2+Oup82MHfe/F8dsah?=
 =?us-ascii?Q?X0pzXG8WhuN8GQHHksqyZ+tVDQU7wL/PbRQ2mbb3aqsApr4T8eXkd5GPfk35?=
 =?us-ascii?Q?eW4OhFsOViiUEnl5/hWvT6FFZLwt6A3ELMYpjNrV9ad+20ijzKjgqcbP00Ln?=
 =?us-ascii?Q?YEg0kmOcOdfYrp138mHE4NPvboaZNxPBmdOaeIOVMeGutR9sEq8aKRw1wAjZ?=
 =?us-ascii?Q?n886PNG4sfn1tDrlckB//Hc3R6l1T2QGc/+eL/DW7KcmjPOVEsqHCG9I8Olk?=
 =?us-ascii?Q?kZD3GojWaDPianbNRrnZ1Qdp7F7vwGG9Cjwvlx93Ms8d1/K2DwRrZNUvbort?=
 =?us-ascii?Q?5ORzqqKYSouh5PmK+Uu79hA+J0KuLVVYB/Gk1v9vyB+XpQHMd5khnqzWpqH3?=
 =?us-ascii?Q?vVFqCHNMm5rz/p+Yey9mInnHlSG2fx9Cj7XUhR4rZd5PoXH7RjCUraNMJ5LN?=
 =?us-ascii?Q?cM3OXYfoUa/Fz4tC85tvOHkybVekU5rjE56rz5pOJTVyB9dySCK0THhD5gs9?=
 =?us-ascii?Q?PTnnAt2KeKqinmh+zxn1CXvlNtPrvas2Slm5tQz4mWcRcfcBLTSzohrwA8Pw?=
 =?us-ascii?Q?sfecMaBFfmKssQZtQFNlYvsNeqNVHodLGb4Otut5I9eqiJ67Vk7Q5VC8KtY1?=
 =?us-ascii?Q?9Zr783ZzRTYC9DSsqVINJnfwhvZpDaMJfTxYM18byfUssFWlsmraeI3CDBbV?=
 =?us-ascii?Q?cQgAmWOarNLeu6e596I0dCO/KdbrnFFdFklynq/rT+K9T8gpbKpqD9dHUyII?=
 =?us-ascii?Q?vEngray+6LDA1H5vqziGKg40AspAbV2SLdShpxSe3wWnD2R99LShG3CuDEYW?=
 =?us-ascii?Q?bVcLlb714IudpNqdS/rizsvVUY9i1EDWdXgLk/RSCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JRjaHQEIgxfeKJPUK1fvxKCScV4TvirQehhCWJhCbKdIOZ6YotLWHrql8EP4?=
 =?us-ascii?Q?jnH6zsD1ey3MgCYb9JiaLP6tR+XGdWzGAn32NDwfcBXM53Qb8TB9r5iumjY9?=
 =?us-ascii?Q?EtgA7/rz/apXZu2ofHHUZZPwhx7Wd6pbJbKKRu0m3fvwcATexdVc7HrJB+bl?=
 =?us-ascii?Q?fGnO/9UwAolsMHzJH8l6NOGbOfKRsroEWtOZJkE8yBYg9BYRcTIg30oPWnjC?=
 =?us-ascii?Q?Z7cpdDGRl2IffW+ym0NeSHp3Wp2g+wJR5DiDMIpuderDK/BD1sJNvXCrJUKL?=
 =?us-ascii?Q?+CNd7UAM2WW53FZWsYRb1wyiI9tmGIAletIVPJHEyUwuGaLYPO0Mb3MDrar2?=
 =?us-ascii?Q?vafRWj6Sq9sJx64KZ2VHdyzyEGlwTjwveXoGefUpvkoDuKKQRT0hl2WcmXrv?=
 =?us-ascii?Q?viUrZdlbS5y2xb+FZpVXxF0Sw3Vtd5jDERWw9zLMeUFxpqfmqeYfCRGRsV/e?=
 =?us-ascii?Q?opC650UubR6Pto98vk9WeefecWYO7bsltHJie0kvyK1eT0pUZnYykxtNeDk7?=
 =?us-ascii?Q?BHV/AlsH3/KV2JIJmZVuk+YXvrZEo0ViPRexZaiv6xHLW+ijAXgyaGazYsjn?=
 =?us-ascii?Q?PCCT/ioCI/xifh2VU3EXaqaLsmnnMp54f1bo7/xcTvVRDxTyGV7lXmHUXHsS?=
 =?us-ascii?Q?hCX6xesVkJ7XKZATVLHEgL1+/bLOuhTfWqsHy0DPTCm4BRfjs+T8mUUE3/DE?=
 =?us-ascii?Q?ltOUUE2YgmHz2xcuIyizlEkGOi4o0Cy+3bzsjuBZ0wFg4r7lTnm0TQ8NjOeE?=
 =?us-ascii?Q?T7LDi4Xp+/CMD1uXhKrLEL/uk6f5iRvwOi+4U6ZWNQ196PtLsQu2BlLKUNRp?=
 =?us-ascii?Q?4Y59upLohPBnrgg6Nxq+iHeIMENX9lhY8QvtyeHfH3Gt98nHl8kxt3eeY99G?=
 =?us-ascii?Q?mKs3R1Q+iXDoDzVHXD6SgRozJYqy3yTX/h13IDPJU6ceBGIPKXwtngHsIPiA?=
 =?us-ascii?Q?SC3/V/1pFWeKsY//xj63r/BnFapDRUVJ1DEn8rapfgAz2k3J60nmI/Cf2OJt?=
 =?us-ascii?Q?WKLCxruIUNOsRUCBXNdr9HVMxQ2UuLNhIHJDaqDNuBxYIVHpBUZJVmm4o+Z/?=
 =?us-ascii?Q?lXR2GJIAIgzEXeeZcbMWzIVgQZiKbx23NRS0ZZlKoCgtrCZzBK0qDf7HAhb2?=
 =?us-ascii?Q?mLjsNWZ3bUzgZuA+Eqn3x3UacCJTJQq2MxEDBACWxGCeQiLOPl6p871EJN2y?=
 =?us-ascii?Q?si3V0FeGh2x/S5Zqh6Q5ROz+C3Z3fT8lX0BehhiLsN+dGFfUBUBkOkqactjE?=
 =?us-ascii?Q?F2jJ6X/ldpdwep3Rz1WOeEnldEZWtNQKZVvxAgKKDdzTI5vF8IlQ/d4z+sHD?=
 =?us-ascii?Q?n9ipx/Eu+yyQ79dToyZL21irXGyVvSC2hLc/oKuz3ORLDL6duqdeYE4bLAan?=
 =?us-ascii?Q?Mlj1kwQQLB1Y4Jn1TZ4+sNIsTjLVYe+2W51ljD81EJecmMVzqX7lJ1wcvTjZ?=
 =?us-ascii?Q?Qn13Jq0o9bYcDTP47/YvMHjaFWOQL+48pR1bTFnk2UVgO406TzspUX2qW37Z?=
 =?us-ascii?Q?uyBLNxJpRObGXsG1SDSoEkNpdu3JvxnuZ4qIqY/08tWsTNEuI7MNQMStLLwq?=
 =?us-ascii?Q?s8QjLkAw3g+rvvnmuoQtGvovH7k10oBOPjnI3Or4QaP2rv0axb0YsFhv1nvq?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe70b2-f6fc-4cf4-96fd-08dc7909ec45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 20:17:50.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4jfpqPVDHUp8SQOX66WOdsD2AvFd6dc/FPjN30OAmFINF2zhnrWauu1RoxnyRo6aLzf5flf5NocznFiHZgSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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

On Mon, May 20, 2024 at 02:56:11PM -0500, Lucas De Marchi wrote:
> On Mon, May 20, 2024 at 03:08:57PM GMT, Rodrigo Vivi wrote:
> > It is very common to reach issues from other drivers when testing
> > the full non-default cycle.
> > 
> > Get back to i915 approach and validate only the default mem_sleep
> > level of the mem sleep state.
> > 
> > However, keep the option in place where the developer can force
> > the validation of the state using an extra test argument.
> 
> so this will read /sys/power/mem_sleep and execute only that level
> 
> why not "up to that level" so we still catch and differentiate issues
> about failing to freeze vs failing to suspend?
> 
> what current issue is this actually fixing?

well, this is not fixing anything. But I have encountered cases where
the non-default mem_state was failing badly due to issues in other
components, then graphics.

I guess it is because they are less validated and less used.

Recently I noticed the trend of getting only s2idle available for laptops,
but this is not something broad.

Than this patch came to mind when Francois told me he was facing some
strange issues non graphics related on some tests and that was exactly
in the non-default configuration:

[  650.495418] ACPI: \_SB_.BAT0: _BST evaluation failed: AE_TIME
[  653.033673] ACPI Error: AE_TIME, Returned by Handler for [EmbeddedControl] (20230628/evregion-300)
[  653.033717] ACPI Error: Timeout from EC hardware or EC device driver (20230628/evregion-310)
[  653.033751] ACPI Error: Aborting method \_TZ.GTTP due to previous error (AE_TIME) (20230628/psparse-529)
[  653.033788] ACPI Error: Aborting method \_TZ.LOCZ._TMP due to previous error (AE_TIME) (20230628/psparse-529)
[  653.033813] ACPI Error: Aborting method \_SB.PC00.LPCB.EC0.SEN2._TMP due to previous error (AE_TIME) (20230628/psparse-529)

So, we could test all, or up to certain level, but we will continue to get noise I'm afraid.

> 
> > 
> > v2: Fix Subject (Kamil)
> > 
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > lib/igt_aux.c       | 31 +++++++++++++++++++++-----
> > lib/igt_aux.h       |  2 ++
> > tests/intel/xe_pm.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-
> > 3 files changed, 80 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > index 3407cc4f2..7770a05fc 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -852,7 +852,15 @@ static bool is_state_supported(int power_dir, enum igt_suspend_state state)
> > 	return str;
> > }
> > 
> > -static int get_mem_sleep(void)
> > +/**
> > + * igt_system_get_mem_sleep:
> > + *
> > + * Used to query the current configured mem_sleep. In special to stash the
> > + * default of the system before any test operation.
> > + *
> > + * Return: Current mem_sleep configured.
> > + */
> > +enum igt_mem_sleep igt_system_get_mem_sleep(void)
> > {
> > 	char *mem_sleep_states;
> > 	char *mem_sleep_state;
> > @@ -891,14 +899,25 @@ static int get_mem_sleep(void)
> > 	return mem_sleep;
> > }
> > 
> > -static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
> > +/**
> > + * igt_system_set_mem_sleep:
> > + *
> > + * Used to configure the mem_sleep. Useful to return the platform to its default.
> > + */
> > +void igt_system_set_mem_sleep(enum igt_mem_sleep sleep)
> > {
> > +	int power_dir;
> > +
> > 	igt_assert(sleep < MEM_SLEEP_NUM);
> > 
> > +	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> > +
> > 	igt_assert_eq(faccessat(power_dir, "mem_sleep", W_OK, 0), 0);
> > 
> > 	igt_assert(igt_sysfs_set(power_dir, "mem_sleep",
> > 				 mem_sleep_name[sleep]));
> > +
> > +	close(power_dir);
> > }
> > 
> > static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state)
> > @@ -1018,11 +1037,11 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> > 	igt_aux_enable_pm_suspend_dbg(power_dir);
> > 
> > 	if (state == SUSPEND_STATE_S3) {
> > -		orig_mem_sleep = get_mem_sleep();
> > +		orig_mem_sleep = igt_system_get_mem_sleep();
> > 		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir, MEM_SLEEP_DEEP),
> > 			      "S3 not supported in this system.\n");
> > -		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
> > -		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
> > +		igt_system_set_mem_sleep(MEM_SLEEP_DEEP);
> > +		igt_skip_on_f(igt_system_get_mem_sleep() != MEM_SLEEP_DEEP,
> > 			      "S3 not possible in this system.\n");
> > 	}
> > 
> > @@ -1034,7 +1053,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> > 		suspend_via_sysfs(power_dir, state);
> > 
> > 	if (orig_mem_sleep)
> > -		set_mem_sleep(power_dir, orig_mem_sleep);
> > +		igt_system_set_mem_sleep(orig_mem_sleep);
> > 
> > 	set_pm_test(power_dir, orig_test);
> > 	close(power_dir);
> > diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> > index 4664559dc..8fd21c37b 100644
> > --- a/lib/igt_aux.h
> > +++ b/lib/igt_aux.h
> > @@ -214,6 +214,8 @@ enum igt_mem_sleep {
> > 	MEM_SLEEP_NUM,
> > };
> > 
> > +enum igt_mem_sleep igt_system_get_mem_sleep(void);
> > +void igt_system_set_mem_sleep(enum igt_mem_sleep sleep);
> > void igt_system_suspend_autoresume(enum igt_suspend_state state,
> > 				   enum igt_suspend_test test);
> > void igt_set_autoresume_delay(int delay_secs);
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index b4a8c4d15..29d576522 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -44,11 +44,18 @@ typedef struct {
> > 	struct pci_device *pci_root;
> > 	char pci_slot_name[NAME_MAX];
> > 	drmModeResPtr res;
> > +	enum igt_mem_sleep default_mem_sleep;
> > } device_t;
> > 
> > uint64_t orig_threshold;
> > int fw_handle = -1;
> > 
> > +static struct param {
> > +	bool ignore_default_mem_sleep;
> > +} params = {
> > +	.ignore_default_mem_sleep = false,
> > +};
> > +
> > static void dpms_on_off(device_t device, int mode)
> > {
> > 	int i;
> > @@ -221,6 +228,21 @@ static void close_fw_handle(int sig)
> > 	close(fw_handle);
> > }
> > 
> > +static void assert_default_mem_sleep(device_t device, enum igt_suspend_state s_state)
> > +{
> > +	if (s_state == NO_SUSPEND)
> > +		return;
> > +
> > +	if (params.ignore_default_mem_sleep)
> > +		return;
> > +
> > +	if (device.default_mem_sleep == MEM_SLEEP_S2IDLE)
> > +		igt_require(s_state == SUSPEND_STATE_FREEZE);
> > +
> > +	if (device.default_mem_sleep == MEM_SLEEP_DEEP)
> 
> else if ...

ack

> 
> 
> > +		igt_require(s_state == SUSPEND_STATE_S3);
> 
> isn't this actually killing the S4 tests (which right now are up to
> device suspend only...)?

doh! indeed.

we should probably have a

if (s_state == SUSPEND_STATE_S3)
   return;

before the igt_reuquire block.

Thanks a lot,
Rodrigo.

> 
> 
> Lucas De Marchi
> 
> > +}
> > +
> > #define MAX_VMAS 2
> > /**
> >  * SUBTEST: %s-basic
> > @@ -327,6 +349,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> > 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> > 			  d_state == IGT_ACPI_D3Cold);
> > 
> > +	assert_default_mem_sleep(device, s_state);
> > +
> > 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > 	igt_assert(n_execs > 0);
> > 
> > @@ -636,6 +660,8 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
> > {
> > 	int gt;
> > 
> > +	assert_default_mem_sleep(device, s_state);
> > +
> > 	xe_for_each_gt(device.fd_xe, gt) {
> > 		char path[256];
> > 
> > @@ -669,7 +695,28 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
> > 	}
> > }
> > 
> > -igt_main
> > +static int opt_handler(int opt, int opt_index, void *data)
> > +{
> > +	switch(opt) {
> > +	case 'm':
> > +		params.ignore_default_mem_sleep = true;
> > +		igt_debug("Ignoring default mem_state!\n");
> > +		break;
> > +	default:
> > +		return IGT_OPT_HANDLER_ERROR;
> > +	}
> > +	return IGT_OPT_HANDLER_SUCCESS;
> > +}
> > +
> > +struct option long_options[] = {
> > +	{"ignore-default-mem-sleep", no_argument, NULL, 'm'},
> > +	{0, 0, 0, 0}
> > +};
> > +
> > +const char *help_str =
> > +	"  --ignore-default-mem-sleep\tUsed to enable s3 tests on systems where s2idle is the default and vice-versa\n";
> > +
> > +igt_main_args("", long_options, help_str, opt_handler, NULL)
> > {
> > 	struct drm_xe_engine_class_instance *hwe;
> > 	device_t device;
> > @@ -705,6 +752,7 @@ igt_main
> > 
> > 	igt_fixture {
> > 		memset(&device, 0, sizeof(device));
> > +		device.default_mem_sleep = igt_system_get_mem_sleep();
> > 		device.fd_xe = drm_open_driver(DRIVER_XE);
> > 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
> > 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
> > @@ -725,6 +773,7 @@ igt_main
> > 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> > 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> > 
> > +			assert_default_mem_sleep(device, s->state);
> > 			igt_system_suspend_autoresume(s->state, test);
> > 		}
> > 
> > @@ -738,6 +787,7 @@ igt_main
> > 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> > 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> > 
> > +			assert_default_mem_sleep(device, s->state);
> > 			igt_system_suspend_autoresume(s->state, test);
> > 			xe_for_each_engine(device.fd_xe, hwe)
> > 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> > @@ -848,5 +898,7 @@ igt_main
> > 		igt_restore_runtime_pm();
> > 		drmModeFreeResources(device.res);
> > 		drm_close_driver(device.fd_xe);
> > +		igt_system_set_mem_sleep(device.default_mem_sleep);
> > 	}
> > +
> > }
> > -- 
> > 2.44.0
> > 
