Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20CEC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B210E2CB;
	Tue, 22 Apr 2025 19:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYnVrDvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5C10E2CB
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350203; x=1776886203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SgIeHPnu7Aoi09GDfLbwNodjBoPzcBHwtG458tsbqlc=;
 b=UYnVrDvMDRuAXcHEZYDP4nOcZjzxj8KpbBIPZusBuXafPDRhiJnBL0d9
 QYmX4TAqdg66qhVJJY+Ux/1RVFlDbrKy2gjmeQXLmTs7j/UGIJEKZxR3B
 zVcOALZgNNuPvJlAUxe7dRGg6KNaOdxYqbhBwhtrHctLgFmsm/eyQx9tD
 ryobbI/mQ+7HfywIyJDeFGjvLe62P9HEKtzejjLpeJpC+YtBzFvGzQpon
 suvwLm6PtZtLaVXTNT8aWrf/xRbfA/CZzOmZ70i3MNNnBcTDP/Ql/JUbU
 U0N6Gcf2gQnNg1ArPkeG0ANRKf6Xxs2i23x02MQSVmz8lcnoJJIWMP7jN Q==;
X-CSE-ConnectionGUID: UR/l4VOAT6+/GKAVAKWjaw==
X-CSE-MsgGUID: OLMmQ8ZBRl6CmcTL5NDw2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47052641"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="47052641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:30:03 -0700
X-CSE-ConnectionGUID: t2t0KYPJSLKb6Lj6Js9Fog==
X-CSE-MsgGUID: vm74VvtJSCiQA9/6q4B9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163069482"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:30:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:30:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:30:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqxhoodHbsV1ZkRsrKF4kwp2x+wbvbzkoRTtSUN+66HAZ1M3ytNslExZ0x+Pr7/1mrKWJGbZ8FAl6Zm0k+rY2h+OQvWA1ccjtRkaXd2dMJumSNRgbeplRBlmdyBcBOwH2WngPxHiH27zUUnSpvMWWpdRtSAQFCLdrWZ0C477s/jnc5dAXd2Ifzk096yKHm8hz1AOVIXDkugk449NrdNf6T6pAKfzWbT0310RHAYoWpNHoFCwd5QWiOe0yxlA1A8UbISkzB9563neCydtsI9LTzfDqSy00Ukyplp88imssxBxk87qHuWac6gzAgUryf+NHo+0lBi700tdbA6eTpGAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJp04NioonmTyHs7+ltWap8mb4iXgIP6cSlzQ6ez2n0=;
 b=Us9tjtNaus1xqZgOpHV/0m0erjQ5Ns4+Eojae6a1ILz286LeQwStObK0NfqqGUbpMDv8Temd4COZ7rO+Z3UPq0KGDTlikXXOPf6KyUNrwTcqySE/1OBVyvyuNCkUhwGKSR2Z0asDtYeNStq/pGT4x6h1EDOf1kxSdCUj6czomlJLaN/m8P3EgU6bg2iSBDlszeyekob/RI+SZX64DaweWckvP/nmwhREsKNIGR/azbf0fI5MzupOnsSGQHiXJr2V/Ndw2OmsSrj+6E5SwOkWxWUjy984Pf8r+8gft+8WQL+AvOajpw23H277ibnIgoZ3McCCuBfIlhrjTV6crzdpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 19:30:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 19:30:00 +0000
Date: Tue, 22 Apr 2025 15:29:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <kamil.konieczny@linux.intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Message-ID: <aAfuM25ln-ugZd_W@intel.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5618c936-5a6f-4a66-3f26-08dd81d41288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D45S8zovwrp4yUoTNv1vcZvcRM2mTzXchrAvEbVFzhLZhWkv0cx2XQ3KoRAP?=
 =?us-ascii?Q?zjAzoOqmmkfle9zv9c8A9cxzhjQmB4f86TwZR/wmt+waM3DSN979UCbNxDMQ?=
 =?us-ascii?Q?vIMtCReXT4pecHJb3QIMFWq93SR1aB3SN5zPPL9ldvfiqi17yKlYMOWi+8jm?=
 =?us-ascii?Q?VUFqT7Q5YdjzHL2ZkCsU27XY9pnDGlMKc25oBmdMmVD2XGRfOFv99B/pRy9R?=
 =?us-ascii?Q?+F+z9Z10vYZaeMkeNAiJ6/sy1T9fBAOU92MibRXgPxVVfAg4pKwqrvXwz8uZ?=
 =?us-ascii?Q?A11YIq4wvwidbUeZGo3dI3DxP0iKDoTVjjBMPfDnrxSEMQxVmEWmBwON+/w7?=
 =?us-ascii?Q?YgwWmmG4QJor84fSvEdsSNWzcWMQ2z0UqIwfEGmGTWXfpojGdBuy9eHZizo1?=
 =?us-ascii?Q?q0b7fG1yisohDreI+QFhx9zMoQqU4BfMH65kq5ULC/0GhzJcTgWVoEcg+k8P?=
 =?us-ascii?Q?K0gdzCCXwMqpk+CCMxWUyAi2ZXfSWgR3UmKocKHnx7nJc3nSHZI8ZvvCrTWX?=
 =?us-ascii?Q?kRs6IPzO7ZqDiQTaV5iVzyYFIAsoQRIlh/nqv7qCr0cESHH35eB8JI67YMvV?=
 =?us-ascii?Q?qyv7F3/nM41bVTBRzPvhUApcpM7tF2CCxs+wSmnirfyM7cZxpshjEAAWV77N?=
 =?us-ascii?Q?W0IZ9jpVHs1Dc+peHuJSK9bNw+pUbARx8Vb+mtzpq1ZyCPmrH5ylSgJkcUbg?=
 =?us-ascii?Q?U1TPgSI77q56So9ZME5PsQwr8SaRG/zKlReylP+ibiJV5cd9xNqWIYu572t2?=
 =?us-ascii?Q?HlerTHaazTzukqKgtKdDNnQ+QuNn6TYzvvAu1y9elj9x9B+fZ653xZZWffCQ?=
 =?us-ascii?Q?5GCxEDTl1KODKg5E0DWOvUdoLu5HkBUsJH/6lRcWtFDfEx2Npx0EO9d/zNqO?=
 =?us-ascii?Q?mZ7qvQgISb6DOvI9QRbl7RvyACCle2rJN1VJe1k4Mbjv1c3yU9oHJKcFZR3+?=
 =?us-ascii?Q?+qn+6Uvp3qoc05gPx1VHeApJ85iCHr5hDTEIst5vmCzldNXmfzKLhRFlkMrB?=
 =?us-ascii?Q?IuofhwUfQL5J8DeW87MxecDSurryHpA4/eP2zwUEv/CfWIhstNrpQa1eYhwr?=
 =?us-ascii?Q?5u/ZV68AZD5hQI4YD5H2tVA9ds7idv3u1I5Z6AGa8LEnzIKAcL6BePXvOAFB?=
 =?us-ascii?Q?0v6h9j8WKpLIRUSqN2PKbIMN3f62NY/+vYOsfA71sPGlJieBjg+utHXslZMq?=
 =?us-ascii?Q?hWiyb2RtK5Yl/uWSIDYI2xzGWp9nF/98EV/+fuLh3gVFXiUTguCJcUtNRDcy?=
 =?us-ascii?Q?PSTUz11DIz+girbfXhQl3e6Vzme8IJ880NRsANgfyij3ZjKMC2g0vK/+Q/3n?=
 =?us-ascii?Q?AQL6iMDn1B/BiTW+7XFq7Qlg7gJIV6m3l6FSG2hKWBbwS8Qn2qtvR42olIzI?=
 =?us-ascii?Q?8rAwDQzQwei+JGEJ8UA1vKANrRLuVUwzplVwmhOMQ5fdG29WIvOxO2rVbF69?=
 =?us-ascii?Q?KUDu5kowub0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lr+sp59lQ8oOxAX7QmjKPWdDu0LmDucucbg82wxlpBA8oN1HIHL9iGxDRK9v?=
 =?us-ascii?Q?y/r/WFCp4A1z/yoltjd+jin3dK85dNVg0izRnxcFpxzFpExcLIhU9e6jU3BV?=
 =?us-ascii?Q?kzfYKenV12TP/EAUICpJHWHSgNF8qSia75/SnQGtKjORD08qv8PV2A9x51MA?=
 =?us-ascii?Q?ylavhNfTGyK/Pgf4BzJs9qUGjI3P1upEwLHUqaPUSKp37GCxEZhKvsMAjQQ7?=
 =?us-ascii?Q?LpzchkMAgN3nfOaSXaNII7kwIQ1oTpQLNs2POOdWctDL+Wt/CuwAd94uJgSP?=
 =?us-ascii?Q?r9SJCWN99ee3jEvZaGcI/l+4tt9Swrxp+YGU0fuErZk0ma2scV+OK1GjGcBP?=
 =?us-ascii?Q?HwMApg6QMfrlsCwYiKWVCtb2cycxBtH7FRoXK48Edm+gmkljpBZHVJ7FPKmP?=
 =?us-ascii?Q?a6k6TITjYXhyfoq/uKLnkty6bLtuN+RzdVWL97yg8PsX1czdAS1nHFNFKi9A?=
 =?us-ascii?Q?8DKjDDk15vD7meNW4Da3UGVTp/fhDaBaIxvqUIjG+jf9v0baHy4aic5oUblb?=
 =?us-ascii?Q?0Zi/RiV9vUVI5ZO2+OH9EifKEUKpT0oHJA5tVYyf7+1w/FfF66I2BKypZSVd?=
 =?us-ascii?Q?sbH37vFWNlouwlypWJ+x8KMGQpp1H6Nq/4k1gpXyTy8px+R80WQsQCwF4Yum?=
 =?us-ascii?Q?sJGIn5Mp/dVGhBknF+Vf9a/3v5GvwGDwHdNNqDlzv/SCwpMRazow2vsoER/F?=
 =?us-ascii?Q?8Kixo3tqiEoNfgdKMvRYRO+LGXFJ7k5/wFYfOQIayvZ/MO9KO5/jN+lvu4b8?=
 =?us-ascii?Q?5cqp+OnbKavJrMFF8Vm8cw7n2CmGtxZ9DyEaUAh+vKSS8993EGA9aZFa7Qvt?=
 =?us-ascii?Q?seqnbHiomJTdvDNPBsdH0Dk2Vyvwg5TxWYj5tw0NMSTqFp1touMZVSfKJt6V?=
 =?us-ascii?Q?uohQu6mVjkk1UyVbRBuDG8c1aigezliECJyWJfORItHJ71w3I2LuXP47o0L1?=
 =?us-ascii?Q?H4OpBHSSLiwg3ytOebGAZJGV5w7/YXSGCiyrumx7EQU8UyQWUeYzTVxlMcDK?=
 =?us-ascii?Q?m1jiWu8XbFyh3I6tf78ImKsU8eixByzYFxsnx9nF5yINuElxB6RnRcGSA5Nq?=
 =?us-ascii?Q?W9xhGNW5Fmuw3MeHdxXeeFsfvGT6jpgCdfdHHwkjWIl8ECMhdnBCn9e6Ohsi?=
 =?us-ascii?Q?vaP4Ivwc4UI/2lmdgs4d+m/OLlVzHr5PzCJfw100s4cN55yNbyVSRVpmvd0U?=
 =?us-ascii?Q?MnoN0IlSlhWvzkmsdNcqZWTr5LEX6gIWhMknB1gPmILsSEcJUQEsN97GKBTe?=
 =?us-ascii?Q?6lDEERNEsx4/mglHwSj7IntJ1IgnGaqTSKDytDepM361uaSLhU3CDSTzItUw?=
 =?us-ascii?Q?V5BzgxhUJulSvBH1cnvSuQiynlF3fOJ4mkCOLuOkUQ7e5LAPvjPNcBrlmnBr?=
 =?us-ascii?Q?5A8Xm0VBBvVsA0WH8L7h/6gVcSJnm+8rh5Ex/hPOkuJrqlN8n9CPxm7IR9Nn?=
 =?us-ascii?Q?k9T3fzC8hHOmaPr4jDghKEjxrtHp1XEx7ohGtAuzU2A8yfP4NvaHG0nxXPe+?=
 =?us-ascii?Q?kFlbg9d2XWDcznp+JvCrqxPd3f10EP8UtSkNZSkzYi50c37n5Krf3gIr8a96?=
 =?us-ascii?Q?DXTXfwUbTdbAcuPHZSKmKUnGoiAvDMj2odeJgqtzs3nsaJRdUMB6fryxeGDl?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5618c936-5a6f-4a66-3f26-08dd81d41288
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:30:00.2709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TVns51uRU1BvMRK9yvs9h1GWhDCLevj0N2A1ICHDnnSVsxcUDGtwOdkWW/MJr1pO0Yko8+roOO5X+JfHjiPsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
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

On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
> On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
> > The test validates if survivability mode is enabled on supported
> > platforms when configured using configfs attribute.
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> > tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
> > tests/meson.build         |   1 +
> > 2 files changed, 113 insertions(+)
> > create mode 100644 tests/intel/xe_configfs.c
> > 
> > diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> > new file mode 100644
> > index 000000000..414af4a86
> > --- /dev/null
> > +++ b/tests/intel/xe_configfs.c
> 
> 
> humn... does it make sense to test survivability mode in a xe_configfs
> test? configfs is just the way to trigger it. For completly different
> areas of the driver I don't think we should bundle the tests into a
> configfs test: we don't test if xe can be loaded without display in a
> xe_param.c test, or if we can inject faults in a xe_debugfs.c test, etc.
> 
> My suggestion is to have a dedicated test for survivability in which
> configfs is part of it.

Well, that would work for survivability itself. But perhaps it is good
to have dedicated entry points for the knobs we expose, like we have
a single place to toggle all sysfs and debufs. So we don't forget to
add new cases and we have a single entry point to quickly exercises
the knobs.

> 
> Lucas De Marchi
