Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173B8C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 14:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE1B10E649;
	Tue, 23 Jan 2024 14:44:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF26810E7F4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706021073; x=1737557073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gun9UsWkJVU+ljkoialMhSNT31oEDrvYorAHY2gk6KE=;
 b=BSBw1M0jcPgfTNmN7rVQiihfPcX4jfgbSRGTC0XC82Bd7DMUTj4Ru6t9
 fqoWin/FMG4zpAh7BUBnqMRmcFbvQ2nAz+Q18HiyJgUdu60UMkTa+F9jb
 GJ7/m9x+4vZyLAL5GY4Uh4L+nLcT2yjqbkuz2r9PwJTUeTAyVPD7/R0of
 JrwnBH13ex1Or1YJLVvWMYx3w2CBGkIJ0CpJHIL3Y0ugvquMiGnfok7NB
 XRNfldcwt282gzM/Lq9FlS8BO+dlfrhHz86RdKsf2hhV6A5t943IvQYpE
 m2RhdkV2N3TawYTTxtXFT2vu193oOZ4pON9QFVbQsY7x4TH2xFdCZB38+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405296661"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="405296661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="34427317"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 06:44:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 06:44:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 06:44:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 06:44:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDExy4eMGoFasplnI0XS6LysUSMeKQm2la6bVC1rAVG1a1zhJHawMnX4Ihbu2YO7Kv0Uybo2pts9/0otYK7lhtcUZfGsofKyxbd8M/1v7QRey4anCgzrOI+IgCCWnpXXCV8/FC3eep2AHydUpT/B5zHDHQAT9T86FQQoDkr5urtA1gsEedBgASnqeDnAb74YtWq7ePROysW3KaLgAXFYIbT/G08jRCBdDyVh9oRAKoRZd9zXwU2gCrC2K0BSygclZuf+8LPaa9Hn0E3n5iyoXqbLxTbWZVT6tRg6P0AH9tRd4t0xQaachdst+HxyRx6svVtmd/9iMhZ+DDIke3V/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5JLC1xsy9nkyY0RDaj76ACVOPMouG9EDKQ3POf0HrM=;
 b=ZkWqwl+Uq+QmTuLOyg2LUhN9ezmEkpzd8szUS1USpiumF4gZgiZCqrhQPC0okpgZ93wpS464m+6Ye+U7gJuV/CmORjfZYKxbG4S+hX1P3X3kKFYzdKJLnUhBDqQQ+3d8YefkHYq1cxvV+q3FAjISJ8PsX2l7OV6MwAovDMxm1f0NEV1zG69FUmQmQSWOAn1AuIcoR8uaYHX+NuxxlEa+AFQDbOgdHh8dPuUDolVDL8bhQpPH3zbhngtBnie/7O3JoTWa3xQy9ZL95NqaNkaFi9wCqHpXVj/3sZp3tL1JnwR5ICaer0/WjGLIZDVzhEUqkzD73LciTKJElAF/8JtBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5583.namprd11.prod.outlook.com (2603:10b6:a03:3bb::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Tue, 23 Jan 2024 14:44:25 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 14:44:25 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode
 only after checking enable_psr modparam
Thread-Index: AQHaTgXGRk/WzZChWkG1fydUHo56a7DneS7Q
Date: Tue, 23 Jan 2024 14:44:25 +0000
Message-ID: <DM4PR11MB6312CF0BD267C21012890BC290742@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
 <20240123141835.1211107-3-kunal1.joshi@intel.com>
In-Reply-To: <20240123141835.1211107-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5583:EE_
x-ms-office365-filtering-correlation-id: 915f576c-02c9-43b1-d4ed-08dc1c21cbcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HtPpNIGQQIpQM/9VV8KiIkfNYKlaAy+CMr7kWIuhOiCdn594lAtOo/fxw0YEaX3ZQ1BrhA/H7SZvJcg2BgFEd/VrgkJ/qibzGSRSjJateOsXqMbaLXkejKGEHXuHpuhhk9pxUQUx1nudlILmQKUC+7/ZH3dvWWT/JEKfk8wtDjJ3Id5c1EjeeappJjLcAR0SSxqD1oBF5BRKsF+nvJJbznfLuSvJyM2GfgVHi1YfVq0AMcZRQ6op91Z3yEQ5ishlHZf/4NzuG75P8r8hdckbb7giHR+YZyJyeyyPIwvbWhsmLlKh0AyapoSbkn/pUpMz4qSOysestnLEEhpO0jIeNj3o+RsQcXrYDCx9bub1LiMwkzlz1ySFbBsufYrS4MU8BZ0vPtplm4r7b0tzB4ZRaQZbJyhXaqrpKUslLwSm/cGOuMb6iw9M1SYebM+OMI7ODjb+54KWmJhc1JAuOWmzrVg76IKJtcGPWB6WF7SXVUdc4NMqA1fzlCCptOsyMNxmXXFD9yGKLM7symfpDaMsAy5OboL6FF2yGXq3qMLZ5JkovsN8PAUz3HEL5vpi/8dBvHwYgeqxn8J1UAIQrT22P45G/SUGWxJMTYpCuP4LWr/hWMSjhe3xXzXhU9DGC6U+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(52536014)(8676002)(8936002)(4326008)(38070700009)(83380400001)(122000001)(55016003)(316002)(2906002)(41300700001)(33656002)(86362001)(71200400001)(5660300002)(26005)(66946007)(66556008)(66446008)(66476007)(64756008)(107886003)(110136005)(76116006)(82960400001)(38100700002)(9686003)(7696005)(6506007)(478600001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?czmdL0eEOa72jU72nYZWTfWPJ7WDyaq6lHb2X1/+vLkqNITPtgVtM9sYZMe1?=
 =?us-ascii?Q?UK2oOZdbzykp1nMP+KDY4ACZSPdYaHAPL5ClfcBe8+QNzJo43OkGLzlqbxiv?=
 =?us-ascii?Q?3WrWo/xoOYA0DnGMlzxZ2f2t5HgJvLl+BvygUvtgGxDgEPc2/mE6lqlt6Q/g?=
 =?us-ascii?Q?3KTFBKyaZeyIZXT9YiJZO220hL8ngPgCLjjLpdOq/C2KQ29hTKEgVRdMru9/?=
 =?us-ascii?Q?5Nv87SXaO9EqYzyVMneR7t/X16eFdCw6BQWfNOff774R9PKM2mm17SjWlbMM?=
 =?us-ascii?Q?neDgE0+EITt688SNVPRgG5gm6Ga2tUy2GKQ+UqjUVtllK48CJPdFKCXQIZvo?=
 =?us-ascii?Q?GnUisE+guCMHSU1cQzAAO/uTw1AAS0GY0XJNuJlEkIRxti77Z1uDXSJwE3Do?=
 =?us-ascii?Q?HTe0d8HQrZX3Jeu7fQZERYuzSYn+cuPrJwA6eS3sxV7aUE7SllqkoNIZvUhn?=
 =?us-ascii?Q?oNSLphLP273H3ZuIzoeHXEVGajZNvWLzyCFbt6xU+Ch/cAC4WAEsWkh/wGMN?=
 =?us-ascii?Q?H8ODpvQKoj7drNoLk1Y9I99EL0nQ0H2Gh/0yIik9gHRVZSBOEELq+oEm97Un?=
 =?us-ascii?Q?WDMHzEayxz7uCu7x+fqHyUh3tytbyiu2uHeWQCjrhRUv9SQdn6Fz4xgA2vcl?=
 =?us-ascii?Q?RkZrLmRygcuMCIYt7qjoi9Ovxtb2FHZB+AJCq6fS5j5V71zWTQYCKPmNg8Jx?=
 =?us-ascii?Q?rWTM4zfIxynbY74/YeBZlFOPn9PxTws1GPNlgGMT7kFo4HiPymMtmkGSlWqN?=
 =?us-ascii?Q?jG36rMn/m0SdMWWWKWzN+vaMWu2C7ryxT6BTKLp6nxE6c98QQQlme5zDyNNI?=
 =?us-ascii?Q?AkraUmdUa8u0dYDNBa1LokZ1/Yck37BF9/8XnHK9Nxg9T3/B/6sg1/fdLInu?=
 =?us-ascii?Q?6licTtOlfMFRNE/6HLGJxJWVFbxS4WHHsGGKDxJcN8R6hBgtPIeSoigoW8yD?=
 =?us-ascii?Q?lJ+8LNnUf6cHfnsB8e6ODsiWrNM7DDTinh69u5LC+MSpLWE066oCIdIRQW4b?=
 =?us-ascii?Q?EGqYR5mtdCmBuPXwEMF03b2jn/2za8Sagk6u9m9o9hhIClCn6fS5V3uynHO+?=
 =?us-ascii?Q?q+48sd7PKVpAjF9SfS5naJa0h3EBFvjxGXvX2/aXCSnSpWfrdXzGebJrAy+g?=
 =?us-ascii?Q?3Fn8RshmhHaL+a+Z4SUNwz8P2HVN6W1HFc3c/PR0k9VNuLCFPGJcOrkPxudf?=
 =?us-ascii?Q?7nC9mFjKym+6PphiAehj4M4qR5DmzieFvqry83qGOmI8i++3Xyf7FKSY0bB+?=
 =?us-ascii?Q?ZyARbCD0ht3w26mRMpJCeMiIaaaouvndYEW0U9+xYJ3Ygm0qyHgEzJgmiNuN?=
 =?us-ascii?Q?DLARCB/mnpFZ/VlQC7e6aBFcK+saw1Kc0O+o/6Y5Ed83hM0McVYalr4Bx2aI?=
 =?us-ascii?Q?upPooBvxmzl3k2uhAqd+lZxjorvaq1+Z/Is6DxKK62dBFxAgSz/R84wWlFBw?=
 =?us-ascii?Q?Ife4URjCMIYZwCRiX+SHZzSekYaZWukOnc0G1LsNeBBfsixQtQ+iMhiV3vXJ?=
 =?us-ascii?Q?q14mOSZwMgDbEyzMlwbNp7tw0ZaJ6dGS8JAkNFC5zu5ei07zHUS0HBxzFzpM?=
 =?us-ascii?Q?qSCugOZf/K2eERtP6aQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915f576c-02c9-43b1-d4ed-08dc1c21cbcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 14:44:25.8033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Na47Fy3JOZzhvPFSTOhGbF77eTtBWqyjvBjj1u2pYUK8iNNUAZhJYj9Vl1m7EhukNKTsFDgRLGFq1HNV8QuI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5583
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
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Tuesday, January 23, 2024 7:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode onl=
y after
> checking enable_psr modparam
>=20
> don't enable a psr mode with psr_debug debugfs, instead check what's the
> modparam value for i915_enable_psr
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_psr.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c index
> 349671b00..521d4c708 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -497,16 +497,28 @@ static void fill_render(data_t *data, const struct =
igt_fb
> *fb,
>=20
>  static bool psr_wait_entry_if_enabled(data_t *data)  {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);
> +
>  	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data-
> >output);  }
>=20
>  static bool psr_wait_update_if_enabled(data_t *data)  {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);
> +
>  	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data-
> >output);  }
>=20
>  static bool psr_enable_if_enabled(data_t *data)  {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);
> +
>  	return psr_enable(data->drm_fd, data->debugfs_fd, data-
> >op_psr_mode);  }
>=20
> --
> 2.25.1

