Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2405109C04F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 17:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6789DFF;
	Wed, 25 Mar 2026 17:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAp2m0iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54E389DFF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774460617; x=1805996617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LN6fsRE3aBj8c8FVFvqZr1OH9B3YtZeGSvHfRh3UomA=;
 b=DAp2m0iJIUnEijULR4UYdoUdkhlqoJ8IkuWeBkZT/bL/zB4/VenrMuqL
 TqjN9A8OKwsx235Oh9PfEe7lyzeH7ubl9YA1q3BrsGVyUCfWlM5ww+CCV
 5TrhTIBo3B7c4BWJlVy59mS5riXrkNomQsU2Pra/vB+PZreoXS/RMOBwI
 nu4LFJNxE0uDWn1mvv2+fgy30ZhmKx6Va6vZD7H3UBEfN9lmMsbwl8Sc3
 MpcnQ5uHqPW24iQCnaUN4SJVsfxwzLnGu53/hg4iDL9CMZ6LPMBvNe71E
 SVBm6zDnieaI4baz8/avp2MB4xJdzMi9lejx7W1BFzjmVijZjHCCCiTAF Q==;
X-CSE-ConnectionGUID: BpsSYrSYSCuHx6Knlooaxg==
X-CSE-MsgGUID: uZbirgl+TJyBnO4P+lKYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75223460"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75223460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:43:37 -0700
X-CSE-ConnectionGUID: cT0I7NA0QWWpOZ+9gYdvww==
X-CSE-MsgGUID: HGoPMJNTRWWtVcvFOTec8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229688457"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:43:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:43:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 10:43:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNsG5pLGrZ17DTCpITcuf6Z6y0fYnxkp+8eQUICw+BdCpkByo2FZX/Y9IwSGsfEy/PaXaUhpUdGCA9PPpgrgG+F/Kto8Co5L7hkhijm8nt9FeEdwbt/A/iG5KAotU6sG5w9HrclKqi4z00+Oatc+ptwWEAkEPnHSQtW+xPH/DLZaLsd+X8CZKDEOLY6ZIEy+DO9ehVOvcipy2mdctOvNMsc0BjKSZgXxa6MGFeY/Zy2N/lb+zNxxHJnkLn8+FCkL+QL6wT30ux+APe+9AbSfFS3YAjIMFlWu6RwAA6faFgtSeBv49sJdCVSdW+LOpQ2/EFO+1JgYWOTfNBpthibgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOiK3svooxdTKJGxnPNYVtnKDcG/W/CIt+07oxeGx4M=;
 b=EAerYmQr1UswnPjiqohq+Jn1rGu76mG+2fb++RhrjHj6g9+7yg8qIMq+mbdzHFIPt39rNpObkZ/nMSPjGYOLDmvLR/vihDeNhZOr2BOfw/AKrbee3tlgKpZO6ePKoW7M8bC+gUC2oIZ0XeJ5a6ASuq6PUkLdBqlmbbBs/3orgvUGWkeBYXeHV7qiK8xb6QkoSWklH6G0MBQ5XMpbUTdB4CwUHbD1hg+O31HKqdZ27pkcEsShuosBX5ocRP4yw5W86ELL5jCEwbJAMhXIcnekrmX6K0Va37k3VSfbLHNAEEAi6+WOh4suMmQxCg2DKF+88wHxXtF50k/InjkbAL7E+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DS0PR11MB8113.namprd11.prod.outlook.com
 (2603:10b6:8:127::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:43:29 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::3ce8:ebb3:2b7f:8719]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::3ce8:ebb3:2b7f:8719%7]) with mapi id 15.20.9723.008; Wed, 25 Mar 2026
 17:43:29 +0000
Date: Wed, 25 Mar 2026 10:43:26 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_debugfs: Add subtest for reg_sr
 programming failures
Message-ID: <20260325174326.GA22745@msatwood-mobl>
References: <20260324-reg_sr_check-v2-1-7206032f6b26@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260324-reg_sr_check-v2-1-7206032f6b26@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b76e77-988c-4f46-6e4b-08de8a960644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: VESjv5tx6+WjpCj42D/yhP2csWIJVjlZwM7DyKQtrF43mP2bQL9uknw7Kv5X+0bqRc9xYXy8pzD2rHWqc+P76Y3AiaMYoHTa95GHeL17TYcgMJk0GH+MQQEfC5MrO4y9fYjgmR++d2o13HxiAjaWonwsxxDTMbJCCdxr8WCjCeXnzHcg3jQZhHKq5xx4Xw4bovf7uprEJB8nLkDhU5fH3R9o0Y0NdcndnInAQX5NU9Q9Yg40scSyYHtdEVyiOsEc6JVC4+Uw/cBR/8hmm76tUUgxA3XS2Xt4DMbCWuDnLI6XtDTP0Y5ybEZeFKS18q53oWVntgwjj0K4RllI97WM5QCpHTUyVy/qcJKvMm0RaXIGbJBTR92+nmYZ3kaDha8/mdbD1Tai/RZviAdbv6DHhKKicXBL2QBFbgQHqAjLrOucyEU6M6rHFwLnRb+ghg9gJFimhJpojBdkA7rjREcD0T8jJt5pLli1nbStW519+0KZn7cjfXAJc5YQPC0UID9FQX59q8PATuBiAYW4W/xSkmtIjoF1Z+69rMbEAeJM0Jlw5CLf4HSBIilz6am3JY8bDuCeK3upn0Jc+Eu8xIY43M3f+zaM9xbMqjRwmy8hGScssdrmg0VB6YLInORQQgUY+jw0yQL782oEEStH8Ky+LxfhQSkh65XCXhQFg8Xro2fPIA0kWYIekfXpyzbI1/9274GBYYyF/DLLnUoFeIJC2wHpdtf99pbE7txCXF6BZNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/3tK5x2HGkVrQ9Ogi2uPfdqVTHebsDUbWskYWz/xmuKm4yVQx+vphCx6RSa?=
 =?us-ascii?Q?ifg7+6zsR07yaRVPjezDYwuHeARx4w3RdilGrio8Q1TZ3ydDH56eix5uQDID?=
 =?us-ascii?Q?onrJZoevq/ZtmGk39AaVpPqCt0mpxclgLr4jpe5GKo6P4oiaKrc1bVTy4ss6?=
 =?us-ascii?Q?9S8OmS0bXxCisT3k6by80A0feKvDCY0jmaiHgAX15AI3vi8q6gRuHIdp3jpg?=
 =?us-ascii?Q?XLmk4Nh+TpHtG/D0SDBd7P9h7cvh8RfE0PNb/dB6lPLUDblKoH5v0qcWGaa8?=
 =?us-ascii?Q?BLViTyR8GOGIxfZ3svk5bXTs2HV8IbfjmdgSJxpj9eBDjPzBBPh6wV95t8Ix?=
 =?us-ascii?Q?26kH3AIVhKbGYJUgTCY5/8Wf4u181xI7m3DOK8YLM+xHv+/W/kMwTL492bPV?=
 =?us-ascii?Q?zAe0Ie/7DZgMHWgqP+dsto6qhiUREercdb7Krd8uBHd8C23qkkgEkWdo/rao?=
 =?us-ascii?Q?VicNUMyl0U7YnrFDJxQXH/BmFkJVEIuFOnMv/iO8NI6bo8U+5JyxC4cT24pQ?=
 =?us-ascii?Q?SNK8KZnYmIgd1slK8nKyj7KdN93Fed/hmCOblVC3wURV+MzTFvL1pzOesZeD?=
 =?us-ascii?Q?P8fn1j7gj1uqOxkIar5nvLJ+PbDWcNf8SRBgeWt9MRXjQOtXW0GYOlpBqP2F?=
 =?us-ascii?Q?t7iRvHXXEdaR9LtdLmyQniVvBnIFQBHGTJ1nJ6OVgSRAeawDx2cNw6Pm/6BK?=
 =?us-ascii?Q?Hm7mzMM73id+oziKpttuduJJBx1esVf818TI7qZrxUM5gwg0movBARIW1h2v?=
 =?us-ascii?Q?n1dcHaYdRQbigys8BcbVMoeaEp2eKHxOzupLeAB6MGa2uppXg9ePRAZCvNu9?=
 =?us-ascii?Q?WP1TV7cBrGe+NG0Rl1hzc8MUOMDrAXgrKENz2Spy7i06+G3w+ibQu0NUSBvQ?=
 =?us-ascii?Q?bMUbeP/ubys8WDBl6D6WVUJB8r1lEkFWyWu+I6tit5+bS4OMUHq6SmEhTL19?=
 =?us-ascii?Q?JavRTTsrR0oBSIRfle/AfyScHhAXCcnnE/Wx5jiNj8VbqDgdcrC6cYj83JxI?=
 =?us-ascii?Q?+8eFPGRsYKQ1T7dkpKsGex61AGKIdp6vzMXK8ARJKPyz8cOZ1ujZD2QECN1C?=
 =?us-ascii?Q?g2dwQqACwqwcFLLIsuEQLzv3cOE6IWCpLLYVmlbaVaXXtkBKBPhfPndy1RuX?=
 =?us-ascii?Q?51mrIB5ZEGsSYQbfFdQNiuw+WwJXR78LpArJ1uDYqTnRz9UdODiPaYM0HbrM?=
 =?us-ascii?Q?ASZsXWBBVv6B7ydYqokTh2akLlO1R7PmVOCywce91z484MlxgtYeZ4q4xJ8n?=
 =?us-ascii?Q?1+duwKa2ObStqzc0SM1px/p2JeM6cPYJ/d6HFad0twRiTbmZm5kJpMgP9+eQ?=
 =?us-ascii?Q?m6bbKG9Yk702wEzQ+kJaps/gvQKpwiUmHUeTT87px1eHV2XeGCqoOiVVrPD/?=
 =?us-ascii?Q?7YEZn6t5EBD5oQsMhuVtQ3PTTHN+F6hj+9H/h59BiONwq4D1WtpWReOqnNSF?=
 =?us-ascii?Q?JVM5e5gbCivz7ikY4kpOCSU5w0UxDtvHTloGgC3qTWlap6a7yE0Q1A+Ya6KK?=
 =?us-ascii?Q?XQip3ho9JrTKEHX1JTvC5SLH5VxqTd8QZPKyXAVzyWm/bYKMzXCSBjfW07Yn?=
 =?us-ascii?Q?FFcn11ogNiQcGMzvuPLcIrYKf6kVk176wbA6a0xAqJm4Uy55DAJy5iV0MqJq?=
 =?us-ascii?Q?yx5FQBl90ykbXSs8NFUzkFUKr993KDWSVdOjMOhMJvvRyYgzGMo7OxBohJh/?=
 =?us-ascii?Q?TCCg1+v7h46C4ZdgF2mZcvSlAZk7CbEELaCogHI5yj7D0PdRNq6QxbBG2aJw?=
 =?us-ascii?Q?kAZFotgWVyB8RKWd9Nrf0c0m7xPVPus=3D?=
X-Exchange-RoutingPolicyChecked: qu6O4pYLBkaLTqalhL9y5Xoo9TjWQA8eapj2WyL0etw+vJl7MwJ4wMbif+bbUKEnxD+19gmCgODZX8iaX0OG2wuqk2NvzqNKQKwmCY3HcuyrxLK5havml/rBlHwjx8pRCd/xTGma+Zt1saWr1D4ozNaMtL2p4rpttXOwNNk+B9Vndq1BHLdMrZ2uVS/XX+51W8sr6s9ob4leF08RjjKWswvXfxDWB025zyW+wJcAulVqzBCrpb+ZaEyZrh6Yhk5wa4d4hvODLTTCCU8a5JCs+vE3HeB+ZuRNjVw/TcjRWZcKG84PxoIPfAoIvZqIbK5JspcGE7ISlnuMCXKRJ0r7cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b76e77-988c-4f46-6e4b-08de8a960644
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:43:28.9353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gixIMTEvYNZQT52qtWfIIRHtECRTFB46TTGJSmW333L5tj59p5g5OONFszcnl686XXaoJ8WIj9Qrzj3R6tK4eBOAOJtgmxShD85uG5/Tj8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

On Tue, Mar 24, 2026 at 02:11:16PM -0700, Matt Roper wrote:
> The kernel provides a 'register-save-restore-check' debugfs entry that
> allows developers to easily check and see whether any of the driver's
> 'register save/restore' (reg_sr) programming is no longer in effect.
> Wrap a simple IGT test around this debugfs entry so that CI can help
> flag any unexpected changes via a dedicated test.
> 
> Note that we're intentionally avoiding i915's approach of having the
> driver do immediate readback and verification of workaround/tuning
> programming.  That wound up being very problematic since any programming
> failure (even benign/expected failures) would show up as a problem on
> driver probe, and CI would treat that as a fatal error and refuse to run
> any other tests.
> 
> At the moment this test will already report gt0 failures on some Xe2
> platforms (specifically for workaround registers 0xb104, 0xb108, and
> 0xb158) --- this reflects a legitimate kernel bug that's been root
> caused to incorrect bspec documentation about MCR register steering
> (fortunately the bug only affects the register readback used for
> verification; the actual programming did indeed reach the hardware as
> expected in this case).  The fix for that failure will be implemented in
> the kernel once the necessary hardware documentation is available, at
> which point this test should start passing on those platforms.
> 
> At the moment there's an "exception" list containing one register
> (GUC_INTR_CHICKEN_GUC_REG) which is expected to show up in the debugfs
> entry.  This is a case where once the KMD completes its initial
> programming, ownership of the register transfers to an external agent
> (the GuC firmware) and further changes to its value are legitimate and
> not indicative of any hardware or software problem.  Other exceptions
> may show up in the future, either due to cases where ownership of a
> register transfers, or cases where reg_sr programming targets "write
> only" registers that are expected to not read back properly.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
> Changes in v2:
> - Moved subtest to xe_debugfs. (Kamil)
> - Add missing parameter to igt_info().
> - Link to v1: https://lore.kernel.org/r/20260318-reg_sr_check-v1-1-845d09d27bd1@intel.com
> ---
>  tests/intel/xe_debugfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 7fc4a3cbec4b925a40a37a18a5ebd256ba927e0f..587e3e785f6782317f4555035ca59dee060d82ef 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -28,6 +28,8 @@ struct {
>   * Feature: core
>   * Test category: uapi
>   *
> + * SUBTEST: check-gt-reg-sr
> + * Description: Check the reg_sr list associated with GTs for missing reg values
>   */
>  
>  IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
> @@ -365,6 +367,50 @@ static void test_info_read(struct xe_device *xe_dev)
>  
>  }
>  
> +/*
> + * A small number of reg_sr programming mismatches are expected and not
> + * indicative of hardware/software problems.
> + */
> +static const unsigned long reg_sr_exceptions[] = {
> +	/* GUC_INTR_CHICKEN_GUC_REG: GuC takes ownership after initial programming */
> +	0xC50C,
> +};
> +
> +static void check_gt_reg_sr(int fd, int gt)
> +{
> +	char buf[1024];
> +	int debugfs_fd;
> +	FILE *file;
> +	int problems = 0;
> +
> +	debugfs_fd = igt_debugfs_gt_open(fd, gt, "register-save-restore-check",
> +					 O_RDONLY);
> +	igt_require(debugfs_fd);
> +	file = fdopen(debugfs_fd, "r");
> +	while (fgets(buf, sizeof(buf), file) != NULL) {
> +		unsigned long offset = strtoul(buf, NULL, 16);
> +		bool ok = false;
> +
> +		for (int ex = 0; ex < ARRAY_SIZE(reg_sr_exceptions); ex++) {
> +			if (offset == reg_sr_exceptions[ex]) {
> +				igt_info("Mismatch on %#lx is not a problem\n", offset);
> +				ok = true;
> +				break;
> +			}
> +		}
> +
> +		if (!ok) {
> +			igt_warn("Mismatch on %#lx, Driver reports: %s", offset, buf);
> +			problems++;
> +		}
> +	}
> +
> +	fclose(file);
> +	close(debugfs_fd);
> +
> +	igt_assert_eq(problems, 0);
> +}
> +
>  const char *help_str =
>  	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>  
> @@ -390,7 +436,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	struct xe_device *xe_dev;
>  	unsigned int t;
> -	int fd = -1;
> +	int fd = -1, gt;
>  
>  	igt_fixture() {
>  		fd = drm_open_driver_master(DRIVER_XE);
> @@ -412,6 +458,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_describe("Check info debugfs devnode contents.");
>  	igt_subtest("info-read")
>  		test_info_read(xe_dev);
> +
> +	igt_subtest_with_dynamic("check-gt-reg-sr")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt%d", gt)
> +				check_gt_reg_sr(fd, gt);
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> 
> ---
> base-commit: 4c8773922f643932cc017ba94d164d2b9d3dd546
> change-id: 20260312-reg_sr_check-95efc4248b54
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 
