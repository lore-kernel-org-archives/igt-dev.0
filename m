Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B99E67480
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 21:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6310E938;
	Thu, 31 Oct 2024 21:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXcKdvIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D1110E938
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 21:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730408899; x=1761944899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T56SCqAaNeHW5vUNXFofbc5fxlTkIaYVOI9EbIPt0lI=;
 b=RXcKdvIq2w+WQO+kUz6ACSSX/fIsrUTi+HUAkmmPcOmvLnrCsKLzthFC
 ue3HWt9gc9jDblB5bxp7j/N56vDtyrc61ea+El1g+EpTWUJMNBEvxyNTy
 MEpvYVPtBErJhIcsm7z8RLpUC2DMcL6tC2AGaoMicjfVmpWdr+n4nnkcY
 GBsBdcO8tKy16ZlWm064zsIb5xW8arWBVMDTH1sBtkstXnRlL+5ITpuE7
 shoHSc65d4OK7SFEqSMIEGDga5hRBO7UW9JjYANjrfyyAhnu7EDHf0MWc
 s1g7Hlea7vYRLkIsNxLA13+2i1SivRFvNDtUh7ddWXEqmdNn2l3aOQZc1 w==;
X-CSE-ConnectionGUID: fG8LYy7EQL+jtw2nynPpYQ==
X-CSE-MsgGUID: X9BfC9fiSQ2uhqMvdGQ0DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52738913"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52738913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 14:08:19 -0700
X-CSE-ConnectionGUID: 2bPjcSzuRd+06DrFj7oFtw==
X-CSE-MsgGUID: kBLPVECNR16A6vP0CC0Phw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="113541063"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 14:08:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 14:08:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 14:08:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 14:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHU2VbOpcWcT4xLioiwl0LPZxUg0tTn6E3PamjuJEmzh22QXhjtKXUU1wEMpBk0DeezuaWM6xnB+AQHJqvHMz9nNyu+A8qzZbcPyWW2zBs0aFEuIpsZPGzLuYzQaR6Hx1QcPJ0P9JEOFPIFOfFbHWVZ/g+ljRUp2O7piYatMorDgBMQvYV7VlqFs1aIMyKmd0Jz8Vqk02ead2CWRuXtlTrGX40DRl4NWtMC3tsFnMzVC6iytr8ktZa1mi6R6FVaaEANxDoy2PWKBCK0royvBhTLv6N2fQDkbTVOQiH2d2LZvqll0QeweahugQ4sAAFK3B5AJOgkG+qH5HcuY13x8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN0xj5Js1N8pc0fSvW8L0v+LI5NyX6odpDUgRGKRR/M=;
 b=rFmHonbs3mCT+rn1Fqu313XJRL/U8x/V6zX46fc+IZeXeL3Gne7/CD6uoJ9RplieuE6mrs6Svv1Bxp/cRalT/pT3jO8QdmeZo20/vWmhKrzSB29SaPJQ0PHtaFruxsi92VZmAs+hNuhNqw3mUEHJLmU1v5PSuLDOUVw+chbz1Pj05JmQAaZofbqfYSG6dvMFLKCkoxEM6kRTSqnJ4o2KWDQrcDJjkApYHlW4DYlmWIG3Ecg4wGxhpD85Z+bBj0RGrAgR0nUZ+yFT1ozWZdoP05zbIHZE0hpxInM/oOR0OAEcwTjWV0UA5j+1ISbDnk1yIjK2wwf/jH9+SNN7cerBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 21:08:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 21:08:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Topic: [PATCH v2 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Index: AQHbK7Jm2Ea/2FZaSEq1L+yROo3evrKhLnUAgAAlb/A=
Date: Thu, 31 Oct 2024 21:08:13 +0000
Message-ID: <CH0PR11MB5444CF021534C2508AF6A812E5552@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241031163122.37356-1-jonathan.cavitt@intel.com>
 <20241031163122.37356-3-jonathan.cavitt@intel.com>
 <20241031183014.ljgijkh7pnvk76m6@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241031183014.ljgijkh7pnvk76m6@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7550:EE_
x-ms-office365-filtering-correlation-id: 6b89ca65-b3b8-454d-f0c4-08dcf9f02211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ekYaiPtmHXo+Fs8uiHU6IQPHXv4HiqaXhqeZ5YfrWRjVY73PMJGDnNBBzYkO?=
 =?us-ascii?Q?j6m0EJAn2J27IcrVj66pVD5LBSXfqcr48ijptEEnwlxXNqsyG2G+EgzRWa1q?=
 =?us-ascii?Q?u+k5f9jz3pKDrTn/AZt6JimhDHipi7ooREnf9qhSVsTbLli6gRH+XPRqqXRE?=
 =?us-ascii?Q?T5zWt0lUypxk4UvKMClGIx1PhPOhFmVdWSL4Zl0APxvxhQTw+HKTBUXxhPFv?=
 =?us-ascii?Q?/Xs+gAsa3wTVBBjlz4++cscVtc9Ml6g4nYBDebyG8WqHXv9LrHxhHXHZfz7e?=
 =?us-ascii?Q?ONjdRd/WdFSUpaYB8gBBUajOX0wiFSObWnWSQExPK/GPKtZCUgOzz5vZ1zHs?=
 =?us-ascii?Q?V2epLMBNRNq/N6swlx6EgRpjcyWnh2F3fHW8jKUx5SmkChbvGaGiOUXzGc2c?=
 =?us-ascii?Q?XXqG19/w1waZeUcinQtxKyHQ85Y7zrnR20FgpcAkxi6K+ZbslkynhoVgHonf?=
 =?us-ascii?Q?rHMltj9PeRru9QAdGdmyxXrixRBQntdDBj6rBzHeTW3sgGB9cauM25zol1O9?=
 =?us-ascii?Q?xRpYXn/tOEWTs1FNdRVZksCx1QGAV3eSZgmWCK4N7ggmRzoBr9R47e6/r64H?=
 =?us-ascii?Q?+OWMaZzBFujkBPATe+IecUh74LXByEMlADmO8Fbh8UqhfWb3bKh2wo8MbGjD?=
 =?us-ascii?Q?shoeBq/+vNGIgcXgQltqmfp/wpGGP7PdwMaujnlDXmFPiX3+2Yq669gODu6W?=
 =?us-ascii?Q?MxG/XSZtwf6SAstPXsefJEjcdOGeTvM3LHdmZay5v4bYMgbbfl9DcKcfB9Qm?=
 =?us-ascii?Q?JuMHZmjb3RRCvl8yLjxvuU8lb0TtatsfDedFlP77mwMoXifVgoFEUXegsXYZ?=
 =?us-ascii?Q?BHclKrXIBnLAzVGz+wbxXceEr6RWpR5YfamHI5OUT9B6TWSCztUXRzfpBeAb?=
 =?us-ascii?Q?z1yfHsMzBt6RHhT3lVaR4U4jZJb97BBKnpgZ/9r8D0TKmt8o9mh4gYjbQHTi?=
 =?us-ascii?Q?1L/qkK7bc3KtolttOclpL1pl6SXA3a47dnBS3RyVXQAr50Ft020QtPnUxCft?=
 =?us-ascii?Q?Qf7d0YF47LwP5FiPDxOR0/kj23WfOOXZO6LsBNNjcuypbPYDYapNHlDp7gdC?=
 =?us-ascii?Q?08w9LXFn/D0fB678g+6TmMfhueYaPEl8HbSKCKbtcyceQj7GRXhE0IYgR0MV?=
 =?us-ascii?Q?9GkoriV0BK1mIzLxNSgXRgnrx9nejTxQGWF6bVNt7Nx+odVbzRltrbmDohzm?=
 =?us-ascii?Q?15dWauq+d+S0L1S3XL/OETNpBgaJpP5KM1SNrLFfW/xTYKbMWbYqireBY+nM?=
 =?us-ascii?Q?mfTfwaG4juX9nZOUeayr3Y9fwsrHtKFMrFDgWyMzVjnk+a6Vx9QrLwHRp2Tp?=
 =?us-ascii?Q?pXXwlWv8CygA88Fy4q1pIEYR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Orrsu/fBEaQ9+8u+3wzyrv2m6rOvRdK9WyZ9YupKw39yoszkPT0LviAnmwZa?=
 =?us-ascii?Q?OjNpDNcNLxRsWdw9c7/oRlRJX9OnA3gQb5CaD9UmGEyy/OjztqI6L0mU0iGv?=
 =?us-ascii?Q?rF5gixHRpKOc8avl6iXsklWCeOqAJxL/3Fr0puFhu46s5Rs5AkzJ/DYRXjtT?=
 =?us-ascii?Q?hTZjgWqiip5jd1+s1GEHf/x4fe2GRgaIpOY3NW3rkJCXuUcP6yOECf1DRmFq?=
 =?us-ascii?Q?vBOZEhLEo4Fb/Dvkh2ssVIRnnDJLGmR8EOy6x0nqKI42wR21HTvuIj9HwpfV?=
 =?us-ascii?Q?hKUKeUYirdJ+YipYebnDpY16+l8jW4YdvqmORGJw4us21wOi8/q5MIJwAmj3?=
 =?us-ascii?Q?U46wffnaEDo2wrB0Ae5PiZ0vDdcA0hovnM8NJmflfsRxrC+JJF6N6ZA17Pc7?=
 =?us-ascii?Q?YyLXb+zQOR44TIBeQ9tpLwWw/hEOi+6NBq4dNs+mZRHBOOjGAw5NFpw4/SvX?=
 =?us-ascii?Q?vi9mY33JEaXxDkKqeud2aWweVDm8XVB/OpavLbKXsor/IC4KqveuzU8bkXVu?=
 =?us-ascii?Q?FA+/JVRMUlxtZ1v5+dC2Hv9Oqr1jWJPmSwL9JQav2H1lSvrA5ShhH1hlv0Jb?=
 =?us-ascii?Q?N7gRTbtOmpJT0BM40DWpN0Ymws6ql12+T8r47FWQJy2CF+gv6uI02GYQ7euR?=
 =?us-ascii?Q?3xeZQDUKyOcGiJw2EwnSUufeM69q/v4zl4eeR3ZtV7tSrf1+z0JHRwosfZHh?=
 =?us-ascii?Q?6n42aXR/g/0ThfzHmDkRfoMICWYpLPgO5MPylOB4qcGL6SnZN6e/4Bypp9Fl?=
 =?us-ascii?Q?p5bfEseVmUvd6XcbXh/5I2K/6sO50GIdOqb0/H1Bg46Qi8UDJyVsZiVWVU5O?=
 =?us-ascii?Q?3ZHXYgcBal61jtnBb/6UL0/M15u29DukVSMPNSXce434fI9DN9OTs/Ou/jFc?=
 =?us-ascii?Q?PWc4QlDtSGPstFhRguNwKwFkkcYugoYNdpFT1jM7HU7p8ea++m5sdffGwmD3?=
 =?us-ascii?Q?31u/XH/9bY06fbcquBGdEi/BRL+RtTxDhXOLUH6sbcmHE3y0+JeTwlQetN86?=
 =?us-ascii?Q?w0Q4DQY6Oo+Jy2iEA+a2bXch3I8ItojPw0tIyZ4bMOXaISnuUrHzDcdCgtHT?=
 =?us-ascii?Q?JtAFX76PfPvLimqNDkhGoHax4lnpJoCqDcI5AVD3y8OevmbxyYTjW78u5Qut?=
 =?us-ascii?Q?alyikB9UnHN5+NBUpKK2S6EYR8uFLluI3VWlAqOWlV8u58mdQ62nbdVnGx1W?=
 =?us-ascii?Q?VE37s2PGEZ1chcY6mHOy74tx8Ee6OtF7gIHKW1AFehu7UG6ZtO7/qbFxcsza?=
 =?us-ascii?Q?59bHmfLPqGumLao++0uoq1FKpqJInsS+pQMtehbMlrIFw00MYtwuMzGmHv/1?=
 =?us-ascii?Q?99ISXVd0I5omKBjlrXU6CGf+qNDbAOcnVcpMJgrw/sPWfBnkiYTKq+ktLSr8?=
 =?us-ascii?Q?JsS/M54t/352W0lWRBGTBNKnV+ZWyuaw7LItbDt99RMX/QNJ9pumPGZnlMkM?=
 =?us-ascii?Q?lzJUga0v2bCrW4fHAVlK/e3+GYVW4DzH4BaddLApmZKZ9cm9w6BtLoE3JwCY?=
 =?us-ascii?Q?npZWCJ5OqJ16JDFSdRqcDdyOXLmUKboCmya/nTIlimsDn4Um4Fir3IlA8yIC?=
 =?us-ascii?Q?+ZX1rW29xMSFGZsos5glcqCRutZ3sq54pSQK3cnY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b89ca65-b3b8-454d-f0c4-08dcf9f02211
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 21:08:13.8699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kalmQ5FBkpTMkmVHnv4f47Pmet6KJ3tACHxlw9Voth91l4WXY6r/H75EhLelJEX7yH7I6wBoZPGtDLX1uX0fUallH5V/AtRJv7w0qp0Uvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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

-----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
> Sent: Thursday, October 31, 2024 11:30 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurab=
hg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vin=
ay.belgaumkar@intel.com>
> Subject: Re: [PATCH v2 2/2] tests/intel/xe_sysfs_timeslice_duration: Rest=
ore preempt timeout
>=20
> Hi Jonathan,
> On 2024-10-31 at 16:31:22 +0000, Jonathan Cavitt wrote:
> > The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
> > and timeslice_duration_us values.  However, while the test does restore
> > the timeslice_duration_us value at the end of execution, it does not do
> > the same for preempt_timeout_us.  Because the value is not properly
> > restored, future tests can end up using the unexpected preempt timeout
> > value and thus have unexpected behavior.
> >=20
> > Save and restore the preempt_timeout_us value during the test.
> >=20
> > This fix does not apply to xe_sysfs_preempt_timeout because only the
> > preempt_timeout_us is modified during those tests, and the value is
> > correcty restored before the tests end.
> >=20
> > v2: Also restore preempt_timeout_us on test failure (Kamil)
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/xe_sysfs_timeslice_duration.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe=
_sysfs_timeslice_duration.c
> > index 914575a282..576be98ede 100644
> > --- a/tests/intel/xe_sysfs_timeslice_duration.c
> > +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> > @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine=
, unsigned int timeout, uint16_
> >  static void test_timeout(int fd, int engine, const char **property, ui=
nt16_t class, int gt)
> >  {
> >  	uint64_t delays[] =3D { 1000, 50000, 100000, 500000 };
> > -	unsigned int saved;
> > +	unsigned int saved, old_pt;
> >  	uint64_t elapsed;
> >  	uint64_t epsilon;
> > =20
> > +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_p=
t) =3D=3D 1);
> >  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) =
=3D=3D 1);
> >  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) =3D=3D =
1);
> >  	igt_debug("Initial %s:%u\n", property[0], saved);
> > @@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const =
char **property, uint16_t cla
> >  	}
> > =20
> >  	set_timeslice_duration(engine, saved);
> > +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u"=
, old_pt));
>=20
> Imho '_lt' - zero is an error?!

This is what is done in set_timeslice_duration.  I'm fairly certain it's be=
cause
zero can be returned in cases where the sysfs printf does not need to modif=
y
the value, though if that is not correct, do you also want me to change it =
in
set_timeslice_duration?
-Jonathan Cavitt

>=20
> > +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> > +	igt_assert_eq(saved, old_pt);
> >  }
> > =20
> >  igt_main
> > @@ -158,7 +162,7 @@ igt_main
> >  	int gt_count =3D 0;
> >  	int fd =3D -1, sys_fd, gt;
> >  	int engines_fd[8], gt_fd[8];
> > -	unsigned int tds[8];
> > +	unsigned int tds[8], pts[8];
> > =20
> >  	igt_fixture {
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > @@ -176,6 +180,9 @@ igt_main
> >  			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
> >  						   "timeslice_duration_us",
> >  						   "%u", &tds[gt_count]) =3D=3D 1);
> > +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
>=20
> imho igt_require should be enough.
>=20
> > +						   "preempt_timeout_us",
> > +						   "%u", &pts[gt_count]) =3D=3D 1);
> >  			gt_count++;
> >  		}
> >  	}
> > @@ -194,6 +201,8 @@ igt_main
> >  	}
> >  	igt_fixture {
> >  		for (int i =3D gt_count - 1; i >=3D 0; i--) {
> > +			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "preempt_timeout_=
us",
>=20
> This should be '> 0' as printf return number of bytes written,
> also in case of error imho better use igt_abort()
> We do not want proceed with any test after a failure.
>=20
> Maybe add also check here if old value was really restored?
>=20
> > +							   "%u", pts[i]));
> >  			set_timeslice_duration(engines_fd[i], tds[i]);
>=20
> Same problem is here, function makes checks and uses igt_assert(),
> instead of calling it, open code restoration and abort on error.
>=20
> Or code that function to return bool instead of asserting?
>=20
> Same goes for restoration in patch 1.
>=20
> Regards,
> Kamil
>=20
> >  			close(engines_fd[i]);
> >  			close(gt_fd[i]);
> > --=20
> > 2.43.0
> >=20
>=20
