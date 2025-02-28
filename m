Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D5C282D1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E994410E07C;
	Fri, 28 Feb 2025 16:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlSfT2nb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E276910E055
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 16:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740761979; x=1772297979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mi1iLLZ8w4v6sGDhY0zSBQjglNienAMuwHtanNgVy4g=;
 b=XlSfT2nbuJGjblhOSlDe7dIaAmPdFCbRzKF1lj8vKViU9mKsMFCnFXKX
 eX1KZl0hvLeWGs8dzVZbg3HoPOzYmWrHebFdk+C94kOFe/mju6t+ndUEV
 Dee1v/kGxA0k5zBh+GHCyOys0upl7NbgfojkE2cyfP1EgcjxMiG82D6Td
 HYu0NLVxfu8wvyRE5yrn6F7EspMr8YgMDdMa2l7Kfzs7I+JVSP5CDAtWe
 SbeuTBLP+LyKYVxRB+9n+95xF9V/gCF+nDKUZEruMLFf2KPe3HZojIEpT
 LCCHf2GUO/vpd/cLVMzTclt21g7AZb4U4n1SGa63sVshrLRdWLp/9SSUf Q==;
X-CSE-ConnectionGUID: 2NGce+SATC6MeEwQRp7spg==
X-CSE-MsgGUID: bwnpowlcSbOb/yh3kcIJhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53106283"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53106283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:59:39 -0800
X-CSE-ConnectionGUID: 0ndPyCFCS3CApR+99+JJMw==
X-CSE-MsgGUID: +8w+HzReShar/NdSehziSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154553830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:59:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 08:59:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 08:59:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 08:59:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHt0ZY4uF4DfX9TZdXaFZfeLw05K49se2SsFU917xfsm51imUwqIn8lLRI7thuXpaQ9C/z/K4KQO9MwuXt8FPSleCnxa7++vhE/Fw6WmwlHOXwO5cRUJEGMOJgoOaPEpmYCvqZ80CvTsGcQoNce7IyhB57OTAxS6izNLI01le1/7PhMHRA27MIBVs+iA4v8NyrpsmyjuiAZYazsE0QsRAgPgM4WQdGagYHArjlom78n7mbwTD4ENmoB3HQ4kYj6aUVKI4E+sDYI0XD5db9++qzbyyTO3mk62ypi68dwZUTzMR5cDa4kk7H9gs0iAdeSuJycCFzrL5QG9p2DY0rU9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+w+oBgv7ACNMKIjgBF/jKZOmH91IHKjkaxx9un1Tt4=;
 b=lvlq5c4oXDE7AlFvbqHt/Mdu63u0Hk8FaBpJV71k/HZUOIvVzFiA8BNi3wd6nzDlCC2bcW64sVRKUdFBr8G28IV6/Sz/aRdH3X5pp278EbWNZORPdgO6XtmcVv/GpX/XTERIfHKsPPtr6Rt9wuhkx4ckxomqkHyfvfdJBSmBAKrh3Ssiwz1JyF4x07WXFP1tGiYEQGVfFO4jqkyD2UOy22ol0Q6eVIwpP9KaUml6amwujB2wCIv0y4Trj2+R9GM6MvxuvRzKMY3edmWwHnLpHbbqa59l+MresvN2gPkpkCCEGd2eimL7G7+vSHJYZyiiBgiq6hf5+HCJ7XzhjnWVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 16:58:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 16:58:52 +0000
Date: Fri, 28 Feb 2025 10:58:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
Subject: Re: [PATCH i-g-t v3 1/4] Enable finding all IGT devices for xe driver
Message-ID: <5h737eoyjjlafkbkp2vcef4ah6jp627ki5aw5p7b3std36bzjr@bargwsr4zvwv>
References: <20250228141810.1417657-1-soham.purkait@intel.com>
 <20250228141810.1417657-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250228141810.1417657-2-soham.purkait@intel.com>
X-ClientProxiedBy: MW2PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:302:1::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 94da625e-e567-4b7e-131d-08dd58192da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YvqfoEbY9e0LO9/5soFKVOTRz5sLNBeAIdvzgLVeNt3t2vAfgAWBBNgkmsI0?=
 =?us-ascii?Q?vOZdqL7sNa1luxn7hUWM98adskHvotrkAdf+2VDpeJvJG6L61/+q31bMrXCq?=
 =?us-ascii?Q?UI28Fg8qpeD9wLtd7lzKYbmoTQC3BF52OWis87wyCV4Uv6V8Ehk75cpOMyeI?=
 =?us-ascii?Q?Ha4rGUdyqYSP5TMDrdTMg7avu/s9xgWp49rV8+VbmwQcYJPEIkL95tCc4MPT?=
 =?us-ascii?Q?gkkoq8jm7XMxI7XikVoGD0vpIOUhekruwVlAHvw0ABI2trp4NDXm0Q8lF/8E?=
 =?us-ascii?Q?V9ydBei+kT5nY0OdDg+A3BBdCsH0N3Ah1Ro7YIj7cNAvqxDXtFlQNV40l//P?=
 =?us-ascii?Q?cTuc4a3plS6NTbRJPy6+Z9KGP4nBbgdAe+NESrtYDs15OAxgDB1zVJl2PRAS?=
 =?us-ascii?Q?ULgTp1hoFU0ZdNWK3Bjwp+TfX0zmIH5AoWXW1YsqC/JOiCymrvcOY3NM31gu?=
 =?us-ascii?Q?p4yb8+TeX+xzTQ/GiSXFLS1cpD8D+yInXrdPqARoeOBkPki/6Yd4NDrPBKOw?=
 =?us-ascii?Q?80y7xGZhFGuJzkkXrW6rTZvcoHBgXH70ZmgZHuZwqqPk3wzuicWJl92HjcMx?=
 =?us-ascii?Q?lGYySpglPsmODV9hoIzgZlFyL4iMZhggaj9+xtUXk9HlQngJtVeiZqOdyIYU?=
 =?us-ascii?Q?JewtMWoSwEXFuhkg+dioOWkX6I1KwgQf6DKeJ57JLGgw0Oqd3o2yFRPcigxp?=
 =?us-ascii?Q?8V4HgKxpBIuXF8Sc5NYifMflo7PXcEd2lVI4wAbVtiJSrkcOxinCs6V9xEnv?=
 =?us-ascii?Q?FnruQ1ZrEvC+KDQn6sCJ5QNk7wAEvr7n7lSXHPdvGkKp71MPeO1QEtN7r52c?=
 =?us-ascii?Q?SKImjAeHTd30kXAAfBA/8+ZAO5g65QNa9QWyvgovhKbzK5PvELVDWzsvvnFi?=
 =?us-ascii?Q?4snKY9p6AQvxfVa29soguaf27XmXa/QXr3i3BPHD+F512IFnks3X8aneXfbU?=
 =?us-ascii?Q?IGHc/mfamAOcckofIilG8h1wMZJ+fpTrTdIZjHCzAMOiIj0sSZcfxZjTqISe?=
 =?us-ascii?Q?Rjl8zFJb74W4dafKqy8Q4qKMo7WLrhYnbZyaCjDSBJx86JGNec9+FToXLh6L?=
 =?us-ascii?Q?YTruF4Ftjtv4LEWoBfiJJ/9N1EbFGPJr8/OYvDIuFIL5YFY+E6DgvEtehjiO?=
 =?us-ascii?Q?PONZMMhQqOMeVXNGb8dxW03LvBi/BE5Ep6yRgvXt6iMey3I2HERZLj1q6y/4?=
 =?us-ascii?Q?gymsZdKfVpyIR9FGa7C6Ixg1+uj2ByQ5ykOGZk59NIibhT+4YkiYtOvbPWPE?=
 =?us-ascii?Q?NjE6tjBwBWbxJBsHkVPuHyI1uOEl61/hZK4xWe3Aeo+tj4bmLW17jw/L1HtM?=
 =?us-ascii?Q?D5MAwqJiXq1qnpkLdPxsZL1p+E0VA5vkYncH+gZizSwT1wrZ83KqTQ3dkMdF?=
 =?us-ascii?Q?7PxsRwIftYviIiVzHtZ4ucEEcYrT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjC6kJzEQh9wMYkzIu4r4F2F3El/MS7lx7h0Zx4GKa0NGkmkP/zuedCs/RRK?=
 =?us-ascii?Q?LfQa70rgPcVDYL9m+IJslAwv9EU1ukc6pllINTQNUynE7KhOhXjvzgzgmfVn?=
 =?us-ascii?Q?Vv/A0ilY/7q6JnMqWPp/6h44LVL7o3rwAAOef4Z14kHKTrMZltPpFW1Al4Um?=
 =?us-ascii?Q?CqMaDW5WtJly68jqdG92yPppdc8wGXiZbX25Az1iW/ldEKxkH0fQgSRxRXRP?=
 =?us-ascii?Q?PZYV1OczWaUrguoOhu5D0xD16F1s2LFxiDJaxeK8sQrt+dih2GZlkyp8izp8?=
 =?us-ascii?Q?vSWyMhp3OkGhP0ZvuPwYdmXBS3W2AL6YhT0ulDBjpfAHySkx18ewfOvW9WdL?=
 =?us-ascii?Q?9KQ4NWFZdbAqnL8oZMF9IwqASsc5PxMEQR5beuSaxstZ7IqqyrQN/V657T3l?=
 =?us-ascii?Q?PzPvFitV0rsQeh1rZs02Iw8zsGlNnZd3lBGfTIhTSIoU70iNmV43oa/IRw4X?=
 =?us-ascii?Q?UfhkwOHxxH5zx1gpvTXbPLzDXgHDlHZPE+sWmVz+jJ3kYAiQP6EN7EJJSOeo?=
 =?us-ascii?Q?uIyhzH5DrqkfEh6Llbef5kGf/wqHDDxjUVxn4ibdwPvbC2/4+RQFKEYaL/Zh?=
 =?us-ascii?Q?/VTLZXjDE6D0JoRN1I+k3hWu75fZgA32ZYumxxKIMuExDOpCvYg5DlRCoTBO?=
 =?us-ascii?Q?gxyt9Q0onvo3uDP4jG7/Ub5uNak6deFk8TVKoJnNDbFA0KWa1T7mG/7h8uBv?=
 =?us-ascii?Q?aeOfbKNzTr/slV7NjiFneugbup/hUaz8g+zp8w6j5Pb4uIyr8QpMnCp6UFbu?=
 =?us-ascii?Q?XkSTRCmGIXr3owDYk96wi1PhsjFBXvli6qrlzBUFwctLfXcPmp7qI+qr1m0J?=
 =?us-ascii?Q?4Y9fUKup5DG7whBfdk5KPqOy4YSVrp+xs2CfDAokzyXjRsS4ImlpKOBpWbLN?=
 =?us-ascii?Q?3SN2VC6POmbCJYZfgMQbRNenBE/JDxes8cJ3MkMA5lzs3O8ZTk47NBdD8Yhz?=
 =?us-ascii?Q?Xr/wVBCZVspdGh4CLrE7AHQgEbt76LFgMlfv2wsnb2R+fVj/riQM689wOS9i?=
 =?us-ascii?Q?1Gmmv7RGDMMy9hryN2Bsu74XOVQWxAYSS8rSDOxD+asgK1iDePeA7/+sZ3wC?=
 =?us-ascii?Q?Ur2InoqzJEQ+7XH5NQ96ekm1TYm1Ut3JKvpUgTSVRdOyXK2qP18dHrMjih3/?=
 =?us-ascii?Q?cLoFlPFtKa7zNxcYSkW+SEX7HoKi2iOAg1oy8yvLQXheF9Br61WY6O6oM3Vt?=
 =?us-ascii?Q?AT3YjTIswHxAMAsQNg6CMmIWvUvFEFSP2emwY8Vh4wD8STzeT2oU4DbKUj75?=
 =?us-ascii?Q?F6SDqLWKwxUaF/OC1C6E+f2TnRKTfQszSv/Q8//9XXBELrJ/oUtvM0c9CTWn?=
 =?us-ascii?Q?ZLoQYbGSTO8QNiPnNZQ6Q8jLAXh6awmUxIVDK+vX7A7OnVF8i55F0nZzofCA?=
 =?us-ascii?Q?vYoVW4jf0/ZWc2Es3eNq56KwAJv+EonAWw0HjU0FQG7C8LW2DRvjUCzfhQfI?=
 =?us-ascii?Q?MhgT99HNmkFQCsbdWHSOZZf5CFyR5wX6HGlCkEcgnULQB8aPfsad6FnyqwUH?=
 =?us-ascii?Q?Efre1i3+2HrHGp1hGnR/KEBxIDr1lJ7uiAAF/GaMtR1NdRos8JpR8o2uJnF8?=
 =?us-ascii?Q?FrkR74Sfkz4b26H8AfV8ZuYYiy6lD7OflaX9USoUsJfKXCXwrJAwBE4ourhG?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94da625e-e567-4b7e-131d-08dd58192da2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:58:52.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SCzgSC+HYvfrq5fCOGw/er1x41j/DFMQLyODdYla12ONwVi5+/FPGL0S5j/jO0X/9NtxP7MjKJ1aCnSWavD/tLVbf+AzXlHVqXb/YWgfCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On Fri, Feb 28, 2025 at 07:48:07PM +0530, Soham Purkait wrote:
>v2 : fix for refactoring GPUTOP into a
>     vendor-agnostic tool (Lucas)

Sorry, but I think the abstraction here is not there yet. I'm commenting
more below.

>
>v3 : Separate commit for lib (Kamil)
>
>---
> lib/igt_device_scan.c | 97 +++++++++++++++++++++++++++++++++++++++++++
> lib/igt_device_scan.h |  3 ++
> 2 files changed, 100 insertions(+)
>
>diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>index 711bedc5c..bdbe09761 100644
>--- a/lib/igt_device_scan.c
>+++ b/lib/igt_device_scan.c
>@@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
> 		safe_strncpy(card->render, dev->drm_render,
> 			     sizeof(card->render));
>
>+	if (dev->driver != NULL)
>+		safe_strncpy(card->driver, dev->driver,
>+			     sizeof(card->driver));
>+
> 	if (dev->pci_slot_name != NULL)
> 		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
> 			     sizeof(card->pci_slot_name));
>@@ -820,6 +824,99 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
> 	return false;
> }
>
>+/*
>+ * Iterate over all igt_devices array and find all discrete/integrated card.
>+ * @card: double pointer to igt_device_card structure, containing
>+ * an array of igt_device_card structure upon successful return.
>+ */
>+static int __find_all_intel_card_by_driver_name(struct igt_device_card **card,
>+						bool want_discrete, const char *drv_name)
>+{
>+	int count = 0;
>+	struct igt_device *dev;
>+	int is_integrated;
>+	struct igt_device_card *tmp;
>+	struct igt_device_card *crd =
>+		(struct igt_device_card *)calloc(1, sizeof(struct igt_device_card));
>+
>+	igt_assert(drv_name);
>+	memset(card, 0, sizeof(*card));
>+
>+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>+		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
>+			continue;
>+
>+		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
>+				PCI_SLOT_NAME_SIZE);
>+
>+		if (want_discrete && !is_integrated) {
>+			__copy_dev_to_card(dev, (crd + count));
>+			count++;
>+			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
>+			if (!tmp) {
>+				free(crd);
>+				return -1;
>+			}
>+			crd = tmp;
>+
>+		} else if (!want_discrete && is_integrated) {
>+			__copy_dev_to_card(dev, (crd + count));
>+			count++;
>+			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
>+			if (!tmp) {
>+				free(crd);
>+				return -1;
>+			}
>+			crd = tmp;
>+		}
>+	}
>+	if (count == 0) {
>+		free(crd);
>+		return 0;
>+	}
>+
>+	*card = crd;
>+	return count;
>+}
>+
>+/**
>+ * igt_device_find_all_xe_integrated_card
>+ * @card: double pointer to igt_device_card structure
>+ *
>+ * Iterate over all igt_devices array and find only xe integrated
>+ * cards and populate an array of igt_device_card structure upon
>+ * successful return.
>+ * card will be updated with the pointer to the array of
>+ * igt_device_card structure only if at least a single such device
>+ * is found.
>+ *
>+ * Returns: number of integrated xe device is found.
>+ */
>+int igt_device_find_all_xe_integrated_card(struct igt_device_card **card)
>+{
>+	igt_assert(card);
>+	return __find_all_intel_card_by_driver_name(card, false, "xe");
>+}
>+
>+/**
>+ * igt_device_find_all_xe_discrete_card
>+ * @card: double pointer to igt_device_card structure
>+ *
>+ * Iterate over all igt_devices array and find only xe discrete
>+ * cards and populate an array of igt_device_card structure upon
>+ * successful return.
>+ * card will be updated with the pointer to the array of
>+ * igt_device_card structure only if at least a single such device
>+ * is found.
>+ *
>+ * Returns: number of discrete xe device is found.
>+ */
>+int igt_device_find_all_xe_discrete_card(struct igt_device_card **card)
>+{
>+	igt_assert(card);
>+	return __find_all_intel_card_by_driver_name(card, true, "xe");
>+}
>+
> bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
> {
> 	igt_assert(card);
>diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
>index 92741fe3c..25d3c462f 100644
>--- a/lib/igt_device_scan.h
>+++ b/lib/igt_device_scan.h
>@@ -59,6 +59,7 @@ struct igt_device_card {
> 	char subsystem[NAME_MAX];
> 	char card[NAME_MAX];
> 	char render[NAME_MAX];
>+	char driver[NAME_MAX];

For me this is the only part in this patch that should exist (together
with the patch above that is populating it).

IMO we shouldn't really add igt_device_find_all_{driver}_{type}_card()
functions. Imagine supporting 10 drivers. Are we going to create
(internal) APIs for everything?

I think it's better to use a composition strategy. For that you only
need to add the driver name in igt_device_card, i.e. what this part is
doing. When you enumerate the gpu devices, it saves the driver name. The
callers then decide what to do with the enumerated devices.  If a
"filter while enumerating" strategy is what you want, then you could add
a match callback or match criteria. Example: igt_device_card_match()
already implements the latter - filtering by driver could be added if
it's not already there.

If you are doing a long-running application like gputop, you'd likely
call igt_devices_scan() then walk the list to check what drivers you
have and do special things for each of them. You shouldn't really call
"find all i915 discrete cards" + "find all xe discrete cards" + "find
all foobar cards connected via usbc with display active", etc.  Handling
device disconnects would be nice to have too, but at least we shouldn't
crash.

Looking at patches 3 and 4, I'm not sure why you are separating the
lists for integrated/discrete if then later you do

        count_int = igt_device_find_all_xe_integrated_card(&card_int);
        count_dis = igt_device_find_all_xe_discrete_card(&card_dis);

and do the same thing for both.


Lucas De Marchi




> 	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
> 	uint16_t pci_vendor, pci_device;
> };
>@@ -92,6 +93,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
> bool igt_device_find_integrated_card(struct igt_device_card *card);
> bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
> bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
>+int igt_device_find_all_xe_integrated_card(struct igt_device_card **card);
>+int igt_device_find_all_xe_discrete_card(struct igt_device_card **card);
> char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
> int igt_open_card(struct igt_device_card *card);
> int igt_open_render(struct igt_device_card *card);
>-- 
>2.34.1
>
