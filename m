Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A5C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 17:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C487110E8C8;
	Mon, 13 May 2024 17:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e792oUOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8810E8C8
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620873; x=1747156873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/nJiOZRZSlEN6pe7s+qu9YXe0BuDLx5PoZkyTWR/P4U=;
 b=e792oUOWpeuWEV5rH45XvsXMIa4Dj6pp6VVGF+6b8+hki5yxll+w8CnC
 rPkQfjxjxH9zZEZrupmrDnbrSkfeJ40b/MFu+Odise91hCXSk7ZK2Q8aO
 +d3OrhqDpnUTfa6w1zu5VFx/OMUtDqsC47ciXXYn/l4dfZwbZFMPLSBYt
 Mpk2/seIVW66PxwQXv7PCDyJC43wb6e3XJv0YecT+xvMyuBR3PKyBwJV8
 gCvCEL/00sNzveIeke8bzRQC8PagJA7npJMlT81dKOUonhzFqamIQ9ioC
 tLfaC7Mw3RZd6EhoGH6RgnFq/nPiZlEq7n5U1CcT56NAGOYzMmWCMKRoO g==;
X-CSE-ConnectionGUID: n5MbFdIJRxizg9qJyvmhIA==
X-CSE-MsgGUID: PM5r2bXES4Oc4zLUssvHiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11400682"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11400682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:21:13 -0700
X-CSE-ConnectionGUID: pe3f0SsBTquzcAghfrVeSg==
X-CSE-MsgGUID: GXfvW12TTfGZWT92qK3sHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30443611"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:21:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:21:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 10:21:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 10:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoQkMnfg/xw8fKIlpy+69SIAKgIcm7HKT+T+WnEmn5tDzvky8FpZvHn4US8N5uK8HB4Vm2lSJ5LZAJDAZV4d+Sixqmc4hgWtQpRooqcAITEN80XqejTU+8ppz6s5Or/RZQRBcNA7ZNzyJa49xwSed6iTLD8FVBExeNS7YQKknxIvnYX6FduaMUx4x88okGoTv49z1H7MEl/+EGFAA+SQna/cxDR8qOov9ulvkXhPP+vyEPuzZwXp131RrpXWd9avXor6jYLC9Aqh09g44ZWND3rasDia3rkPCzI4KP9PufMMbGKnJ4bxrkarWJu0RWPWVDq+xK1gaaJVzpx3rigUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRxOuSeGhNyFBcEVcgd2kk7ATq5yvT288F6FOIbROJ4=;
 b=KSdtGevf4NshgOrhKzkqJD+NeQxW0buPxM4mfPag0HHEugy/Ch5bZTWh3NGnx/vFJB9FMQif61iWSMFvakw0tN7SxrfCeePUdMj3x+Fh+9Ji6t2oGoStB05blNAyRd13Fg9tzlzNrWapxCMb44xsIoDD6P1Ngl1hZMFhLiDKAu0SdJe85Hrl9HIxelYXawSWTjtHHfjBW7mdWpBUFUyJ971l/898zqNC1EXSovtwQ2AuDtvN1hglbVv0yYP+3pZgLW1sPR/6p+yMKYSRhnvWq+T44ElAn/WdGpS9WPPN+fyx7oxml4nDh4Ck2tVUkjRaGrjEFlKdMfsWG79Uw1U5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Mon, 13 May
 2024 17:21:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:21:07 +0000
Date: Mon, 13 May 2024 13:21:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Rename and clarify
 mocs_suspend_resume
Message-ID: <ZkJL_kP6GuOqVXe2@intel.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5682debf-af2a-41e4-167d-08dc7371134a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b1ltoGh5U3n5APQA+nde2QrDw2e8eEVgd2IlNr63qiIVDs4bziP14AckFam+?=
 =?us-ascii?Q?1zGSrsa1NH2jVy11pA/7Xt82J1LU+Y4GqDYDXXq4cNPrYSLLmdSMDCb4b/3z?=
 =?us-ascii?Q?dltmKl03OVTd24W46N98Ve5J7obo3dkCCIxSrQ2FE0uKivBJ6ASo33mFVbOH?=
 =?us-ascii?Q?DezEL/Kxc84RKAWUs8EtE6ofn7awet8C2JY6gk/Od9R1E1pZwqDCkNkXhXyz?=
 =?us-ascii?Q?Rbxj64CKaJKTAOQz4rTHPE0mkO4K5mvcFd6XtZsRvyq9RjETFIPWJnde7kxb?=
 =?us-ascii?Q?VCW8UunewI2GngpeCUG1t8c/gQ9fHxfJT4DRaKUV7vEF+utImyunICqRhH5Z?=
 =?us-ascii?Q?TCQFyV5mT+sL7smbSMwJwBJsnNhwH5w7meoPYdh3S2dLxtZAo0kTbsal1SEE?=
 =?us-ascii?Q?pRQrdIE8qSfVe1Kj4KipSwPCK4afv6NrVCTHeFBm65QTIpo2YPs1e4KTGNjF?=
 =?us-ascii?Q?AZi7umpA1P7bvoYVv9kx6aDJqPK1YUMj4Cv/zwyfemUQPq+OUZK47zEUjb1l?=
 =?us-ascii?Q?Hjh/AJDs+bZk53WxD5SEmXq9Dhlx8jj3IGi/2VnFwJXAUayPy4CaCa3/bGS8?=
 =?us-ascii?Q?FUeenSyQW+uJsuXWmucmfo9lAapuOK5aDfW2wyWF95KtMcJKNGV5JboFzpUp?=
 =?us-ascii?Q?6jWe2pa4j+cBcwcHmvaHuabjZt01kU7j/8sHsp7NqfZcZK1ffYFb8BKRJfu5?=
 =?us-ascii?Q?npd29X4cj0noArTI1pbhbYyDiLI24EJi8Guev3TmMd/XfPWHMFm0C+6InGmG?=
 =?us-ascii?Q?jaU5Xc3fzQWmqHvCjvBpKr4JWrbblB2znU1tC30P2EYY8BBGgs1ShHuJos9R?=
 =?us-ascii?Q?4mF7Ipt+glc0QUfEvG8BljRJ5I/8MZdqINvqzlcj0zj0yC7xtEQUNX2kh1il?=
 =?us-ascii?Q?IeRyXZsnrwTEQuv3uHGdbUCYMGCZA2+ZKFo0Vd3Q/j8pyinELSV8NCzBnKBn?=
 =?us-ascii?Q?hXJw978uD2IcK/dJ55rMu5b8Di5Q4WLhIkMjE52TYsFLcbERMbzgy3iYSaSu?=
 =?us-ascii?Q?SayALg07bCnD5crJBCLzf82Msqw7iGhMMVV5mjYmQRfsUp8addIDJzHoa4s/?=
 =?us-ascii?Q?GkEqvpr3JHFftNnBLeyeRyj9kjttbAin7ZD/pmi/uh8SEqjIR12Z37qPTxsO?=
 =?us-ascii?Q?HVIDQrnsxc7HGp+iPAafIRZZxwXRKH2H1HafNY/+2QAZbVu7cVyNOuX9en7g?=
 =?us-ascii?Q?RdUBrHnz3ue7Mn9dD/wUAfkYIGEkWEcB0pU8LM+GBLvzKQlarXYRl9iO/Gq3?=
 =?us-ascii?Q?z8BPXMaqoMusLyjyCGhUMzjX+Py1yJN4ThWJsQcoBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJpV305RGje5rmPlz5M6hKdFm9h6940/e6EIabpiK/Aju85bLhREgwv9+5Hz?=
 =?us-ascii?Q?1dByF73VmwXvCvd+5nH1ESMaQIGhFn2h1wT9TAjVSgdN7rs4VdYUfI7xgwVw?=
 =?us-ascii?Q?PRnygq84HfRd80IEVkOIKABzakXx1J65PUSbnWTm1n4bwkK9Os8hSRI4YtTY?=
 =?us-ascii?Q?WYTbUGwFxIEopHMWlakEOiEFLGrVQQHHeE43YNrxHQNvZ1VlSLmERyVPkoy0?=
 =?us-ascii?Q?uhxqHDI2YUqWPtTsCI8tGHzd8oqddr+1LC+DWhzG4X34MlBnGon6YM3D3z2c?=
 =?us-ascii?Q?bYau69zQxO2cuI8mH4xjrd4odc8Mc2Dtv14G+u1jXpC/284rD9STATdSKszW?=
 =?us-ascii?Q?+eDp1wNMhUSYgMGu+PLXrwCqorCxMeiSoqnF9zAIr0hbmxOjH0gG3Apyf2O+?=
 =?us-ascii?Q?cyRvG9rsJvJ26q5a20IKZ2TbU2+Onw4aNlzLY6n3ZE3Y0h6EAxuhnA4/lHHZ?=
 =?us-ascii?Q?bA9zc2hS/mXjn0jLV+bJ5GfwqIcN1T9zdpp222mX8arDddTebe4t7WnoRpaM?=
 =?us-ascii?Q?YjXPDQpyvLk3qLqeNCGBMJPLXQPda+XW8oFk/MaECIQSixkjO668tKDyiYxx?=
 =?us-ascii?Q?Wrfeepg4DFZzcM6yFNXfQpqdF1vwv3H//Ju2N3HbwXcuklpFMGG2Hoapsxjo?=
 =?us-ascii?Q?/wEiE659HoB0QbR1qik9sSw8NYIW7izTrvi12dCylh8qbE16BW47v/+AbXZ4?=
 =?us-ascii?Q?AHKZrwYwx9I753uDepCpuvxXftSkfwESkr/htCWLSde+08dImhAytSXg/OPx?=
 =?us-ascii?Q?PmThwXRp/rzm1ybTOoPNOzM7EJ6xXmS6cx4v3PryEhxhZ0LXnKpBzKzmWqWR?=
 =?us-ascii?Q?VYRf9110ws0XXiW6dCHE0ELexkqWkcyKLS5B0G6wA0sIw7cSPHc6CGgXAdZ3?=
 =?us-ascii?Q?/Bhr24y8zB8kQKlqKXLWA62ICmYWwOSqbvhXSrnt3/3QLLlElz3NvNapwE2J?=
 =?us-ascii?Q?mzQXfzHNoOQo+l5zIcEePEAgusE3Q2APK7SbcJhz1xnl4FbCV+1Jmcvf+qzp?=
 =?us-ascii?Q?kgU27dgYj8Tffr+iDCLjwHq8xFhDWtzCjadLJQsTxz6JueoA+i3Vh7yOBgKM?=
 =?us-ascii?Q?E6DX8O8CxbTJ0LjHNqawnE0tQv3eFjgMcxntCxcOtRd8e1NtHL+Y6bIzPv4i?=
 =?us-ascii?Q?zwmysloVCYzrCxefsG+Fa9So67tOG04sqxtjrYj/vKr3JmRhmQE2iCS7bdqN?=
 =?us-ascii?Q?Bw528akkNmDC70Ne7qIuSt+KtqSu+TNEENOppoQVOmZHTZ5FUySju/PUHgAi?=
 =?us-ascii?Q?FsfCtgDRvY1R9Ajfqwh/16tZY8X5hSuEIhMEG65aZt7zQ9IGZWQXhOcWOdCT?=
 =?us-ascii?Q?BDQQ70k5+K7vyItUWAZnjlxUpKow/LyIy+Dos2aPmRTeh1ur4FzPDkVTjmoF?=
 =?us-ascii?Q?KaFMhjqR8d62n6yYwTH/MDvbFho+/02cDNZ1b4MI/lrmJ1aWregwh3HEFfqa?=
 =?us-ascii?Q?wSXjc9L5obKYf6bwYyFDGaf7nEsX6A2jGwDBYNLB8uDNbfBgUAx0mNXZl8CQ?=
 =?us-ascii?Q?kFbI2v0Vp3/jgfklLtRx46BSFwjZDpQvAjRcyQnKb6ULVDIuhbk24USGNm62?=
 =?us-ascii?Q?9c20ZpHCbmMabz345zyKYL4PZeI4dd3O/2+enfGP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5682debf-af2a-41e4-167d-08dc7371134a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:21:07.7686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DV1FqSlrnrOFePi3cVp1hnFOfRCvZgX4W3e96+YUhEx8diN1TGmCFsH22e7uLYb1EZMV5pKN6JeY1fCE6Ud4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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

On Mon, May 13, 2024 at 09:24:32AM -0700, Lucas De Marchi wrote:
> mocs_suspend_resume is not really suspending/resuming the CPU. It's just
> checking rpm (GPU) goes back to suspended status after dropping the
> forcewake.
> 
> Also drop the additional argument and just use the same "s_state",
> passing NO_SUSPEND in this case, like it's done in other tests in xe_pm.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index e81a75d88..1215b5c2a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -617,14 +617,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  }
>  
>  /**
> - * SUBTEST: mocs_suspend_resume
> + * SUBTEST: mocs-rpm
>   * Description:
>   *     Validate mocs register contents over suspend resume
>   *
>   * Functionality: mocs
>   * Run type: FULL
>   */
> -static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
> +static void test_mocs_suspend_resume(device_t device, int s_state)
>  {
>  	int gt;
>  
> @@ -639,16 +639,16 @@ static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>  
> -		if (runtime_sr) {
> +		if (s_state == NO_SUSPEND) {
>  			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  			igt_assert(fw_handle >= 0);
>  			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
>  
> -			/* Runtime suspend  */
> +			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
>  			close(fw_handle);
>  			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  		} else {
> -			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
>  		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>  		igt_debugfs_dump(device.fd_xe, path);
> @@ -758,7 +758,7 @@ igt_main
>  		}
>  
>  		igt_subtest_f("%s-mocs", s->name)
> -			test_mocs_suspend_resume(device, 0, s->state);
> +			test_mocs_suspend_resume(device, s->state);
>  	}
>  
>  	for (const struct d_state *d = d_states; d->name; d++) {
> @@ -824,8 +824,8 @@ igt_main
>  			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>  		}
>  
> -		igt_subtest("mocs_suspend_resume")
> -			test_mocs_suspend_resume(device, 1, 0);
> +		igt_subtest("mocs-rpm")
> +			test_mocs_suspend_resume(device, NO_SUSPEND);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.43.0
> 
