Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC9C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598D210E39E;
	Tue, 25 Mar 2025 13:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJveYlOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE99110E39E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742910889; x=1774446889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=boU/a+J4LNuIrXGbsGh2yT1z3b5tHL/Q2VVbysOngMs=;
 b=XJveYlOCtYX/7VlknO1FTqonRUrT37Q9/O4v4le7rl9l/LukI7RNjFsE
 fz0A3KoL2gNUfe+mq4vz5We882+R/U6dwvn7j40XCdc4PtmqMjvRyV45l
 zn4ATDXgJwqSbZrhMcB6ACfwlodnpAXoX7bAeK3OSmlrbMOtVv3+0WNmf
 40MnRbPO8HMCaKQMvuXrXP7ACaBljzQiUe/yyQLsEihX0A/0N5Oyq2y7j
 0awCVqBQb+2KWXTbak7R4sE5oUT5Q+TSrKR8B6EJrnmSdSD2SkTy+rL+A
 GmtE7/DFhE2LiQ6nvg0axz3YlMV4diRWF6VddIAH8QnAW0s9WCP2G3EI6 w==;
X-CSE-ConnectionGUID: fkQuYfrdRueYuL6jRj440w==
X-CSE-MsgGUID: wmbKYtYHRAq6c3uxjoQ+rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44280529"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44280529"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:54:48 -0700
X-CSE-ConnectionGUID: enfcShxGTxGpx7FF03McTg==
X-CSE-MsgGUID: W8zjaXkhS12xmnDl7A9NoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124357661"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 06:54:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 06:54:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 06:54:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 06:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLAkMo2Y/1rMNK2vAB74lFcJNek990eU9tLp21W2jT9rgmBAA9mFT5MfaMGqTjwQXz5by4ogT+5ugLUq4UJ8duZ80YvslxeMqwo6Xp7EeK2gUodj1s/6xyTB0O0QtRz2iq46LlTa5hwgklbdtrMqPxOMf7eaKTlu7FZjf3fEyDS3C416JEDiq7c6xBYf6jLSwZF+zG0rJCawXCyJmk70iAPYG/5MRLDFNxfOFELEUFktbtgXMah6iAseQMIyaBtA6eJVXRwo7F4bNW6ORla37B/eWa5dZ8JAsdH5mlbjS/oP4ZN63BOl/dfaM7+JFKFYdD4yZxhknhVTWewvn7f+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVPEucCQ3xE895JvtjOWiANKCpDud7SbEnS1nJ9D26E=;
 b=lrArZXF5gowbrnFZ/1eyeezL1+vDto8FtiurqxdQ9T2FvpEXLa9yWVhcxQ7C1P8HtIxpOeNIqPxtG/LaKW8bC7DTCkDsoJAUdYsvt+YQnn0NwTk4tlNCjI43MVK8zUIZMG95k+6rbQLy5ZgXCKLkYfriZv3OdWquR08JuuCdpxvHG4ZLtg6zltA7YggrVUpseM+Sl4YeoZIoAR+rWikq+bHHqCgGuPrM7+XT22zTMGFhiQcq/xMHXEFT//3RfXEubfn0YcpTKZKCmJBiWwpUKFXy3XLiTo3j7kRAWJx4M7de0MOcOh2RTYMsbTsAADbzb8vaSHYytb/GEzrp0OQCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:54:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 13:54:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Thread-Topic: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Thread-Index: AQHbnUcPWlZbrv2TjE6rrq6liqchALODi7EAgABUVoA=
Date: Tue, 25 Mar 2025 13:54:18 +0000
Message-ID: <CH3PR11MB84340F9322B04196D65B46368DA72@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250325052901.195938-1-priyanka.dandamudi@intel.com>
 <Z-JunHtuZWtgVRgp@fdugast-desk>
In-Reply-To: <Z-JunHtuZWtgVRgp@fdugast-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB8049:EE_
x-ms-office365-filtering-correlation-id: d90ab290-ba1b-4f8d-54c5-08dd6ba4896d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Sull15O3Vazt4LpcAcEL3Hh5pzKGZigmseNdAli2J+EAO4K3ec9M3u/l1ay8?=
 =?us-ascii?Q?ccXQX7QmkT9jcYbLKcDYTMJ4aQbS0usN2tLbmlbRzzTNiWtuT5POtozS70S5?=
 =?us-ascii?Q?6WOsn09Q0Q9OuUDpIxzhxFy7G6Nus+w6Ju4JRPkYFmmVTCMaAsq8w8cxjlpE?=
 =?us-ascii?Q?SdB8D7J6JYvnVKBaP2Hrswy4H3TX9STp0r6tLb+91slEg5e3s11M9D2z8Ks9?=
 =?us-ascii?Q?LyMH59AbfMBp5BUKUwnD97sAJ+EpS2HO0yItomxYDTZgWBuCNdqEJxBgMGKO?=
 =?us-ascii?Q?1N12g25sxaPGry4Ih09qy5Crx6cF3Occu+qctp1VKh909Bua9yufpPzQq4st?=
 =?us-ascii?Q?VQUrdAxCNofGcYDq7O8EcDO2BqH73UR/dV7pekj9Asz8Rgv+4kX4AxuSGCko?=
 =?us-ascii?Q?zRfkCnv1kCwLxFyYiKcrV5U9MN0YeX47Z2GxVGOhvuuo3Yb/RWie+j6hFeJN?=
 =?us-ascii?Q?eRcTRBVqG4qc5jhQ6IKOGa3DUI6ak3JidZ7iN8wyIZsJp47i6zHGnogfdcZE?=
 =?us-ascii?Q?9ZHapNipDWHXWALWP4JjfVKIB7vLgTYbmmODha4qBugPzDTlI46GJQRIiKab?=
 =?us-ascii?Q?8Fb2bq4gIhpI4/7+peJRjZWMDgwkGPCMtIdXCSDx4f/Ukc7nvuBozYonEKsd?=
 =?us-ascii?Q?ktM64h2iT0sC33kuTA5bhpCNInPig3VeIcGbOOf+yg5h9PRcvSA0crMXaZfb?=
 =?us-ascii?Q?Sh/BSVQ4a+dWJ7Dexn//lYLan7n+k5AVCJLMM75GimwSaoL6wbHYFoLbJesK?=
 =?us-ascii?Q?tPA+A8/uKiLzaQyabCb4SFTpelBX+w0ne6EAKYSSCMdRBhJnPwYuNgSetU5J?=
 =?us-ascii?Q?7PArxHzpPHE4dyTxl39PuFNcFWNQVo5G17bMvcQRgtqs1foGRUxT6GuTJzYw?=
 =?us-ascii?Q?oh4YxvZLIAG42RjonXBasifkDG90yaIzxKWmoDrSzwNOb6J6TmAYo12yX5eO?=
 =?us-ascii?Q?rNwhk+MSfk/HmRDkYrzSrjmIk4sZXkXPytJ2U5ZPE/X1SffHD5S4z85AV9PX?=
 =?us-ascii?Q?iPxX9jEx8yjwrunTjIHAAN+ztaj+vWiFSxWbWiSdfc3Jg+03cd4FrFDAD8Gc?=
 =?us-ascii?Q?r1OyKtQ23y8QiygbmzWciMPhmX9gKJ4ilPsUX9RzkFGaWUU0KohlAZcjIZs+?=
 =?us-ascii?Q?9upv/t5jaY1+BwZXgOlAn5xZyj14jnBgNRRgdlrzvXGxyZmBnSWB8GgQlwJ9?=
 =?us-ascii?Q?E2LB0ZCDgl6SY2TOe7UpouDIBhMJSpksANAwmg2+mbm3owfUhqtm0x7NRMBs?=
 =?us-ascii?Q?Ozk+XBVUH9WJdsHLmGWwuXSikaG7FRaTT77d7A8qWA/SRv5IlxgbmmOkWURq?=
 =?us-ascii?Q?fv2CSi/HZOg9ba+fRWbq2DoPKNi+64P+CsrOMteHHZzwnBLdH3JhYkdQpB9i?=
 =?us-ascii?Q?L7LKbyyW85mPKfx+GDpONfuPi91cf8D63I0tC5d/w3QDcstNn4IXxq8CmlRt?=
 =?us-ascii?Q?+Z0cGNwM53OxYxteakrICvo4pcoAakX2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2zBXWhNqTm3N0Ey+CF/rjVWoSdSS+2JjH8fCAcpNTmaCf8n5Lcp3WRiJbw3d?=
 =?us-ascii?Q?+HwNez5C9sYzmUyR1GzaZCeGqKrde7yTNlosZ1p+xVTUbx4ZDkNpDJWK2pqW?=
 =?us-ascii?Q?HP21lnlGQCeCWwxVFrwyBqGoV+mHuo/fLrm+rOcoE7uAJwiXB2/OxsZkBMee?=
 =?us-ascii?Q?Hg94qFWExp5XsiEFMd8c7L2G56T5FUYcspcXwJU3XofmZE2PFwQZnVkUR4/2?=
 =?us-ascii?Q?8jtijSE3K8rnd5I6KWKq+arE98taDWaeNg6T2KsqAdhOzgekYnwsGi10LJz7?=
 =?us-ascii?Q?6UWtOtYbo6oqx03j6dH4Sh8r/pN4mNtH9fVdEgoaTsfOCiGtu4mySeEozH73?=
 =?us-ascii?Q?40G2tKYQBKU5FiDTSrYWirRTZi+j9Uq13esgi4aRbUSph0I35JPquB92saFr?=
 =?us-ascii?Q?tzIgigCGy4F8P4x7ZdTO++Ld7JT/qGaQLAUF28JDNSzmIeHjmc/KhycdHDyj?=
 =?us-ascii?Q?Wa6MWiMaNQ/DwV8BSkEf5UhO7GKChBAlP4CXNFkUlWv6WQv/dLXlUyrgXNgp?=
 =?us-ascii?Q?S/5r03n8N1yLbdxeEI0PYieN0hmFKWqFJ9V/c67YxGkvhIuc1IiHyUjlXPqh?=
 =?us-ascii?Q?+Q9/4eKcGScv1NIFlG9y8yWLHDf2CS0OvH2CqLA5mo2OuxD2wQ/CWAgCVdry?=
 =?us-ascii?Q?SMZx0jfiZLOPHwIVe9KLpg7Ya6HL5/gMkJkvBo1+T0qwkFS85Rc8J/9N0XU/?=
 =?us-ascii?Q?0EFwQSDUim5Q/Y+9b4uzdyx2u0Di7ToRoX0h7EvDi5tx65GeM5mSOJUTvugZ?=
 =?us-ascii?Q?6oRUCqntUsKoGcykrfoMuRliqkNITIIeVhlDMQRP5wOxAXiRiSDk/RZo2ikz?=
 =?us-ascii?Q?EE97g3E2pA34xjpfcQjQpHOdC0brrRPm+7GiVkcitKNW8Zw93/snf5sLQ8eO?=
 =?us-ascii?Q?ZYqk1mLaW5LV2/i2WEh4hFzmpYFvG15ZFPGlM3IHDOHQxDECoE4EhHfPEY/D?=
 =?us-ascii?Q?u4jQiHHriN203yUgo+Sb3fxsG/F4NwwaQEodKToVkimnqbFeR9DRnPxeoKRL?=
 =?us-ascii?Q?HDvYpehJUR5tCohIso6bU+os2/6u0AFDCYkV+Uch/WI6QMDmO9IMk03fOtar?=
 =?us-ascii?Q?cHMPePjUodtbDwhH4IVKKLn6j6BV9oIh1mEnbJ/EOQSEijq+3hHCWublOHBv?=
 =?us-ascii?Q?IptIKqIfLQ/PeoAWI3ToDruIT+JhsXtBHq/8MTXIyeL2ELh+r5OhcY/nMLmx?=
 =?us-ascii?Q?7LLrPSH9wB/VIGNwNp/nVmIoSpG1j64QRmSNgX36xGWqbDwJKpMEsdWWFmpW?=
 =?us-ascii?Q?ux4zsNRUBBggxb+xhCg7x60yMwdq//NIKfUShZcMPbo94MLwzAV28y4TTSbr?=
 =?us-ascii?Q?oKajzKnvpFittR3CcNbEGAbH4zXxk+1oLVslCfZZHRFZld4gckErmS5RLAU7?=
 =?us-ascii?Q?BAgC4FJ/1G6buFDQ7QBwP+2rfFrcBpAsJOZ4qyZsobVOZ3lgzURRTBjaTxmf?=
 =?us-ascii?Q?TEhmUhjKdASQrRwfEk2yhazj9rU/mUhYUqcvIvYkV7RoK51v4eJj5QRozVYW?=
 =?us-ascii?Q?GFPJ3mQrPFX3JfvhVrrQDxxAtx5skAIhhgWVYdujWOM5Ts16dcYR8sDOpORL?=
 =?us-ascii?Q?fTyYhNRuas3JLmDlt8qNdo7N3RZVDQnP+EvdcKhhkxZkMgGlSHlinDyoHd0Q?=
 =?us-ascii?Q?jLEIFoJ/Su1R0MbtvGcoYnhRm1cMHRq/FzID8owXWakgjSxu8ZbPfLOrQFEJ?=
 =?us-ascii?Q?Ij3N8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ab290-ba1b-4f8d-54c5-08dd6ba4896d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 13:54:18.0912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYr6X9atm1A4q4ShKTGlidChgkVCaoDYUp0yDIakm21OWP/Eu36ncKbDwBPKI14wHJSDIDG0/BPx4bVeFEu6CIya/LNLrQXlKziv3qYuIc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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



> -----Original Message-----
> From: Dugast, Francois <francois.dugast@intel.com>
> Sent: 25 March 2025 02:22 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
>=20
> Hi Priyanka,
>=20
> On Tue, Mar 25, 2025 at 10:59:01AM +0530, priyanka.dandamudi@intel.com
> wrote:
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Preemption is not happening and getting failed at the check for long
> > kernel with current WMTP loop count. So, increasing the loop count.
> >
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  lib/intel_compute.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> > 28149db53..76d435794 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -52,7 +52,7 @@
> >   * WMTP - Walker Mid Thread Preemption
> >   */
> >  #define TGP_long_kernel_loop_count		10
> > -#define WMTP_long_kernel_loop_count		1000000
> > +#define WMTP_long_kernel_loop_count		1500000
>=20
> I am still observing sporadic issues in compute-preempt-many with this ne=
w
> value, but not with 2000000.
Will send it with 2000000, but not sure if this can increase the Ci run tim=
e.
>=20
> Francois
>=20
> >
> >  struct bo_dict_entry {
> >  	uint64_t addr;
> > --
> > 2.34.1
> >
