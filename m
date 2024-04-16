Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0D8C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 20:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE4910EEDA;
	Tue, 16 Apr 2024 20:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APMPTvuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50410EEDA
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713301102; x=1744837102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Q3eEuQwB5Hb11q9eE0tOKTJVryTXdz2IkczP/YCs5A=;
 b=APMPTvuufZUGZULxaYSK+z96MOfLmea9xsqRIQpVTUC6C4BGzKhNCkQ6
 CtohkmReq05NcaX0/F7hTHY0TjZUC/6MG8kFSqXiN5zSmCAsjQBpziuIk
 HzVMJ92nqR56USWAs6Ekft4IN9c+mG8P4/Py4SuOJNheWx8cTQ0zoEoxm
 p3wKd7i69khJJ8/+VCUh2/MdQBUzDYwBumpQL5eVa+0KgLavaSvsabV9x
 jfUjIa1gCfvKsKa/yRoBI7bpcKzevO9N8jMrAcYRD8mzztqNrt47qtSZr
 1v6kv0YFCduwuuh+tVVMF1BHuNzTCDiLfSvdqqBLQU9JRDrtE9tDqaY6V g==;
X-CSE-ConnectionGUID: QMMOoDZaTrOJHLAFyghUoA==
X-CSE-MsgGUID: NuCIBzQWRle7XlO67yTYzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8937510"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8937510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 13:58:21 -0700
X-CSE-ConnectionGUID: klBFlaIdTr2Yxd/eO1Ie6w==
X-CSE-MsgGUID: IeIodQYnRnei7bKyEzwEbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22391266"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 13:58:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 13:58:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik7WXJUbJr0vDvFvcuusJZobwv/GoubiOEtV8M4wtl4eHR8eD1Fkk5MIV/8Q6KwBhb73pBBYs+osDmVhdeBpzogfpIpyjI1ohs2OGUvq27WE8JTkgQRhRoXM1LBLCSN9NFIBR2EJXQ4ifRyVd8JO0ImHhM/yfNqBqYTASlLvNgSdZOx6/FqAC7ScZCMauksXmEcTIeKlWiLAe24zeqMbA5Jslr+zf11w+lXKJT2bPxqfzmy59n9bhpXD2ujnGxZmE9ttq+i2nDzVek3LBwLZKBbLTA7prfuZw0f7xx0/B15RVdJBW2nvMHwpJVEzR8RenfydfEfTudrNoHziOXApUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDO32aCFHdTBuEunjYrkq5YlyxijTOeVzR3TIWZr+qY=;
 b=b4ocjzHawmh9jYUjZpJaORcB+Zb4lClGyo2j/aeo1M28IfuUsPAu15GWi6Kby0RNNHUKS7iB9BtMbzg43XHgui3+oTfGcDc6dvvjo6+oX3VLERvF0+xP2ner/om2AE12DQyFCTtiN56SiIyuk+RzP6trxMK4ZqkviJr36YYKFYzleglQ+tLIY9/rUE3B8chQ49W1jVE9UY3AxLq1qXT+4WOs9aW3ECG0tpMXDpBIDCnLQkn6GQzoANghPWAo5Tm6lAd+H2Udve4vfTM++w1hrrx+/HTos0+e+47CYbP22n9gh9ptseSjsdfqmNhKlIcEp0hi7x3vH59vo47L6LgFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:58:17 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 20:58:17 +0000
Date: Tue, 16 Apr 2024 16:58:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch
 flag with suspend and resume
Message-ID: <Zh7mYwrFhHQZYBbE@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
 <20240415084035.2603-3-sai.gowtham.ch@intel.com>
 <Zh3UlC5aunACNHKm@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zh3UlC5aunACNHKm@intel.com>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e822ffc-6e07-4761-8397-08dc5e57f0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLZVdmngah/b+C2RT/JDTluD0gQzfuOBNP2pAZIJMS4ga0vzHRc1nMXbRouZygwm9bWAxaReza9RJ9tGwtyXS4eDosxIEg9KJEnk1qUGpEjQ71OGnondAmxjiVjPYdrewrd7uGt117PauZw3nGDtxf1l9cA0o1Roj/sYO5S273xDmCxp1Kb0QkTDZAoTI+Dv630WHUSSDQMdFKboabQFZ2/G4nw2EUmM3I4VlNQOwRq7O62tAlt1207YaeQmbyPiC8YtA7DsnPogEbr+Obe2Cpc4W88wsKEEjJA9pX6c5aoUnkBYQnerjy4O0MN110hET4UXC0D5PcuNX/CtWOgpUXvggKa3ZuANdpMvAXRAtaJhMCUvALMlFLkFeGKU+LToxKAjLOZELjpyGguK/93uAS+ppxlSdz9H7k5NP8P09iIbnui2wEMtpq8cVf9qJN0wjxh5n4PT9KD6fOg4yLhrp1MhjApQr8bIRSFKYcB5D95wAAiq76H07RJKt0QhFTTV0HmdaJApH/leak/iFvMoJf3GKb8oCVadaJfvPdBkTGlf2/zApaC2kp63oJDFDMqs0/uVW+BXg7eE39HIrVoRvBau4YXFOLa6zn7dTl0ieddFiFi2YoQ1evJExjlstidWGyvKqW8BWqV10aTdwCi6YQ2EkZSCRUeDABz1AOLX5xA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAwaNHN0RgC4U4gAYiX2KjgL+RHtyqZ/AleKmuYp1OQJW+KDW0/aW+gEILWY?=
 =?us-ascii?Q?4QkL+zyKnx/LL+bdVPIPcKOzqCNGDxz/WeULWEWz8hPTgKJQ01tjeNo/B/DO?=
 =?us-ascii?Q?SgmU/6cW3rPgvSqTxpJZ2ZwUG57c2gDe/KaXFJX0cnDd3E7unjaFPYezoYKA?=
 =?us-ascii?Q?KnZkXwlKQmxaqrUkQXuq7IS0E+H1ehej+V0o+FJr7OmlV+VY3iS9HBe1JVbQ?=
 =?us-ascii?Q?o9HDIv1Dsq2b3y9IE/f8ewbOn7EefKiyxIsdq6r/sN+C8nA24a8CTdohDz3w?=
 =?us-ascii?Q?2pr78ezBxAvZbonKGjlAcPOLS2iNDvbV2jS+90oLl3DsF4Cux2F9JAS/2kMT?=
 =?us-ascii?Q?1AgQBRANjwJEIHVKJFQ3KlWSEexOAzpq5SkQFYR4p2IQXsAxD+zdb/AXmuSv?=
 =?us-ascii?Q?rrgY8Ojmg4kgKJI/oAh3Bk7NmJviAMtHF+vWWUtATr2wru8VJt1m+nDA7Twc?=
 =?us-ascii?Q?/yVdGU9/Ob1oSZugj1LJU6z/+tleOzKAzHqvSCI2iSMK+mE/zXt5eO84BzWa?=
 =?us-ascii?Q?FbVp3u08Bc95gbmgHDI2jqQ6O0sjQo4inlkTRiXHmfNNysQdQvfXAu/Z55xq?=
 =?us-ascii?Q?mNxPxksE3DWKry30TKOvdKskZNTBh5gnGCunolk50v7Je/l0gBrK9HMqGJNu?=
 =?us-ascii?Q?enRwwvxG4xLZahupkMLyXxsuZyaQ3WgQ18XSbM8CWbLHo5msqGkNG6/2CYYF?=
 =?us-ascii?Q?L+j8T/FZ0IJc0HZ8YwvI8HYsEolLvwkHki+12luDqmwsi+TqSDB5RVZd7FoF?=
 =?us-ascii?Q?vQd+ZjQTK8eAOeW6DLhTcMIdvWSDFvh6kuMYnJDjZFIcqnzD0FiJSPRcBZIr?=
 =?us-ascii?Q?xrKQpxfAFJrZ0NYyFA2/dmgxoH3joXMsNq+YoKIzslfUnGAtGzv07N3jqUof?=
 =?us-ascii?Q?Cw7SYyBsgYWoYaA9CB5SX5HL5MsKBlUNsu/mBaq9+AyCj2O2BGvsyPkSslMU?=
 =?us-ascii?Q?xmegiUae2n4/CPkoNtbRB9ZzEsOGAcXv6BwzqeZyaaGZ1F8h3wdilk+VoZmk?=
 =?us-ascii?Q?7jDc/l2hxxBhFlbLbGsWQY3mcdtD2NY9jBjML9F9vQlvU4bUU9NqgEip5/mY?=
 =?us-ascii?Q?0qoHxOhUuRNVRF1zTMXdXGPrFRScBYNxqS+TMFL3B/uQnplaAyui/FN5dJ8a?=
 =?us-ascii?Q?XziPD1qA99lehUib5L4rsXmuj6wIl/vB8ilmwBGsZqsoW47qCjgC93zQ41Q8?=
 =?us-ascii?Q?PVGxuzRh5oZUITj3cXgZnhRn/RjmMglPWcSXHXsWC8eGBIbjfidu1rkj1El+?=
 =?us-ascii?Q?EHaDCr8Lay23N7NnMFxZarQ1xAk3d59u+gDcT2+JlrvsBSfQitC+HKfEkdih?=
 =?us-ascii?Q?PYZx1FCVTVFIsUQ9YiiNSnGVnsxNripktB/j2f8DZ3t5IqPO2t88WLyqY7sC?=
 =?us-ascii?Q?OLvTIqNuOPC98gNn6RRjvbiSD3YYvQ+hQLpRPGl4wPbscoIsZaw6DZBc6i+A?=
 =?us-ascii?Q?EdivTwzulJoR0TEsHJlv3CvYPS1dhB7RFG70d0l1XFKkKBUp/9hNouezOtlX?=
 =?us-ascii?Q?bPzNMeb9fstug5iQ1ssiVznoWGfZ7juyQb+h4sEs2jZCrLYeOn+IMK5368jP?=
 =?us-ascii?Q?UpyQcU7s2oh5stEgZzECV1P1fbW/80/lBQTeomng?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e822ffc-6e07-4761-8397-08dc5e57f0a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:58:17.5383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAcerTV4q+y2IE6sHC6PHmROgXa/ZbHAxBH63dHr69MqR1jEaG+ksegDb+nxhgAerRuf6EUUbPc3d7YykxUHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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

On Mon, Apr 15, 2024 at 09:29:56PM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 15, 2024 at 02:10:34PM +0530, sai.gowtham.ch@intel.com wrote:
> > From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > 
> > Test functionality of vm_bind prefetch with S&R.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > ---
> >  tests/intel/xe_pm.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index fafd7a52e..8857265a9 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -34,6 +34,7 @@
> >  #define MAGIC_2 0xdeadbeef
> >  
> >  #define USERPTR (0x1 << 0)
> > +#define PREFETCH (0x1 << 2)
> 
> what happen to the bit 1?
> 
> >  
> >  typedef struct {
> >  	int fd_xe;
> > @@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
> >   * arg[2]:
> >   *
> >   * @usrptr:	usrptr
> > + * @prefetch:	prefetch
> >   */
> >  static void
> >  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> > @@ -341,9 +343,15 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> >  		memset(data, 0, bo_size);
> >  	} else {
> > -		bo = xe_bo_create(device.fd_xe, vm, bo_size,
> > -				  vram_if_possible(device.fd_xe, eci->gt_id),
> > -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		if (flags & PREFETCH)
> > +			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> > +					  all_memory_regions(device.fd_xe) |
> > +					  vram_if_possible(device.fd_xe, 0),
> > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		else
> > +			bo = xe_bo_create(device.fd_xe, vm, bo_size,
> > +					  vram_if_possible(device.fd_xe, eci->gt_id),
> > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  		data = xe_bo_map(device.fd_xe, bo, bo_size);
> >  	}
> >  
> > @@ -362,6 +370,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
> >  					 to_user_pointer(data), addr, bo_size, sync, 1);
> >  
> > +	if (flags & PREFETCH)
> > +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> > +				     bo_size, sync, 1, 0);
> 
> anything else missing here?
> apparently the patch still failed badly and I lost my machine now...
> will check again tomorrow with some debugs.

nevermind. nothing needed here and the problem was just my machine/image here.

with define PREFETCH (0x1 << 1)

feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > +
> >  	if (check_rpm && runtime_usage_available(device.pci_xe))
> >  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> >  
> > @@ -617,6 +629,7 @@ igt_main
> >  		unsigned int flags;
> >  	} vm_op[] = {
> >  		{ "usrptr", USERPTR },
> > +		{ "prefetch", PREFETCH },
> >  		{ NULL },
> >  	};
> >  
> > -- 
> > 2.39.1
> > 
