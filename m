Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64911CF3975
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 22:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD9610E126;
	Thu, 19 Sep 2024 22:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5oOLzSL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6A810E126
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726783362; x=1758319362;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kQn80TshEiZD1whYVqFIg9zn5ZKw5tvk9wIs2JqPx4Q=;
 b=Z5oOLzSLDcKeufR3Ez4YIg5O98X18Dkqu8GcwhTKyvCYagdLUT1HzYF5
 QgS9a5ygZnhFFqhXBaqLtXVFY7GanZfEytpW4qXEXfRb4xs2PUy6a5YeK
 FgQEjtBScLfoi8+9U7AcC4TEVN3Ldyb2PyU1ZnRvXhYGmLtLnZ54CHhpI
 6q+bJbnCXjehu+C7iR65BdXP7IqPdJhtGTrkk6d4j4XvLeJy5VT1ob0ta
 dVIVlVd2B7RVLXSdBCqGh2vC/fmiHDzB9T8G/O5sA3UrUYYXFPG6N8lef
 riKcvOXqqRYSRw58j0pDRcIaAxju/lzTBQGW81oPoH6bzumjBPUnM+O8a A==;
X-CSE-ConnectionGUID: PfnL3GE8QmiLgrMu+OE8Ww==
X-CSE-MsgGUID: 6L22LwWzRly2UPja4p86OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25297750"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25297750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:02:41 -0700
X-CSE-ConnectionGUID: JTSlKMGZQTaUI6zkbIuLTg==
X-CSE-MsgGUID: IM4YPn6ISWaPju0Uajr90g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69665843"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:02:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:02:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:02:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:02:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8JB32szf1YENosjDcUFXgp8rOXWAf8NRZRqAn8m2Blfhl1IlmtMF/TGT1FtMrBtSj20WcQN2YgnrCxONhPUHhW6g6S9hxspyC0xf61YWz79VzL6vFFeXyCtr0m+cBZEVjGCEilQUHLY17LjlsPDEqpSMKyOwUSqoSlOfDqOI4aFMn0yP9qMxpedM78nAYbr4KIq+SfwHwBfuiswZpmRXXSBZ5VjIoaebo/7/PUGU3HFMLtVlkL0yMTy5aSp6iF59FJFIxqkLlzvvDkHw8tqMxCj6vmt43v/BnA8b35eo4s21PjOwbL542fJLtmHe7Qc9mQW3zYhufFTcFgb6Jh68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iH58g6H2HKIqDfKzFp1dpsZUcQQ/eXXZVHp6msuOFA=;
 b=KdIyWqlQAD+k+IYC3XSzCMFQcVBBEbRY888hr3HYaAZMX40MZNMGZAlRg3zeXXfosWPlqM8MwFm4HNT2yFQ1IPT8KkojPvbd6Khz90iYtSYaIQPslJzJw6WimQHRvAfKtA4ecZNQnnkqDi3/TQDCtcltNdyQmafu6/XiZLsrQzdpx7uU3+R5K2fCMyaQKbaHSiQx0DR7EjrbJfXVtTicZkSq9mT+5OXa/h2qatwBB5K9E1UDhJwWtgUS9BSsH5XEOrrr64RE58IowTXmagsOUghSLmfncdr9Mp1yoC5Y1zMUsEKiLJZrl9yGftDxwIqYwUBn2Igt5fXtTG3Fy1Hc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 22:02:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 22:02:27 +0000
Date: Thu, 19 Sep 2024 18:02:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Bommithi Sakeena
 <bommithi.sakeena@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pm_residency: Fix while loop in
 toggle_gt_c6
Message-ID: <ZuyfcOSblAEBY9S3@intel.com>
References: <20240919165950.50879-1-rodrigo.vivi@intel.com>
 <ZuxvBL2FbkOT8OZp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuxvBL2FbkOT8OZp@intel.com>
X-ClientProxiedBy: MW4PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:303:16d::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 866899fe-1c19-4f6c-c402-08dcd8f6bff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LeQYuGffxggtlidjMkW+17LswbDKy2n5Nv54SKvO8Y+AEqwoQ0b+l38dr6?=
 =?iso-8859-1?Q?+jbggobI+LQSmItPFpoufqwTOed0EBJd5jHyTgR9QKk+5TlUeha9DJzEoV?=
 =?iso-8859-1?Q?4lxywj43Da/9ojMZ/PyrUt7y0ijelXpn5tgFghIxx5pbY6/sPd/IRcvID2?=
 =?iso-8859-1?Q?GHAlag/KQmM5g+TVNXXtGwSPpa9FEkVphPmjqv2wqJhkYyO8PftfxQA/qx?=
 =?iso-8859-1?Q?E99J3PKfQ6YtxXxs+TCzAoAUEi8grl1GsC0KAUjrE2JDSNkH9N1vEEdvUp?=
 =?iso-8859-1?Q?9O1ptpeQb9MXnrzQ5HkB6eJqkQcFsfN+JQGc9N4IbMjT9gJrnDQ4J1LO8r?=
 =?iso-8859-1?Q?afTZUHkGkEaXduSDTOSdrDO+KpgTGjC5zflNovfZTbXqVa1+upKzACeWW0?=
 =?iso-8859-1?Q?74fXKQNCEWWJb2d5Ug4n6hvnV6G/98iW9kxr7bg2FFo6teP5HrOqWr5+kW?=
 =?iso-8859-1?Q?cWZij/udtaMHfFF2qGBpHphjGoOroCdL+Jd/sxJVIDctbY0AFPAasop15J?=
 =?iso-8859-1?Q?8dk5ra1Pk2ZDgP/Gt6Qexun4d/hN9rdtskDQzmLhcUiyjNfC3yAIjmSfni?=
 =?iso-8859-1?Q?zz9ffQOqsQBk3CHo4B/yrd88gRzSSSCFo9uI4+WjUP3BwxzOJ3jBIcSBbY?=
 =?iso-8859-1?Q?7/gfv/DoeUZlflL3ASYeMmxz8bUZOOUW0IQvQ3SXGsf5D2gDdg1d37qoWk?=
 =?iso-8859-1?Q?3omXhwDPy7X/TGmgmNR2Ar/08DOfmEJy6Mvw2YlsdqJtIEEgeXWeB3iLRx?=
 =?iso-8859-1?Q?eSfB0n02LWUz3fSVZCp2jn8+OlpC3PviA9CjmsnVBWz0S8T10AA1uRLwZJ?=
 =?iso-8859-1?Q?rzL3fyVr/F0sdaBVGEMDMJHxzZyAFiNTo6Su29+U2818MaMTjP8gFrkD6p?=
 =?iso-8859-1?Q?M0uoa8MnuGuf4sHgO45slithVrx4ISRzmYNPWsHLNlJ5ESHrXEo8sbi1uV?=
 =?iso-8859-1?Q?nFgZ96zIxFsdpRcjQiwaoIx37X6B97yJSfhkBGbb7dL9Ac8t8wN/Y1LZ2h?=
 =?iso-8859-1?Q?4sXQ5IcfTZS57LqZ2GJ6hH8SqE7/e2DGpTt8l6yw+Sgnvk96X20oUhRwsy?=
 =?iso-8859-1?Q?RpGr0eh+3yW31Jqm+D/lXgfivvXaTgtVbvTxvs0TT8brDdVp86E7tjt7T9?=
 =?iso-8859-1?Q?wdqRcJuUPt8WCiy0j681ho5VLauLueXI4laPfiTajIWjOt1ZcMnWDw0PBm?=
 =?iso-8859-1?Q?V6qd2Fb6Gjl8co1ny54O0b788wQE5KzufWC/Ep6HWXXwVQPLrBvF68NIZF?=
 =?iso-8859-1?Q?LtvfhxL3+UwvT+J6Ir7MKwAs294arqZrnml5He6MOxyN1JsIPjZCaZVPCb?=
 =?iso-8859-1?Q?ylbdwqthjfomQRGhmfJqhXgKPNXlOvwoPQ0tBfm7tjEImqFgToYLtyJsFK?=
 =?iso-8859-1?Q?UCzziGAHozzWLIcNrrrxGW3ZPmEMc4Yw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4qOalXBdpmpztwnqXul4VUdjs5P+vyawzq/gvXgp27iX6qUN9OUPcC75Sn?=
 =?iso-8859-1?Q?XGuZQhlnLSli5cIuuacP5mCySVmBuekef+hpuSjK5gqp4uc95kYGxF+H1F?=
 =?iso-8859-1?Q?pV68aOYBA472fomX9dklnE3nU/NlT49Ky41bk9C06k6jmZPT38FxFSN8Tt?=
 =?iso-8859-1?Q?6JMgICworojmZ/Hj/40vWyQKRo5bCsRyxVF0Jx0sNz+T3xisKMnxIdc6KT?=
 =?iso-8859-1?Q?ff4U0VZ35LP344rSe0aMoXIIGD/ajnfcMcSQNPf6eJjafjgAx4mYDhLDNG?=
 =?iso-8859-1?Q?ui6flxDd5SXkA5xFeQt06mY+rW1tPuT0sVJnf8/qe39oBklPz7Gk0JdyKN?=
 =?iso-8859-1?Q?+uBb6+rPRys1T3FVBG7RCZlp54CrKse3dQGPWar4HM+GCxl27miY50A4au?=
 =?iso-8859-1?Q?Nbiznn8/xvGw4lNxUatqUjz2iL1t+Hi93i5mPG/UdIYwqRf3IFADaFsQKY?=
 =?iso-8859-1?Q?738Zu89NnLzuExM1Fe1OvY+JiIpMVaU6TBy1SmK0r0RfCXSW2py9xTDCQo?=
 =?iso-8859-1?Q?KZ1tJBt/2xRRAobr0LJF5IwLQwqV6CN4vzBdsJz+3+7Y+nG3QUrXp0z00s?=
 =?iso-8859-1?Q?Aqthlg/N9SRfmzpPV4sh9uIAh7jDeNdT/yz8BZm4qctVbakrDPAdEO9qHt?=
 =?iso-8859-1?Q?qbuxNna9TlR6n9I6G66asGb5r0cBRg1Y5zobkGHJNABv3KVFdHfxpfc9nk?=
 =?iso-8859-1?Q?lDq1W9oBBVasMgdWuWquk5z4yMgItxqldg8tnlH8yHjFdrZPDnNAmRTzJ8?=
 =?iso-8859-1?Q?VCl6uEsGEUVKlfWoTmCdI5E8ssFLHEvM+id9HuyiMBYm8TnVJdS/XDfe2u?=
 =?iso-8859-1?Q?Pf6aszuPaaog90txcWLwHtkBX98lz8ugukBcrXrvlLVX8X5vL+5ZqQII7C?=
 =?iso-8859-1?Q?11TG6lny9N4dTirXdvOEG3bnbkkOesXGN1DlTsta6aC2pnaXxVwAXwScGW?=
 =?iso-8859-1?Q?RFHF13JeJqSNsrUl2QpwC6mqgt46mHJUWDmdtTCBWzYAfD/GpWP+MDGweH?=
 =?iso-8859-1?Q?yIIFWNrYIkO3nLQl1okYSr6mN+50Yw4+s3GB6fEL5/Bbl9EWPQcxYWBd7O?=
 =?iso-8859-1?Q?Z6swsnmy+cI5AdoescfT4kNd616uLXiCqYkyE9jlaJ7AlNYA2IqW1ul7TJ?=
 =?iso-8859-1?Q?52rTdO01gVF8kUNtFxQT9ypARhpVlyf2zygofSc1kHDSffVYXITxH8LYDF?=
 =?iso-8859-1?Q?amUvDQ8iiHbql5npi6H8bFiNebsI1fAV5mi6AEEfljvXY3wNAQIx21FfZ7?=
 =?iso-8859-1?Q?WUbNfKd03B4c4CQCaGNppA1dLXiBqY5VoL9VmDJxR2dQwGznRZWB0+/svx?=
 =?iso-8859-1?Q?RKYCb6zPk75S2zW3l8FaH2H9zV9u/KL7vuVREhwl+QUg05ka8tPFxsU2Oq?=
 =?iso-8859-1?Q?bN1nXnJqg/T330AdNwL7LSJxv5g0sTNtRHaL5lI+ronp5olyTj7uEysa9H?=
 =?iso-8859-1?Q?r4AokPFfQaJaRlooVHKWIDHHUu1nTZBjgwN8BLUUoQZOxTKXDkAR+DcEmP?=
 =?iso-8859-1?Q?F7cGmAb1OWj7HyDG82G/3OI2uHwhdcj8K/w6IKaO9eUsaQj4D2AqoS7ypN?=
 =?iso-8859-1?Q?DKopjaOVPeiY/nz4oFqUpYh48Pe0iiQ0TeXbTFZxrqYdiGkUXsYjkJ7HFa?=
 =?iso-8859-1?Q?7QNF1HQ/I8wP9a7stlhp08AE9ei+qh2fbI+Z2LZZnh2qQg2YieIxZIHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866899fe-1c19-4f6c-c402-08dcd8f6bff4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:02:27.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdrsxg4AR9KNMlwg2OZtW6UqTApTx5jhQ8EOsdWYyNK/O7klHsrMOG3vGOCVmbio4GnRI0rha60WucgA35bgrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

On Thu, Sep 19, 2024 at 09:35:48PM +0300, Ville Syrjälä wrote:
> On Thu, Sep 19, 2024 at 12:59:50PM -0400, Rodrigo Vivi wrote:
> > From: Bommithi Sakeena <bommithi.sakeena@intel.com>
> > 
> > Function toggle_gt_c6 has while loop iterating for (NUM_REPS +1)
> > times. Correct it to iterate to NUM_REPS times.
> > 
> > Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  tests/intel/xe_pm_residency.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> > index 0e687558b..f4d05889c 100644
> > --- a/tests/intel/xe_pm_residency.c
> > +++ b/tests/intel/xe_pm_residency.c
> > @@ -297,7 +297,7 @@ static void toggle_gt_c6(int fd, int n)
> >  
> >  		if (n == NUM_REPS)
> >  			measure_power(&gpu, &gt_c6_power);
> > -	} while (n--);
> > +	} while (--n);
> 
> Why isn't that just a canonical for loop?

I honestly asked me the same question when Sakeena showed me this.
If it was in kernel I would had requested the for loop.
but given while is used in more places in IGT I liked the small
patch as possible here.

> 
> >  
> >  	igt_power_close(&gpu);
> >  	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
> > -- 
> > 2.46.0
> 
> -- 
> Ville Syrjälä
> Intel
