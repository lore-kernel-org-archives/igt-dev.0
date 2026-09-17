Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC291C982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C910EF13;
	Thu, 17 Sep 2026 14:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPDfTTL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B6510EF13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789655354; x=1821191354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnRAPUSNYPuxGkaCkXaoSrRRixh25UXxiOLcJxcEK1I=;
 b=EPDfTTL8RgI8/THMNBWWWtd8I0ePSpbhw+lbrW1u79Wsq1T1g+Z7RVgY
 UC5juWRONTaDIGZ1igfxOH0aVm52Z830OVb+f3sok7QTy4dfPRDKXHRuQ
 T/pongi0l6fYImdVzlYdIIwBHB1COvAQx5vqt1EA7Ny+F3i8efoYZUmeN
 e9zByBQcBaOxNUvG2GhQG0PGOCL+umxGUKkdU6eHQ6r9y+nTneYvacuOF
 SPEkcUxv5suoHr+wNOP//KU8iw6bjRH285STJ2NGBR3ZLdk1R/IVRvutL
 JSwh51BIN4Y8ltE+rbCMzr7vqiaRcZlZcqFZWBWSiaRDUVpC27qEhgDCE w==;
X-CSE-ConnectionGUID: CqLLlf63SJupJpguKlUl9A==
X-CSE-MsgGUID: hvmkt6RpTxOwGJwnyCaUzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="586641"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="586641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:13 -0700
X-CSE-ConnectionGUID: MGeZTUr0S+yig/HvjvdxUg==
X-CSE-MsgGUID: gqOcI7CyRTGB6QhR31d42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270524705"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:29:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 07:29:10 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv85hshtTpaojgQ4oIBUOC1zfNe68mMFqz6abeSXG2XEfNpJIkqNG6qcV+0/A+YAsJbtr4buk1OEetIhIt0t/s0y+IJ9Tqna1WX2/C4c1NPuhM7HUdhkdnok818bGTc2VT5H5w6d0i7ltn48sowZ16ec88OIN15pTrOH/WPhyQWXnrxTu9eHDRNP8eRtq9t7CN7qogdL030bDB2Ih2AszPfiiTdU0PWHxsZIWCFxuipS4jCDWFKZH3J6x5/LNfhmTTW1bPfmlR0cuDWGjpOGxkDtqQOic3GrhC3iAdDclcaFwNWcM6VCvb0p8MV76C/ZR8v4U6GCsmYAJRD7uYvkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD+Kc67SW2zhIY1li86NJYXmvfeiY90/tr6qjzGHWt4=;
 b=Hujlu6erhC29TLD4uWDDdWndSMKcU5UjKUCHd14Zzo84XemVDBNCsH02QDcR/8AZ2QgXwUfX3pSXFQkLu2FOxqoIIYcIlLgPMT9prn5+8373dnfpbMGZnsj25snW/OuylgFoc6WEP7E920SCefMdaIQSu8O0VuznmZw3k9iFy13PFRAAcIHdSDPD1Y2wZs7ZbCApRWjj7GmilAb8jlMesmyYRXHPInnwa0JiYbKG8PTAnNdsOBsDV/qOwouPOOfAs8IJ8c2gSjCZQZDPN78dgZseDuGTGBWMEEmOLLXk+1tGK8kogSeIEkgxTSbKnRwaEwR39J3S9Qp7+NsqDpLBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 14:28:55 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 14:28:53 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t, v3 2/9] tests/intel/kms_dsc_helper: Add helper to
 force compressed BPP
Thread-Topic: [PATCH i-g-t, v3 2/9] tests/intel/kms_dsc_helper: Add helper to
 force compressed BPP
Thread-Index: AQHdQjCod5R9I5qq4kqFQnj/9lwtVbbS3Klw
Date: Thu, 17 Sep 2026 14:28:53 +0000
Message-ID: <PH7PR11MB67961A3597D1E667CC734B18E5B82@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-3-swati2.sharma@intel.com>
In-Reply-To: <20260911210709.943683-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH7PR11MB7429:EE_
x-ms-office365-filtering-correlation-id: 60fe92c3-b5b6-4c38-3939-08df14c7fff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|38070700021|11063799006|10067099003|4143699003|56012099006;
x-microsoft-antispam-message-info: pcuYOrtc4PlE0HRG61Lpy9c+3EkL3F60zYDIjlbr+wOdEvdMHNGf0+SP5jIQyrZP1CBlY8XonJnpIFGLQnXvJgw/SK0rYtQDaJTHNQvFfVaeoS3K9zQqDfQqM61iQh4DB4Ney+iHMrSDe+7FGIvBepQGiRcZXk2kBFWs+Z4CspWgQYLKlIeG70XIF1cgVojeVTtMn3z+ELiibQdybGDNZatMhP4T+oOaGOqEu5GZ8J0PhEiZ6yhOqnx5iY3syEJbz74V0ezXyw3o4bZ1XVqBWpktexgO0e9X+lIc3V0RFz0Jv3aKqc/1PZsn3WSNOzyCBCSBvg70Lzx+8YZcDjHJ0Zs8HxPITNUfzzInNnI3P4LSoiV/vmWLHrDEVsmdMX0hq6OXAWk8logFWPncrYodVvg4s6pLwuZXeolDNWzt7aDJ3RCn5C72qiNuMz8xTxbs+Zat55FybjUchyj5qGrYqf4t67IqaBxA8bnKKRR6e6BfihrvxmxSVXGAHZ7EUPKvavJSEvqq7EoSU4foFAh4nDRM2iT4uWUS9vToAbF1VTSO+2BhQdGjQhJ79+IOEknqDuZpNLGJKu11SteXXt4XyjdJIQ+4UTN7l4/Tl3o2GkQ1IxyAhQ2gLubohWMOwE+ZtpzQHJaInQy/t+mN4wLfn2bphlmcnslALeRaGq3K46VLpK8tLFeo41wQlGB0U8I2YMcwVKa3kPbI+LSIwtCtE65VmRxi/3cf26EaIDPcYGc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3TYf1qDkvBm612YEanC8VqcVmn5WI3Pr+sDRwbdTYA/P4cz+THAE/pBxrZdU?=
 =?us-ascii?Q?WGExEIoU2O92XWMhJuPlOtauNs3dZ5HERdkQquFXbjzQ1P7PkJET+B0w9fcN?=
 =?us-ascii?Q?y9bcZysCM/h6WgyjoYKGzxjrZ62Z9MA7gkbxCpjXwUt4iQaidlOO1kxXmiez?=
 =?us-ascii?Q?g+aJ4zSfo4NW4MmALUJeqdrrGdPAL3JvaijOzImDO5/Ts+msBW0VMhRcOnJU?=
 =?us-ascii?Q?QVwcVO2zN8w1OKuUaIOsU1xeEQWhGwixs4IMUxWsZDg9mekxahxJ4YlFNzoq?=
 =?us-ascii?Q?7CyprP/3qk+4aj/qofPDAmI2BAPZ/SfKfDecmS9NKpOlqbwjNpVMuzNwJrDl?=
 =?us-ascii?Q?Fh9bQ/qzESBxLG2PTsTmW44f/mSaqancQaiXanR67+iHUIX9Oob6ocny466o?=
 =?us-ascii?Q?RkEvncPFyhc3rRt5R+7UOKFRqC1R6svV7qY0g+00ADUBxgK9XLw35lC/tfb5?=
 =?us-ascii?Q?enIGI4KD283YNDaFHbE9OZ8SdHTsE4bA/U9c4LrZrghC339ZkyGHVQgXlOUu?=
 =?us-ascii?Q?DzOFBYCTQ8wCMnnueGMCxhXuOuLwLtJbs9e3JjAQ7MNTZZocOb/23NHctZYL?=
 =?us-ascii?Q?rxooclHb7+lejQ596xIeNtr5fXotCJ7IiYvRv9a4VWnKSRGczo7Be0YxWvNY?=
 =?us-ascii?Q?uLYE9v5VhtO+16VnJZkFzKOI0NXWc5GkxEpqXncXx6kz95EoB0J19+0T1rKQ?=
 =?us-ascii?Q?9S0KW2BlJzSwmX8Yt6wB/c8bRnKEsGwXJcyi78OGAzVR17jxNK73LjMmbu5R?=
 =?us-ascii?Q?Fr9tKPTBbm0IesSV0oxeLYKqUfUeOmg1QGByiVFsl6A9xKfYX2alv5CgmmS3?=
 =?us-ascii?Q?5u+feWHbePKkd5EFo4E1LNTdrAsSphTEMWWDbl/mOMsdS5dQQPJxUHSsKd48?=
 =?us-ascii?Q?0JJUnbA61wZklsHhoWYAFFX5UZlPDTYMKB86Lgb2M1pceKsSRTSIPY7ajru1?=
 =?us-ascii?Q?VPFC3+O8XiwhOGvhu40sHFqsLkt/KrYFRY96+jZ9UYjR0LJ7fvmffMY0aFO+?=
 =?us-ascii?Q?JSfagu6AWHmmVWi+nCS/OiYv9BWpTwc0N2Ttrfbrcgo5VUAgP+J4VMbKbLE6?=
 =?us-ascii?Q?qWq+G9eoMvsHEyHwvApv6FYF9W4C5fxupt3P36108+003kDZJZDkEyoYdER5?=
 =?us-ascii?Q?+pxFLvdQWlRT2CTvdLWxPBXoCtu+CwN9hdYpaG4m+xMvFc64wicd+6rxzpFt?=
 =?us-ascii?Q?1PGes/H9Lye+WJz9QFDXPPTXmam4bkf4+pTV41LLDBcbivkPEGdWibuf3wPP?=
 =?us-ascii?Q?duWGHQS9pmRJgc7+v9HSASlMhSQenMOjz+6d4eG9jdez/vZet+AGbQeiqZOr?=
 =?us-ascii?Q?+PehKRzOm0iHsh93TjiKJi7ize/ZpsjsVwCMhnhJ4oN+QiD8HDYjggnNSWhQ?=
 =?us-ascii?Q?263xT1lZAplSgrdyW0iKsm/NbpvyfRxDImfIYjzTKMBXMd67td9pzqYHvo/g?=
 =?us-ascii?Q?+SlqTX902OSt1U1arbcbv5C2jhWlNbTwoBP6sUTqG3lfwj+/cipMHdc6zANH?=
 =?us-ascii?Q?1trb/E/KVe3pE7ZQzCQMZ+f8HRojrL3a9CHZhNPrqSVEF6zy6F23ecwD+NhM?=
 =?us-ascii?Q?cv2e+uNrmQ7m76A1iif61JN+hXslVbGn/imw/q5mLd2NTJfgRzgw5/O920Vx?=
 =?us-ascii?Q?igaXYUoiR0xV9JgbYdRc/WYradTSrEwujT124IkGIQ0LjRc0meCwRBvQ2oz8?=
 =?us-ascii?Q?NQDNtge1m7nOZy89S2UzNVc6qHaFMJ41oVGps71YC9S8wLO5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xSg2LnNJqBS6/d2uCjHmjPrT0iqdEBkU6QJCH5FgzZcwuLYoh7Bz0vNzaWsz5qUIm5ALMGwvLLMOO5AjApvsx4doB5FRJucSc8dkcedvTSlTEzUU4a+6mf3KZQrChbnagzrRLvRX4ts8TdijiAlywOE36SeXvUGELRiz9TaeApPGj9oL+vfHIqYz3D2RDlzAye0H3j42XBNqiAfGQeNztyJaO+zE1eB+InrqlR+R39s1jFsQgMfrnxB31Fk69hcXy/rr3pfMdl9BhyJXCJkGC47+BmZHg6wXm/ad2JgahoPO1gQd1FAbzXDLcQe4FgjFfpOrPFJ4ARqvyowtiFoCnQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fe92c3-b5b6-4c38-3939-08df14c7fff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 14:28:53.4924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjqCU/E4D5K2ZghUffenOmJYagaGoEEycEEuGflzs3M8u52tXRsB7k/080UVtgecKHAL/Oh8f0jdQfo9oEU+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 12 September 2026 02:37
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t, v3 2/9] tests/intel/kms_dsc_helper: Add helper to =
force
> compressed BPP
>=20
> Helper function is added to force compressed BPP.
>=20
> v2: Rebase
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_dsc_helper.c | 10 ++++++++++  tests/intel/kms_dsc_helper=
.h |
> 1 +
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c =
index
> 9f581758f..50de12fe1 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -29,6 +29,16 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t
> *output, int input_bpc)
>  	igt_assert_f(ret =3D=3D 0, "forcing input dsc bpc debugfs_write failed\=
n");  }
>=20
> +void force_dsc_enable_compressed_bpp(int drmfd, igt_output_t *output,
> +float compressed_bpp) {
> +	int ret;
> +
> +	igt_debug("Forcing compressed DSC BPP to %.2f on %s\n",
> +		  compressed_bpp, output->name);
This also needs to be changed to %.4f, so the logged value matches
  what's actually written to intel_force_link_bpp
With that LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>

> +	ret =3D igt_force_dsc_enable_compressed_bpp(drmfd, output->name,
> compressed_bpp);
> +	igt_assert_f(ret =3D=3D 0, "forcing compressed dsc bpp debugfs_write
> +failed\n"); }
> +
>  void save_force_dsc_en(int drmfd, igt_output_t *output)  {
>  	force_dsc_en_orig =3D
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h =
index
> 542fe46de..ba616468e 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -24,6 +24,7 @@
>=20
>  void force_dsc_enable(int drmfd, igt_output_t *output);  void
> force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
> +void force_dsc_enable_compressed_bpp(int drmfd, igt_output_t *output,
> +float compressed_bpp);
>  void save_force_dsc_en(int drmfd, igt_output_t *output);  void
> restore_force_dsc_en(void);  void kms_dsc_exit_handler(int sig);
> --
> 2.25.1

