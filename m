Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C880FD64085
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853A510EA34;
	Fri,  8 Nov 2024 20:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW5c5G8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6802210EA34
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731096644; x=1762632644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M9U06cDVOUL2xkg3zVplovc7OxxrBZpjfoY2Dhz4IMY=;
 b=AW5c5G8NlFo98+TZo03IpgFLuH3WXzGlbmy8CVTXR4NwoLDAT3leA0zV
 sL7GzJY8PtVCewrja7kFkEOrtTLzDUSSA26PkcXYqvNwt6IZxx8H+q99/
 cd7vR2g6/dE1GHXBlsFqTwklj9y2/oaHoOG7/B022hI6qdqXfdoHOmaXb
 mPIO37r4fSZNmsoGdPryF/TEUoY/msJszokz4ueLHIlwnWhKT4Bv2AI54
 gtVJMXX0vUMu5brFG2PwrAIC7hLWeoRkOhwCfdfX9O7wYl//L1rswI+Ff
 E0fRZWtn403bgRmb1hBFucQqkaMHpiN7zXnWK4I4A4lmaszfxegJsN9FO w==;
X-CSE-ConnectionGUID: DjesEMQYTkyZyJPtA6EpEA==
X-CSE-MsgGUID: xxCefOKtR7aDcH/7V38haQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41605885"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41605885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:10:43 -0800
X-CSE-ConnectionGUID: NDQ/SSTVRtiRH9uGBACouA==
X-CSE-MsgGUID: H+houNHaTl+5dJE5jBg8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="109001137"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:10:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:10:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgcQUxaaUan8CD3skkuGIBT2Jouffxb3rBDSAo8opeVi0kGE6fjPzRZt30vBYIr+pMEyStwDs2Q8FZO8zAJ9VVeuYfFGbsK6ubmiUxpe52jLzIm45sa9BZoqvzXBXuKjbVkKLb4dhpeJ0Zn5Vc6LjDCsRjPfD9/2mDebobopRZYRwuTuHexY/HrNLTYyz3rL2VgUfuYIJHAaqiezvtPjtZxS5W/abSvcgdP2oi0XVbIJLfc8VgNOUV90TIWIr0iVW0VCVh76Qlzsh4wLecyocUo3F/yTUGsMw6WeT3nk5G1katLVNczGFdjUo/L/ts3nHWumDyuqpGrobUDTXbHNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWKOamUfcKrz2WkTbeUKNmBABwEGRfQhhf7+h388pN4=;
 b=sqPV0V+DCBHQcMYrYh5vid2zbqDTRo4JCF7GPjtgnMLBjDLhYgydgSiK5s4Y04Ww7hD7mMBGPNh/xD8UX6v43dSO4yNEXmczuDq+o/kLPMkhI0mtxPHbAsUcg5k5RbF5+bBW1TcJbfQieghzyE3Fd64NWOr08z9FLb3rOo7Es8Hy7dfif32RBuzVMNuIB3uXf5/Nf+CCxKuP4N5c/1HtLpKQK7Q+QI7RxykQ6MK2oZNUGFv8xYIYn98uPVcDbisPqZIuSmzXnjlPiZWoyt1xVWuIknPb8GP+cMnI7xoOFRK8UzOAeM7+wDvVAmsRrbgJ2a5hhelIUmDzal0eysTkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 20:10:39 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 20:10:39 +0000
Date: Fri, 8 Nov 2024 15:10:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_fault_injection: Inject errors
 during vm create IOCTL
Message-ID: <Zy5wPKerSmtBhxOh@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
 <20241108160021.1202234-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108160021.1202234-5-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: 3901a976-c031-4b18-9f90-08dd00316a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cvwtG4ZSo7cwOkIo82XGD/5CaK23GIMgQYwC9N0eLoF7xXXD9MkdfDhV8cbP?=
 =?us-ascii?Q?YlNBUoMzOdh+ge4fU2zlkidRI4HchjYiFSuqTeA88LmOEMeMXo0eAzAbUPQM?=
 =?us-ascii?Q?P68BvXEdTxR3pySrnhBtOk9znUCpnnLHmXOQ8qPAXw2nobDlDLCbh3QUPBw3?=
 =?us-ascii?Q?1wdckuMkELjMiTnGq5LjAbVb54XdeepwyqCScXweIjv4/thE0mKkEesMgfJw?=
 =?us-ascii?Q?/1E8o0ybBa/WnBLfaCqpCxiIMeDU5lmGNOzHM7rZ4TPmJzsOxXmKZQM70q5t?=
 =?us-ascii?Q?eo+lEmPr7UNIkM7ghJXL+9V53D+CTo5BCtkL6LgqVwJA4HSA0Fk67WqJdBHj?=
 =?us-ascii?Q?Dwu+waIqS0aoqPa7fqe/o1z6sJMG9AbaWmErF2RRne2M3QG7j7mzWmFOuo5O?=
 =?us-ascii?Q?kWo5wCiEllcIaBRnLSkj1mgnjghWTZ9QPWhG+wy99KyRrDQmErxotIlZ9Dm4?=
 =?us-ascii?Q?sLb24Le2jIo3XglZMIIAL5BJVq26WQDgW0KDCgX1DCm8DTt9CJGrqy8bNT2V?=
 =?us-ascii?Q?AiN5ebLA2ZBuQMF8E7O4iwRod/Te660dLAJc40NJwJvy+EWoWeYE8jXH++Fu?=
 =?us-ascii?Q?Dh1rYyRNRpE/1rWiOqpZLqgozl9sf26IgTFIaIRnQmwRL5fgg538KpIJ8zjI?=
 =?us-ascii?Q?2hRO7HVEquoD9nThj7rgfyogFChDPoscjs6OQ/b7xIOOts+rACSIZMlBHJZQ?=
 =?us-ascii?Q?Rw5Mr0z9vmyHIHmk6kaB7IZl08fz6uDWL7RERbdX9Ur7ilnekm0U8Ndggxzr?=
 =?us-ascii?Q?N0EDxK7y+R4kqMtQ1o877c8JQ2J1hRWB8d0SsHPYBmwJOVV5JiETEC4VdlBU?=
 =?us-ascii?Q?OR9lVz1mbcGwOmIB85Ot3IFcBeT+xt8sPBxx2Kyt1kxTxCQaq0ofX3nGgr+v?=
 =?us-ascii?Q?YsB0m/GRO/JFyZHBx7ilpHFNYP5vO0yy++O18Vd76vodp0SMP/Z8UrlgtCJh?=
 =?us-ascii?Q?Y4CRkle1OJOM4xZt6qCCCEpYYzbLVnjQieJRvmNYLM7qtIEWZndF02SsldFB?=
 =?us-ascii?Q?m0yFjOK7andTztqRn42XssXYF9iQu+7K3H2GXd4d8MP+q+r1HD2lJUpHS1x0?=
 =?us-ascii?Q?FibmZ+2HHuT35Qnh1fhnqg4Lh4oD2nettlcTrnVA9HbbDgB1AMXCU19qYvau?=
 =?us-ascii?Q?XWOh1JJ+36KvfXZqGQoUsm273tNcUe2MqjJFOpSCAukGo/QrNbFUNlcxyTrR?=
 =?us-ascii?Q?kww7g7Yf+/vum8cmBxh7IYcAYsNnQ80s4Tl7P0EfMrMsUly3ErOg16wECElY?=
 =?us-ascii?Q?u0TPapewVhvzsxDWkDObViXkqiA+ePzqdlVwIz+hJ4b91aw/1FO1wV00eqDw?=
 =?us-ascii?Q?PlE1TumhhMnfnu28D2qn1PP5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hsabmj6R5hVxIE1RgbOiB8wlAEFWstGGb4/dSzAngr7figQGNJeMTvw8Yr26?=
 =?us-ascii?Q?1WA94x+OKwIuyIQDfYLeyq1orYddibZDWc/ZqTipB+8NPZbfUqw/SOrofFmN?=
 =?us-ascii?Q?6PYrzUGi36mx0DvztbaNamR8OW3DAoVQE/HUm8K4gImfHhtW+uDSrgqFVpEC?=
 =?us-ascii?Q?rhsfOvxvV9pc3Y2QhB81t/xvNWVXxMlGt654RqfZgn1hKoUq32JrNgTTWol3?=
 =?us-ascii?Q?N19bU2HB6tzf6xZn4E+13GZM3I1OMTu966al6MJKzWEnwjT7t5lHVy/0ghH0?=
 =?us-ascii?Q?PI8NQyq6rTrUHkcmqkgyUftkQ4hEonjqADdhvlcC04Qq0XVYWQazxGGPd5Qo?=
 =?us-ascii?Q?8gLGES/k5cChNjwmpIfH9PxYQGPDpdrR87puSDly2oPrLKzygWbfHsxdcDrP?=
 =?us-ascii?Q?7Mjv3rhBa5eFDU/9WklR6xLZBdEdhjlIl3KaWGwgmcaXDto6z7sf7ngU8fe6?=
 =?us-ascii?Q?5j8x8mIrohtoxSiWaZFtbgJp0ntyovA/hbGgVZf8ooahJPde45Y52bOxYWsG?=
 =?us-ascii?Q?mxBl0j3L/EH0Kx4Yub4a28p6//yh2cDljY9atDbc08eWmNq/oXJF7GgiVJz/?=
 =?us-ascii?Q?6J2M1Bmva6BapBQLDRYDWESk9ccvapqOyziZ5aS3YKO8JgcyT86Qi9viFBRc?=
 =?us-ascii?Q?OIra72UpuivafDr+6dY5xxO1OJLNI/j8Fdsmbvf5FeDyoExBj2CYkwNJ9qnc?=
 =?us-ascii?Q?/05rwZ6OD2xVZmJbPdhB83TuI/HmNb5pdBmToBABBHi8VmFfqhK/yKKCXvf0?=
 =?us-ascii?Q?rXbzW98iJaooNc2hqf2CRcKghSs70k90dGSRZgH62YFTfTZ/PLCo/hsfUMJ+?=
 =?us-ascii?Q?1Ni7COfMIcCwyw3S3X7OpsTHwDMUvl/UhREer3s2wuTTHhGod9Z8yhzpoRdb?=
 =?us-ascii?Q?hCkgp8fsJHAz8qI5jleDjlThfjY5AelKgkqa48TFopFkpWiHMbdFluN0g04/?=
 =?us-ascii?Q?B+aOVIHm57YXxWBX4d8WXIRYBZqevUozZcjkJ/GPKsUpgBsDKCPYEM/2ILuv?=
 =?us-ascii?Q?sJZYMQgprtGoMnz1JXfYa790y+TgN6e3HIIA2/W8PvTNGTulryZ+NpZMVNw5?=
 =?us-ascii?Q?qsIykX8LfrSH6yCHXgHqIfe7NRPugPP4JgU7g5RRiO1sgYfYtFc5XyFkL6RL?=
 =?us-ascii?Q?3XtspRtu9ForjMqWHiuaLbzrLdJdUvKAmAxZoFzkTWdjytXJOMSphImszhfA?=
 =?us-ascii?Q?ZT/TGqlE9CiluaY6/0jsjRva5736Jh2ttR3kTAoAobSLW/vb4QQkuYs71s5F?=
 =?us-ascii?Q?JVv+5mag0y4GCU13z4YaWQD17mMU78A5fwpo7ahq3aoaSKnlZWhhuveWNs3N?=
 =?us-ascii?Q?IyIxAz6E1FnpMXmHMxlu81PyeuAN1WuSxhYIN3qvchNQ9yZBFnrg8LTS5jL5?=
 =?us-ascii?Q?WjomTvcFty+JFIqkFeC0Ql7PFIu49PQJ3CfGOOrSEUfD+exdKNn25UpVJ5MB?=
 =?us-ascii?Q?5/KgQM6FzjRqIWrDYgl49QmwP5alEUvfBiTzhlXbhp00XOWuEQiy4FEAaQFw?=
 =?us-ascii?Q?mnwlQVOuf1zDiTPHx/MXfliKJcw/ijZ6gDsRWNZJucCeJNZgcrv8M4AHj/HU?=
 =?us-ascii?Q?IyB/VEfFlOps37y1n2dBrEBpDotP7BGQoIYzzxY6XQ6TvV0wJze9JEzLMl9p?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3901a976-c031-4b18-9f90-08dd00316a36
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:10:39.5034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GlTXIwb1QnxIxx3a6w4/O80n/KojO08pPUn6LI43vfYJ3BbCgizhw++tCdw2hxpyXDQ3i4HXn/93mNLvlO7rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Fri, Nov 08, 2024 at 04:59:32PM +0100, Francois Dugast wrote:
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_vm_create_ioctl() so that more code
> paths are tested, such as error handling and unwinding.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 55 ++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 87e567a54..eb80f6af8 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -17,6 +17,8 @@
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO			-ENOMEM
>  
> @@ -154,13 +156,47 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> +static int
> +simple_vm_create(int fd, unsigned int flags)
> +{
> +	struct drm_xe_vm_create create = {
> +		.flags = flags,
> +	};
> +
> +	return igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +}
> +
> +/**
> + * SUBTEST: vm-create-fail-%s
> + * Description: inject an error in function %arg[1] used in vm create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_pt_create:		xe_pt_create
> + * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
> + * @xe_vm_create_scratch:	xe_vm_create_scratch
> + */
> +static void
> +vm_create_fail(int fd, const char function_name[], unsigned int flags)
> +{
> +	igt_assert_eq(simple_vm_create(fd, flags), 0);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(simple_vm_create(fd, flags) != 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(simple_vm_create(fd, flags), 0);
> +}
> +
>  igt_main
>  {
>  	int fd;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
> -	} probe_function_sections[] = {
> +		unsigned int flags;
> +	} probe_fail_functions[] = {
>  		{ "wait_for_lmem_ready" },
>  		{ "xe_device_create" },
>  		{ "xe_ggtt_init_early" },
> @@ -176,16 +212,29 @@ igt_main
>  		{ "xe_sriov_init" },
>  		{ }
>  	};
> +	const struct section vm_create_fail_functions[] = {
> +		{ "xe_pt_create", 0 },
> +		{ "xe_exec_queue_create_bind", 0 },
> +		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> +	}
> +
> +	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> +		igt_subtest_f("vm-create-fail-%s", s->name)
> +			vm_create_fail(fd, s->name, s->flags);
> +
> +	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
>  
> -	for (const struct section *s = probe_function_sections; s->name; s++)
> +	for (const struct section *s = probe_fail_functions; s->name; s++)
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
> @@ -193,4 +242,6 @@ igt_main
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>  	}
> +
> +
>  }
> -- 
> 2.43.0
> 
