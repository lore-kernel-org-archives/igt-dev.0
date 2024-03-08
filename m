Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DD3C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 22:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952FA112C9D;
	Fri,  8 Mar 2024 22:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDiFecge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B2E112C9D
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 22:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709936422; x=1741472422;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hPdjUUaKy6BehlmpHweR/ZLwiayIDng6CvXG3j45w4Y=;
 b=HDiFecge+z7c8bcY/wTeeLuw3c0oso/sZ69FS/2lberOMxaJcyBlH74B
 WI5gfEDyOV0UzVLfxi++nbLqDhSw07mz+P4XgTj1zsTSV4Iw0VUMjiCMX
 eDvW/0K1xd/kyln4ftnpdGu52NRVCAxWUNto+VBVXaKg79hgAC0ugkdKg
 xtienwfi1q6bfeYu1+CT5GiyEDw3+wI3Qe2HR1FUTMMEVyWjm9Et/RIuI
 HIcyeLp0E4oHzyGv41TM6buCm4mQXPApjgfAqhcRcuy2WFGT2NAYrNR6O
 tfZzTnNNy4wEZoTh3LpTQlDyhEYnPrf5e1WBXJg5PiJy2KU31eCBvx50x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="8427301"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="8427301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 14:20:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="11026635"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 14:20:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 14:20:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 14:20:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 14:20:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 14:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niU98QITrG2rDQohdJTLCN7BRXANB3Bn6yKACotOE1kZuK2JtQxVKZl8RoTsILivGy6xFonVQVsAAhbngULH0Cx59HJsq9gKPOGtwgWGyM5NgIrvN0+9vugLrMkU3DV4VSRS2JjkB5ruxHSHbET5J4HOxCQMvNYnRrTCpoYmLLnR89Hk00drzIG55Mo8H4UofhCIWHkf0V6bFnkGC4h2KTOnqmR3+ySZob1bzYMNf1pdTklLGQv/AjSNUCLdPBmjz6OP01ohiJ+rzmrL1h0yRILi9WZOFbYnQUQj/4dSYE4lfXuLkIwI+iBoYld9SIFC409+seycePUTWGu6CmWR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm8pAX/EScAF5QOo8jlG5YLN5Gv0ealwj4tceysh+GA=;
 b=W2Ku2Mk77CKMgufFgMDUFp8+RTEDUIvEZQvAVBoC/l7ZxDKS8UYJcyWI4GVBBggJIq2V3onVP08NNfrtVvlHNhx7qT19ZpPtSZOBePMgf+Kg08HqRy4Ycbhn9Jwdxrjz25xrhx6SQkK26oh0Je7IQ6nSHcMth/sH6+fculNcp7Mu3a9Xuip5SqetlHpZfrHOLbNtEPL3Elj0rgC999cSQ7Nv5Z8MzOKOrcm3FG8CNfyaxbLIslt6H7qYd7QyLY+KcNp2pPSFivRTq/8sB4q++LozRYFlQNhpQy5aZ3edcllGONiuXg0VcJ65w06LkjKVSWmhkco+yzZn2Dk1dJ0DDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 22:20:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 22:20:14 +0000
Date: Fri, 8 Mar 2024 17:20:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [RFC] lib/igt_kmod: remove devcoredump before a PCI module unload
Message-ID: <ZeuPGiQSoh-TxgD_@intel.com>
References: <20240130223702.50769-1-rodrigo.vivi@intel.com>
 <eeldbmdvytrzcgvzxr7sf7ja5hdtspcnkxwveoniykwppixqpv@2ksbzzudvnis>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeldbmdvytrzcgvzxr7sf7ja5hdtspcnkxwveoniykwppixqpv@2ksbzzudvnis>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: bfac728d-254f-4bce-c39f-08dc3fbded12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mfj8j1BxWoiUSMXGF6JxeaU61yY90Dh2GycSyxr4gptHUsNLDDLw8r28r0kOSSSpoH8bTiCwLn+6L48hM3ZTvvSlHnd70WNtY0gbB8HC/JS82tdbpA3VDDAsq1fmGmRfQonJ5xd5XAmD1vrwYVU2f2zdqZtM42b2UWJpfvyseJlh4bL1tSpxxPelYRHZvmdQN831v9r+NsxvSVcvcXsdNdiJC0Q+TTnZHpsaA4mphZbrKEQFWRAlUvIPEII+YYi8gTiAaidT0mFSi7L2WWqsFM3QLkcD3FqO2cVnA1Q/PFJV3jme1687dfRPwrB9TbxCWpwS4juBI+vA2mpY0HG6yCgQ3LlIbFEfADof6Ly0L+VsSkUk8puS+NFvzp0Pgaqkp9zQupZrSNUtv0dIRAlF/b6+ZrwW1IhGFbgBt8WwYzE/qXJbXQbvvyhgwtKrBGyXDyWqLn1LZaD55ti8Vy1yWtROpeO+9rI31Jt+jFrNsyiVQIG390kwlzWtkibGjCCVlV3n9stmFH5+zKyZ/u5n8CLJe20S8DHVvc8YgsH0LBCNOlQXmTf/y4vxuMksFtH8s6imQXKasZh0m2XwsqQyqcEQVP+HIr6HYgck1oeUg3lzNzHPtBQmVcHY1iEUyA3NcBv9NWQQ5O5awN9lPtK/yO4RWp626quIlitYO5w6E6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?msEG4fcMNMblvMhok6EzUCfZfBBc8tVGUKUDaN3dw0lUiVgkwehrjLxN6O?=
 =?iso-8859-1?Q?KJlXfxzSwcYrAHNSKWNCQ9rVCvQayk0LsLKrYtvzAHhLMLJ7J3y3ocsd5E?=
 =?iso-8859-1?Q?+X0GyoxdcmEBdTL90t67LT/Cu8ov/gQUM/YBqkNK2GB6otAFf293/azoOj?=
 =?iso-8859-1?Q?xmshQC98l0r/By0px/9nTNB0aLnWucpR3Xj7qEmAAGXNuo9jQGNL+0tL74?=
 =?iso-8859-1?Q?ruzeUEaWXApJdAtZiZITtuQ7e1i4nZ2DTjCVbZY2y8yWFc7y5PlMIoTXir?=
 =?iso-8859-1?Q?sgFMu1dhqb0o87K2pcVlHx3K8Y0nAYHKo/I6jpNk84EGhOLaiBYH0qNVfn?=
 =?iso-8859-1?Q?4QjVdcjOaTDxGYvyXBufaV6eVy40wRsaaSvAiHd05bOjKzdUUcUaeSBpKN?=
 =?iso-8859-1?Q?GSy/t+JtNegP09h/DCCbteqDaAVUW+Zo2Qqh7Q1oOJ+uqjOD/cMm6iD0OS?=
 =?iso-8859-1?Q?KeVYVmS1P7/uLi7NOCF3FVmL6Mk0sLabPbMlsIBe9gN7YWoXIJ3axf72sW?=
 =?iso-8859-1?Q?ByFgnPDwtOyzu5+BRToHsjgOhU10D66O6JZMjy2SyHAD8ppnihliFUnw9e?=
 =?iso-8859-1?Q?BTB77iWORG63sCbz6eTGTYEQt/U4ATR7d0XTnYucVyG47zie08U3OMD8Ic?=
 =?iso-8859-1?Q?fkwgH23gzoWYF8jWjCtE3fkmg9djZ2dITaaLxs58YEk19vgeRuogBtrnjj?=
 =?iso-8859-1?Q?wn2G7loibmCk8ToD1FYFo5/rXESOJsqmwiVAJMz6ZSiULRe+Ahul6h+oRm?=
 =?iso-8859-1?Q?9BToKRkoiTpXbMVwuIarzGbX526qJ6qHWLk/FYHFhjLEntfxAXwvnc7mcK?=
 =?iso-8859-1?Q?AYSrstYIO1C08juGR9hRh6VdQl5ob2BY6YpaT0J/priaMWP5AB6hn3lETC?=
 =?iso-8859-1?Q?UoZBRpViuRFu51HSr+BRxYvBJuToM5SFrFZNNmFgo4+5P8HgbKXNg63Dib?=
 =?iso-8859-1?Q?EFLmjsz2QFRoJN6pfAPqjtjbnLxe8TbGYic144Z6sJP75+8cCAKfEjXIoB?=
 =?iso-8859-1?Q?6d7i8JVfSQTFjT34WvfqYj/BGGmXbNLn4Q7WMvEDxy38ovakXYn+YI2Rpk?=
 =?iso-8859-1?Q?11rDbqDlf0MHy3knmlk53712em8brubij1UzEkCzMc2a2c9DkrKVARAkHN?=
 =?iso-8859-1?Q?8WPY3LyhJCccxZm32QF6ymLdrwWc5vxfv1b9i+33wyMINPojaqIPETq/d4?=
 =?iso-8859-1?Q?BJWd0hpUnEOQ4WZKFe99/ayrE48Dx51S9JAbWYPs5SHmKQR8EvMIMH5MbI?=
 =?iso-8859-1?Q?onMYm1Ao9Xl2M3nI1o0kGDZJmoqVcMBeNS8etT8eeuMP1kl0uZn8gDdVte?=
 =?iso-8859-1?Q?X4GBmxFyNzq7v+sIS5kB98OhMO9RAgIPZ8YZMlp0wp9rq2aWmp229qhPZi?=
 =?iso-8859-1?Q?XdRRZ3nzz1pdaYRGHBNcz68puo+a51QrGrU8+yw2xDERMSD0EvK1zk/ZuP?=
 =?iso-8859-1?Q?DKr0LeVwpZ2DgHYqa+1hupTMA9nCcnSF2Xmq9bHkYGJNAsPiS98jOrHULQ?=
 =?iso-8859-1?Q?9POVwoxn07cgSALHz3hdIpmNYaxCU9B3aWwDKp2Qx4arUj6JLsPNPaFrr/?=
 =?iso-8859-1?Q?bgz6BO1TAPmWS2nGYDtOfld6LRcirYrTG6jSgd+buD8ji4KJRIczgsdk+a?=
 =?iso-8859-1?Q?spxc/IBPfs/SOEx+d1UyAlLtqYaeEJcj5SMo7UiM8U1dnFQgpg5WNncA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac728d-254f-4bce-c39f-08dc3fbded12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 22:20:14.0722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBLSZKJPr/6lSJbEHZPIxvX2gvZkeKZh/Wft2SZ4TeeKrNQ9MpFQOS8PYvvPGFQPGsiZEIhFuOtS+rH86vMZFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

On Thu, Feb 01, 2024 at 05:14:58PM -0600, Lucas De Marchi wrote:
> On Tue, Jan 30, 2024 at 05:37:02PM -0500, Rodrigo Vivi wrote:
> > devcoredump holds a module reference, blocking the module removal.
> > 
> > It is intentional from the devcoredump perspective to keep the
> > log available even after the unbind/unprobe. However it blocks
> > our module removal here.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > lib/igt_kmod.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 54 insertions(+)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 250ab2107..da44a7bca 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -323,6 +323,58 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
> > 	return err;
> > }
> > 
> > +#define MAX_PATH 256
> 
> just use PATH_MAX? it's more than this and should be sufficient for
> these sysfs paths
> 
> > +
> > +static void _igt_remove_devcoredump(const char *driver)
> > +{
> > +	char sysfspath[MAX_PATH];
> > +	DIR *dir;
> > +	char devcoredump[MAX_PATH];
> > +	FILE *data;
> > +	struct dirent *entry;
> > +
> > +	snprintf(sysfspath, sizeof(sysfspath),
> > +		 "/sys/module/%s/drivers/pci:%s/", driver, driver);
> 
> "/sys/bus/pci/drivers/%s", driver
> 
> I´d also save the return value so you can 1) check if it was truncated,
> 2) do something like  `char *entry = sysfspath + len`,
> so you don't have to keep printing the prefix below.
> 
> > +
> > +	/* Not a PCI module */
> > +	if(access(sysfspath, F_OK) == -1)
> > +		return;
> 
> coding style
> 
> > +
> > +	dir = opendir(sysfspath);
> > +	igt_assert(dir);
> > +
> > +	while ((entry = readdir(dir)) != NULL) {
> > +		if (entry->d_type == DT_LNK && strcmp(entry->d_name, ".") != 0
> > +		    && strcmp(entry->d_name, "..") != 0) {
> 
> invert the comparison and do a "continue;" ? It would drop the indent a
> little bit.
> 
> > +
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wformat-truncation"
> > +			snprintf(devcoredump, sizeof(devcoredump),
> > +				 "%s/%s/devcoredump", sysfspath, entry->d_name);
> > +#pragma GCC diagnostic pop
> 
> instead of ignoring the truncation, simply check the return? As per
> above you could do:
> 
> 	ret = snprintf(entry, sizeof(sysfspath) - prefixlen,
> 		       "/%s/devcoredump", entry->d_name);
> 
> then check ret <  sizeof(sysfspath) - prefixlen
> 
> if you follow this, then you should use sysfspath everywhere below
> rather than devcoredump.
> 
> > +
> > +			igt_info("%s\n", devcoredump);
> > +
> > +			if (access(devcoredump, F_OK) != -1) {
> > +				igt_info("Removing devcoredump before module unload: %s\n",
> > +					 devcoredump);
> > +
> > +				strcat(devcoredump, "/data");
> 
> could we just do that above and check if we have a devcoredump/data?
> 
> 
> I'd reword the commit message to say "drop" instead of remove. The
> reason I came here to review was that you had
> "igt_kmod: remove devcoredump ..." and I thought you were talking about a
> **module** called devcoredump.
> 
> 
> > +				data = fopen(devcoredump, "w");
> > +				igt_assert(data);
> > +
> > +				/*
> > +				 * Write anything to devcoredump/data to
> > +				 * force its deletion
> > +				 */
> > +				fprintf(data, "1\n");
> > +				fclose(data);
> > +			}
> > +		}
> > +	}
> > +	closedir(dir);
> > +}
> > +
> > /**
> >  * igt_kmod_unload:
> >  * @mod_name: Module name.
> > @@ -341,6 +393,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
> > 	struct kmod_module *kmod;
> > 	int err;
> > 
> > +	_igt_remove_devcoredump(mod_name);
> 
> what's the _ for? Also as I said above please s/remove/drop/
> 
> However I wonder if we shouldn't **dump** and make it available as
> output, just like we save the dmesg.

all the suggestions above accepted, except the dump here.
dmesg dump is at the runner/executor.

We might need to collect that there or add the udev rule, but
I believe it is orthogonal to the goal of this patch that is
to unblock the module reload/unload after a hang has happened.

Thank you so much for all the suggestions.

> 
> Lucas De Marchi
