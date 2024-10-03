Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ED1CF34B2
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 16:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7452A10E8A2;
	Thu,  3 Oct 2024 16:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UihUciEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDB810E8A8
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727971730; x=1759507730;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LL/U9ctiF7fhJE+MCuJBEEP2pOEUvFtJKR1JlVXFYtc=;
 b=UihUciEv5f1QPUC5rh6hrkKsix8gpqOFGiPsMBwmgGWTloWEORV2WJ5X
 tfThdDKjVAhfrFVLmRZAJa0mdFexupNyPeEPvwwKATjDhNwKcQtmQo/Sx
 Hyw0acWWYWtrcvw2k9HFapMQ4kScW030S++iwHhEhqUiaM5YUH7GkS1fI
 nnDyjuQ3zh9q+Plmk9RVAR6Vgtyn3VpzhqrIQLEBmsIoGKfJwjpqL5fB1
 AyN5zlDkWMTL10/Km8GD9loEU5h8rmON3ux8nm0xGbHIwuytfOZfIF2VY
 PnIPnGqTGO7Syk3Ycr5HVXfhT8N2yQMYYoiA2sL3mlhhGr6mpHEfpC9rt Q==;
X-CSE-ConnectionGUID: mkCxHge8Si2ySdxnfhaNVg==
X-CSE-MsgGUID: HdG3LlmwSG+Gl9DRfLaUuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14795396"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="14795396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 09:08:50 -0700
X-CSE-ConnectionGUID: yzyN6wTjSey9EMJyi7rnuQ==
X-CSE-MsgGUID: rfxTXeA1QlO0vVtpnXigKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74722145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 09:08:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 09:08:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 09:08:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 09:08:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 09:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs1Rhq9LR0sa+68vhBr9hZIDr3n+VeBT+J62JgF+26yNOm1O2IgbzlLhgxjp60ZCU9jxv45KU3lR6eOtg2v7CzNqmJGL3BhY/FWGMLJsDvpV9KKxWLseWk+Z1kc2jnIFSszPVmrWOEElBz+JOGxB0qAeql8wQ/lOTv6zy0iYxTYY8zIHXGnPea6KMuJ2Viwia9FhGf7KApJtQJm/KK7yAVLRkAryx+Sy7vxvRLwkI4zC8tmZDCRHeSKBTtzzOhGjC1NZY79FS7oPclC4vmUiYg6wq8Z0muhQCgFU7jf44w26H0f+T42Ww3khG+uwcNydY/CKiT2IPZUtRHgbdQb0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyWE1dHAkdmLE7s3LMPIegT0brltVoALY0FI/Dw751Y=;
 b=oqWZjjmv8LtxpVpM+AZIA7BGPZvFzaZKMqM/RzCbVHmDh5AKW6acux/89YOMzvwBN9zlyMvP0rMZCY7l4SUTxfJ6KoRyYlYNntDnubF6XCTNAwaoxa72r0ymPoQKvTHiZu+Uwtqz0xeQABT65skVIXztzDc8Jg0/BZRcj/O8qFaep7QVPsZxgeO9aVhD5WBtmZW+SfypveCAmxcMstYaKLHYHujwlMTBu1qpTKH95zo+nCUwusOz+4r3rcK3OnGdvvD8i2s3pL41VDsTH/WmIcR+qOvymSxVJRBE7x0dX6mjttdAPw/JgboXZnVwNglyAKyzpHf8zVjtpDpWDFWFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 16:08:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 16:08:46 +0000
Date: Thu, 3 Oct 2024 16:08:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Bernatowicz, Marcin"
 <marcin.bernatowicz@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait
 during the gt_reset
Message-ID: <Zv7BhpgImS06j/3m@DUT025-TGLU.fm.intel.com>
References: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
 <05ef47a7-663a-4fc4-a069-0c3f3f4c385b@linux.intel.com>
 <53783573-6681-49ec-b400-cb85dfedcf8f@intel.com>
 <DM4PR11MB52932237D9C02F73FCD9CD6A9D762@DM4PR11MB5293.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB52932237D9C02F73FCD9CD6A9D762@DM4PR11MB5293.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 659b63af-8f5e-41ef-08d5-08dce3c5a8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JcsYV62Opagz7QbTIoXQUiTwTTG9XpqZVWT4T1CYwXm22tUOkdnuwiqB3J?=
 =?iso-8859-1?Q?a8CMHfPi2BmGRMd4WiunpIdqddsZteyb5efFKAzQxY1s6V852uNFncOpPa?=
 =?iso-8859-1?Q?ZPDCpMYpBZnkrtSKFyDGsrzhP8uozzVvU8IRpxEuTahIK6bPfYKLsaMtRR?=
 =?iso-8859-1?Q?lu6OGMKHzlXjxuELR2Ytu34GBy/ML5aKDvML26nwuHr+q/w2r9nFTyPu5p?=
 =?iso-8859-1?Q?71tLW42acynjpTt1/0X/O7ywsDSPC4yuBBsyEMWtUT+qEvFxxJW6V8q7Cl?=
 =?iso-8859-1?Q?k43+GCR6iox1KDMYPaohn4k9jU+B9qApyk4Ndc9PmmHCdYj5N8lZNNwi23?=
 =?iso-8859-1?Q?hY8Gs0fH8dQ4VmLl/LfDThQgvyECP6qUz6clPAG6Rk7Ta16GkK6l1Oo/EL?=
 =?iso-8859-1?Q?tJOD9N+tg/pgH+XX/tms16DuayURNIBXFxSH2N82lUFHVAoD2owIaHLG45?=
 =?iso-8859-1?Q?/wYMCVt2oKYC1rMYaSNAsQbxQQj1jOnMRrFZt4HaOT9Dr7h6YfB00jZc6W?=
 =?iso-8859-1?Q?hc3MsQsXukvKnHaDTXMYJdlAtgropTrN9sYHHQD4AaY8MxvtriBtVYseY/?=
 =?iso-8859-1?Q?TDhHyzwfwdZk7jMzAJIZ5TiHcngJnWAP/e4UpzLTou9gVSJH+hhrRfF/JU?=
 =?iso-8859-1?Q?t+SFGH9WR5D3uzd/5Fr3wvJoAaBaPjLZSzmY8G29sr4+TKAowxA/4a93i3?=
 =?iso-8859-1?Q?QmGXjWPffKXoTrbzDSB22+VXZfqj3+X3Og3d8Nh6UHrK9xdpYrBYwlTG4h?=
 =?iso-8859-1?Q?QTZMFASR3bgq6nH/zPn2als9AcOkQxzFRrgQ1WGvTBCOHc4RaJ7t2gix2A?=
 =?iso-8859-1?Q?dK+crMgbQKqANUeXPpj+fwYYYclzyvFGI23FoU7giFVfjmBDRXr5jocOMh?=
 =?iso-8859-1?Q?+H/yPz9+EJzNmAAqDhLR2DhLS2HDk1lxI8oMSEmoJ4fZV4Kqjs2jORB/Ya?=
 =?iso-8859-1?Q?vQX/w76FlMxS7Z6cSsuKLCmQSvK63Hh+Dg+Ovnw4hQ6x+yGLjrR+tZi1uy?=
 =?iso-8859-1?Q?7YYlO3Cd12JtXZMfApHYCDsXNa4w+6265ppI3Sy6deNs9PKNMfoY5j2F4o?=
 =?iso-8859-1?Q?gTLyeKxs7Qd8jEfpHnPscldKIKyEzcZ4jHLkJM9rzqB+G7eVrw6whNB9QD?=
 =?iso-8859-1?Q?i2MwKdT4Cxj6K7Eu0o4kyxYoJhyl5D/PtIePNCT3W4qc2PcSIK4d6UgQRW?=
 =?iso-8859-1?Q?MkyDOR58ar4aMHgY6Wlr2w6TgxOJDoBPhH+sg2ynwmkm7+fCrwmgluk6Pg?=
 =?iso-8859-1?Q?wz6GBVhOJClwvsSgmyL8jj7YR5UkvL2Z6kQIje0KA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cVC8uicPcv5lsKazUa97x5YRR1e4/6yyZHAThWTjMK6nKb3M5EvS1XY/5y?=
 =?iso-8859-1?Q?x3cMG/SkK4M+UaqYG8C5dpqO0QJ6vK4NQYupajDsQYe2WTkVo0dQFnie+4?=
 =?iso-8859-1?Q?2Am/gtaR3u+b0GxS2c8N+vnYkVeiT9w+U3lN+wZNFZqx/njdWhXVeDgCip?=
 =?iso-8859-1?Q?BETp0NSTVdkuQAPlL9DlI9KtLjkKikT1d7bg2kfRMdbex9jMHpHXln3yne?=
 =?iso-8859-1?Q?KZHPfcwyBTPtS0pphGYEjpPnZjWNLWMW6McQMuDgSA9+nZuieyfc6ohwRr?=
 =?iso-8859-1?Q?Q2jcWoF0aaFANJ1C2yrFcYAUT/i+8UiWH01N86u2crR0e76LoWdFN6Mjd8?=
 =?iso-8859-1?Q?+qdSO0OpWzRaqzWa/dvkk5fCG3B9IAlO9vlNDfhmWw7bt7270Sc6bJzRyY?=
 =?iso-8859-1?Q?wLkd4y/DsQeg0/wGL+jvOJGS2uyeafm6sjfnu15lG62EPwZ3WVJQAsLm4K?=
 =?iso-8859-1?Q?rcPWq/qlS6DNdtKggEedN8S8Jzj5cRldEwjG7CnRDXEdp5JmDiiBuBz7vy?=
 =?iso-8859-1?Q?PnIu+qNCtAWPJqHzEaKbVc3H37bdjjcqWIyeNiTJgc06KF9drQSsB3YZyO?=
 =?iso-8859-1?Q?SZNH5ueQ8W6DTn4IyPhDKQdaNrv9hhGbpSa73a1q4mUf22jV8QzJRcyfyE?=
 =?iso-8859-1?Q?/Ujwm8Nt2X+ABZmag5G23R4c0Ob9FqcqqTmeKZZ0Gyh1RQ+cUpDszj5VzG?=
 =?iso-8859-1?Q?jT2kaEIodFvM7Pr/hzNtAxEI2cjeS1QhqdRV8LDCLby925MTfUMX3ZPQ6t?=
 =?iso-8859-1?Q?tOb6/FwzMpd+k7CkoDiEqQDxn6rw2l4NabriSZep9snQtkcgM6flefOASh?=
 =?iso-8859-1?Q?4XOLRD8awXn7nR+4slrzxI8YhBFWp9Xzj1OfH3hTHrmS4lfFTZIf2ZcOwB?=
 =?iso-8859-1?Q?7CgGobZDJFJI9x3nqyQSJaHqv0UOi9eHQQC7QSHxnzQzW7MNMdO3IHAxEt?=
 =?iso-8859-1?Q?ODQkVXV/fSfq2NbgMcSeB1T6iUQeNAbbliJlJBrh7o6npXduiYZ5ECfTCA?=
 =?iso-8859-1?Q?SvsdeUqsmFBrWL1rlDx9RcP6ka2D205RlGk1A2bykBZoU5tyEErgKXcZXa?=
 =?iso-8859-1?Q?T81NB1/4soJSZ76l/vVEer1m7LqKWTxpscXwwxUMvPQiY+iW0VVCTOl4kI?=
 =?iso-8859-1?Q?KVwGKWgPFoHun17Xeim7hjgEurPqJk+9MSa1hFaOo4tIM1V6JlVKPe3yst?=
 =?iso-8859-1?Q?pTU2fBOv8a5w3VLW7rnMso7ZkLrmEfgttNlw1Xt8wMcjqEsPaemO4gqYb4?=
 =?iso-8859-1?Q?R4N68dW1CefJfDfz9eoAtVLvmiZXEcTuE3sIeHPczDwhCT0ObzBcd0eiqt?=
 =?iso-8859-1?Q?mpml+8EJYFlewxXUCBTtFp4eHgRJIPF1vcQEUcxCGivG+Tiq0JuKLp0Yn9?=
 =?iso-8859-1?Q?N/rNE9Jvdhj/nGhAwCi04tLY6e5cWHeOsQ0iidOjofYiz+FUt1yOg7IVQl?=
 =?iso-8859-1?Q?46e5WSIP8ZgKgSNDgVKky6elNfMvgG9T0OAH53MCwLDy2lm+vg9OFdP6sx?=
 =?iso-8859-1?Q?o+hpMkT5T9vwYzMepYtee434ZXAkKpi1d9xBpC4uFMPMNXcKgz4O/SxZok?=
 =?iso-8859-1?Q?fAcB7Evf91utupv9HEQxkxcIFjPD0tNAoMCXyyhu31GrXIaoRxA1AbDUy3?=
 =?iso-8859-1?Q?AA7qHRxOTr7otgxtyNHQfinwhpS73KvyrBuJGZf4IGnU2sxHNw9Vh7Yg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 659b63af-8f5e-41ef-08d5-08dce3c5a8f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:08:46.3635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdArr+4H1iFhTGfa+I5KUlmXqZTxNfuTaDU6TJzvGn9qATeZPERY+D7Fh6SIYzSbMQXZO52V98XQghCCL70YYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
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

On Mon, Sep 30, 2024 at 04:18:49AM -0600, Bommu, Krishnaiah wrote:
> 
> 
> > -----Original Message-----
> > From: Auld, Matthew <matthew.auld@intel.com>
> > Sent: Friday, September 27, 2024 3:52 PM
> > To: Bernatowicz, Marcin <marcin.bernatowicz@linux.intel.com>; Bommu,
> > Krishnaiah <krishnaiah.bommu@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Summers, Stuart <stuart.summers@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait during
> > the gt_reset
> > 
> > On 27/09/2024 11:05, Bernatowicz, Marcin wrote:
> > >
> > >
> > > On 9/25/2024 12:31 PM, Bommu Krishnaiah wrote:
> > >> From: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
> > >>
> > >> Skipping the syncobj_wait for the workloads which is submitted before
> > >> gt reset, since After gt reset There is no expectation from the
> > >> hardware/GuC/KMD that the workload will then re-execute and complete.
> > >>
> > >> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > >> Cc: Stuart Summers <stuart.summers@intel.com>
> > >> ---
> > >>   tests/intel/xe_exec_reset.c | 8 +++++---
> > >>   1 file changed, 5 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/tests/intel/xe_exec_reset.c
> > >> b/tests/intel/xe_exec_reset.c index b5d5f43ea..b1a7548c6 100644
> > >> --- a/tests/intel/xe_exec_reset.c
> > >> +++ b/tests/intel/xe_exec_reset.c
> > >> @@ -263,8 +263,9 @@ test_balancer(int fd, int gt, int class, int
> > >> n_exec_queues, int n_execs,
> > >>       }
> > >>       for (i = 0; i < n_exec_queues && n_execs; i++)
> > >> -        igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> > >> -                    NULL));
> > >> +        if (!(flags & GT_RESET))
> > >> +            igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX,
> > >
> > > What happens when the user waits on syncobj in case of GT reset ?
> > > Maybe there is no expectation that there will be re-execute, but
> > > shouldn't the syncobj be notified or a timeout hit ?
> > 
> > Yeah, this sounds like KMD bug. Expectation is that dma fences should
> > eventually signal no matter what, and in a reasonable amount of time.
> > 
> > Possibly relevant fix (very recently merged):
> > https://patchwork.freedesktop.org/patch/605681/?series=136463&rev=1

Matt Auld is correct here, this is a KMD bug not a test bug.

I thought the above patch would have fixed this problem.

> 
> I verified with this(https://patchwork.freedesktop.org/patch/605681/?series=136463&rev=1) patch, still I see the failure with this patch also.
> 

This is unfortunate. Seems like we still have some KMD issue here. I
just chatted with Himal about this and gave him a bit a direction.

If this persists and easy to reproduce perhaps I can jump in to take a
look in a few days if needed. Corner case submission issues are pretty
difficult to debug and happy to help if needed.

Matt 

> Regards,
> Krishna.
> 
> > 
> > >
> > >> +                        0, NULL));
> > >>       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> > >> NULL));
> > >>       sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL; @@ -410,7 +411,8 @@
> > >> test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >>       }
> > >>       for (i = 0; i < n_exec_queues && n_execs; i++)
> > >> -        igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> > >> +        if (!(flags & GT_RESET))
> > >> +            igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX,
> > >> +0,
> > >>                       NULL));
> > >>       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> > >> NULL));
> > >
