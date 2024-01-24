Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F9C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 03:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529F510F5D9;
	Wed, 24 Jan 2024 03:28:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635D110F5D9
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 03:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706066929; x=1737602929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UyTJqgt8M4QNVEOrCG7zMUIfkLrMU817XY0zDLl4FxY=;
 b=kQfdl/lz++7j4TvChBmuJD56k9AFQy6iOeOfAVOLzgH+tPihfbw1TiI5
 ddVUsbt8rDLJI6rwFzrdP1T5XFBDiP9d6sYCQ+syldo1ugHFoDI7Gam3M
 USK+ZC7IQjI8zQdB2/1hcYRj6SIb12fY0JCNAsX5DfSVT/2Rpu4gA4fKP
 HKQhUiH78eukt7t6x1AzRTm1JSx7gbR+LvGRyM3qWW/3wotu3ATIbt2Ji
 OsYB05tMlViHP0kRw+XpdAk+wWG8KOHnMlv7zqrW+ktGcKwUWZ/tICk6+
 Ud8Qq+LMj4/9r3c8avMcGwnf7TDPVwPEzTMz1IQVve2EeHQBDps60rSkI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398882468"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="398882468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 19:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34627948"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 19:28:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:28:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 19:28:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 19:28:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/8LsVxu2lIN+jvvOS9SkW6kzOfqVkKAbaQoJnTSkeg8xCqIU6VLb6NmDJ3DLUm1KugT1PZvyG0oBWWMqmu0Nrb/TZVMA1x5JN50o8LnfsdTNoF+m3q1kZCZl562ovn7edWWGyoek1Ug0qZdbPzwJv8zJ54TB0+YiUZ5r9KjE5fOO3lNRF1sia0TafxEEoqB3lxjLK1zh8V0iuhwlQfKuegaMXF0SCllcPBaioLp3LbHsDGOE3Pi3pec9jRTmQ9CD+diDxpkOOe60i8hc5WUKWQvVzfRVyfYUCc62r6/5fZ77M+0xHwqEBScepHsjZznc5Ga8sclk2pl42UouXSTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCHv8dJ+ZgH815FVm8srhwoYauh60gueU60iabl+V4g=;
 b=FRJYjpr5rvJ740/tnaEY04CndsHGZBAemDWzh5QC0SGJ8arwDxz6Ie+EM1WJlXELGamYCdj6C2NUYpTzyY+R21XtRRfbEzKN+iaI+9rhPje2AFokE+I+FWaL1n8QzKpHQvdMi1PHDaahEVeUYTXJDGVAOWlflW1Ud0gQsyo7djEj23c/lNGPKINa/7Pk+smk04e4v1griy/2/rMcApfhR2vwNBz66q1bojHPAFupbYu+k7UpXHCQrYz/aP9xchg6Rv1/SWMkNyZkPL71qNHT0pLaWFQjrGhvFnPgPb4hwdC1s+e23ElrH7jReYKszTYtxpS2LE3Bt0Nd1FVW4tDT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 03:28:38 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.034; Wed, 24 Jan 2024
 03:28:38 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] tests/kms_prime: Add XE support
Thread-Topic: [PATCH i-g-t v2] tests/kms_prime: Add XE support
Thread-Index: AQHaTnSOWhankPv7w0iw9CkDWjDOVbDoTLMg
Date: Wed, 24 Jan 2024 03:28:38 +0000
Message-ID: <CY5PR11MB62110766AAD7ABBFC0DA3CCF957B2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240124033304.17418-1-nidhi1.gupta@intel.com>
In-Reply-To: <20240124033304.17418-1-nidhi1.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW3PR11MB4729:EE_
x-ms-office365-filtering-correlation-id: a5dc7fd8-ae0b-4d1c-4dd9-08dc1c8c8e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iYhZnU83B1Ho3Io7Pvdd/CUZQ791TdhgyXVAUU6zi3TMgCrt9lIBxpfw4cpfCWsriUwR01pUJ6Wizla4iLnsTzTy4BoYQYQW/GbWY2GfF2Z3i4tVPcPoHNO/G1C5FG5V/La6Drqfao9UqsQWaCsAxFXUId4DL0srbgWiSlI4DLt0QDmRCiWuNjZiW2YbtRdrqfMujcuAWWktqRIJLDmroYsNc9UrcSjuJwTG0Frh588prJ6KmnbHeRM1bJ+VrFAWGJenDtXfv4IonkJuNKn8mM3xoh5cRJqh6hbWn3if6HB8hkvq1vCIMydIjw4bcgnWN5c4KSAbVuqevCPakeyLV0DS1UwUgOFyGCuvhxoOS6ktAm8sI8ooEoilLxK8KFnKEb0VPpO9fLfGo2zgfs64aYVFtdD9Uo6sw4A8Yf5h0WUJ/F6VCJ+RRVyt+Pie7qRnnlrFlV+NSYHZlfrAD7rkv0K0e4yoz3ww9ZijTewXMohde8bEyaXE/wgYhfqiWV+2ERLS9PXiOG4OhYPCV++loRwc1Jey8t6aJsd20Huo1gE4We1YJIG+7WqQFg5MtyH6O5oHfPMwXM05TG3fen588CcY7mmHM3yABKlHCwNSrOj8Fmf33uk7HmpqcYVOzfLr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(7696005)(6506007)(53546011)(122000001)(9686003)(38100700002)(107886003)(55016003)(71200400001)(83380400001)(26005)(478600001)(82960400001)(110136005)(66946007)(76116006)(316002)(66556008)(66476007)(66446008)(64756008)(8936002)(8676002)(4326008)(41300700001)(5660300002)(86362001)(38070700009)(30864003)(2906002)(33656002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tkoils78NbH9mTa/l9RKNhw0hCBA4ak+rk/SWuWXC7qL3WnIBCFcG5SpLyAd?=
 =?us-ascii?Q?t6QwiitiZrFPZE9yk5I25BlCoTlwjEbTlO32N1NOJDXjcgsRoM9bjMA2C3BP?=
 =?us-ascii?Q?y3OrqPpmGVdURpXlx3DrJCHDgNmJFxYo0c8vjR1DbkTPpMPvgZfUg+DYDFnA?=
 =?us-ascii?Q?7VsdQ8Hsos+qShsOt6/KiNT36+nSpbl80ri8hqSbtU+O60VKaDQ9nRY7Xcf4?=
 =?us-ascii?Q?Dx1SI7+vZQQTBeyw/h3yjHsLvGd/SqIZLkDklfS8hdHHXeWJCH1gV468EYxb?=
 =?us-ascii?Q?y1lVfl7K+ODCbAVrvH+JqdI79ij2YpdahsFWHCvTbzqkQ+PzIG9p9c6X40Ws?=
 =?us-ascii?Q?UMfxWhw6znK507pVt8dFs0oAsDOzJWapvZUHrDiYAFWl9135oXIkyWSfWgzf?=
 =?us-ascii?Q?Z8/Hj+L3pXeKJ5qNJ5nly+Jkip2TdfcvImrwhEWiQAACgig7dsRc/Kok5qiY?=
 =?us-ascii?Q?JH0WGc5iVGoU3frsEVZKApo9J/kjsZ8vuYG+QPp/OSkqmS9KJCyis63JJ1zz?=
 =?us-ascii?Q?JdaRJXWt+VDgJXJKBj6Orxyn4V0zfxPxDgKjR16ZQ1Dp2iPuMkrOSAnhaPH8?=
 =?us-ascii?Q?z+85aYnxDu14+3sguDoGamg7JqMyYayTJz5nK40gKtdk0JMQyMnhyXb5tPr+?=
 =?us-ascii?Q?aEx8KUme+38n8MPw+Mst+MapFaaoL54Gmhnm5kJoOptMuiVwImMhDciFoTiS?=
 =?us-ascii?Q?2HQA5rO2IhWYjgKnXXhq5JmtW9N808HirjXuzZ4E0v2p6qf8KudImeyfxITM?=
 =?us-ascii?Q?RsHbgRIiKE8V7sLDzzZQIFe188pSdA3Z2S04bjls36QPi+0CvtlpoDTLnxhR?=
 =?us-ascii?Q?uIMefTtaBYwazc0c5pUORgsU3J0QLJBH/NT3k7lfWpbZdBI9rtII+lKUve6O?=
 =?us-ascii?Q?7NAGrVaDCaH8aDCoL20Q5NfSLB2MwE8nR4fIoDpVTtU9vG8YAzBABEOxJ5gW?=
 =?us-ascii?Q?TIROqHCxny6DoY8Q7oAcENPxylB6jUSDS2FB9CotTy3RYB18gTtABWCKpqRX?=
 =?us-ascii?Q?dGuOAX9T0QubhQ3rNe/SyBHoq7s4s+JPSbd21dEk5zAaAyuW0Mrhi/M5+Mle?=
 =?us-ascii?Q?zgj9yInaAvWcy/25XHJ6EfWZ8L4Tm144f+o6nGDca2sIF9CQlAw+S/0etR4w?=
 =?us-ascii?Q?lE8mWA5YUeABLb1Wz/SSuULG/F0CwG+VqoeeXKxNi2UWiKako7i96zu0X9eO?=
 =?us-ascii?Q?bjPnLj80wlZLR9MXDZpfcVYUI6ym2INZtxFquA0pYx6vyylULewsbl/XXpsS?=
 =?us-ascii?Q?jAZsVPkumBG2E0b3Fu2+fDFJ+oTopG3x+q0LzDG1rlv6AyAYnQuJYClRBfCq?=
 =?us-ascii?Q?iSQkiHNLdef/lR+SOjYuyLqL0M1lOb7gPk0Ah1hOCyoYuZOIq5rOsJDdiuiq?=
 =?us-ascii?Q?8QMulUz55H0nDd+FZkFav9efJjpHHTx9aGpI+KmPqpR/ZV+j+JoZOKjec9nx?=
 =?us-ascii?Q?g95ui/FTc5v8Q2ffSxw4dRNLMfAkTsO590X07ln09VE2eFQveFJrO8mVtISE?=
 =?us-ascii?Q?VcEsFXVhL4mm3WlS6+sTa/sY5LW2MJP+ATh6jP5Ha57u2LD7i7cnK9wgqflp?=
 =?us-ascii?Q?S+6tEUNFTGjw8VKJsdcj84UH1DZsIJtM0m0vS8Dk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dc7fd8-ae0b-4d1c-4dd9-08dc1c8c8e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 03:28:38.8067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q20XJBXLIuSvuzu/bASMWVl80ys/kkK1lyZ8THkyx806mp8qY3UbzUy25I6AGYVxLWik8J9+D2mRHgXrqZP1AdCqmTKYIYpLxtXnZRiKQVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: Wednesday, January 24, 2024 9:03 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_prime: Add XE support
XeKmd gets a device wakeref in dmabuf callback , so any bo prime import wil=
l held a wakeref.
Therefore it will block the d3 state as well on discrete on prime fd import=
.
Please drop the d3hot subtest with prime fd.
Thanks,
Anshuman Gupta.
>=20
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>=20
> Add XE driver support for kms tests.
>=20
> V2: - Use rendercopy method for both i915 & xe
>     - Minor cleanup
> V3: - New patch for cleanup & rendercopy
> V4: - Fallback to blitter
> V5: - Rebase
> v7: - Rebase and patch cleanup
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_prime.c | 299 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 251 insertions(+), 48 deletions(-)
>=20
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c index 135c75168..03979=
0b86
> 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -36,10 +36,16 @@
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  #include <fcntl.h>
> +#include <limits.h>
>=20
>  #include <sys/ioctl.h>
>  #include <sys/poll.h>
>  #include <time.h>
> +#include "lib/intel_blt.h"
> +#include "lib/intel_mocs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
>=20
>  /**
>   * SUBTEST: D3hot
> @@ -120,10 +126,14 @@ static igt_output_t *setup_display(int importer_fd,
> igt_display_t *display,
>  		igt_display_reset(display);
>=20
>  		igt_output_set_pipe(output, *pipe);
> -		if (intel_pipe_output_combo_valid(display)) {
> -			found =3D true;
> -			break;
> +		if ((is_i915_device(importer_fd) &&
> gem_has_lmem(importer_fd)) ||
> +		   (is_xe_device(importer_fd) && xe_has_vram(importer_fd))) {
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
>  		}
> +
> +		found =3D true;
> +		break;
>  	}
>=20
>  	igt_require_f(found, "No valid connector/pipe found\n"); @@ -131,6
> +141,25 @@ static igt_output_t *setup_display(int importer_fd, igt_displa=
y_t
> *display,
>  	return output;
>  }
>=20
> +static igt_output_t *setup_hybrid_display(int importer_fd, igt_display_t=
 *display,
> +				   enum pipe *pipe)
> +{
> +	igt_output_t *output;
> +	bool found =3D false;
> +
> +	for_each_pipe_with_valid_output(display, *pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, *pipe);
> +
> +		found =3D true;
> +		break; /*Validation on single pipe is enough*/
> +	}
> +
> +	igt_require_f(found, "No valid connector/pipe found\n");
> +
> +	return output;
> +}
>  static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>  			    drmModeModeInfo *mode, uint32_t color)  { @@ -
> 140,7 +169,29 @@ static void prepare_scratch(int exporter_fd, struct dumb=
_bo
> *scratch,
>  	scratch->height =3D mode->vdisplay;
>  	scratch->bpp =3D 32;
>=20
> -	if (!is_i915_device(exporter_fd)) {
> +	if (is_intel_device(exporter_fd)) {
> +		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay,
> DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR, &scratch->size,
> &scratch->pitch);
> +
> +		if (is_i915_device(exporter_fd)) {
> +			if (gem_has_lmem(exporter_fd))
> +				scratch->handle =3D
> gem_create_in_memory_regions(exporter_fd, scratch->size,
> +
> REGION_LMEM(0), REGION_SMEM);
> +			else
> +				scratch->handle =3D
> gem_create_in_memory_regions(exporter_fd, scratch->size,
> +
> REGION_SMEM);
> +
> +			ptr =3D gem_mmap__device_coherent(exporter_fd,
> scratch->handle, 0,
> +							scratch->size,
> PROT_WRITE | PROT_READ);
> +		} else {
> +			scratch->handle =3D xe_bo_create(exporter_fd, 0,
> +							     ALIGN(scratch-
> >size, xe_get_default_alignment(exporter_fd)),
> +
> vram_if_possible(exporter_fd, 0), 0);
> +
> +			ptr =3D xe_bo_mmap_ext(exporter_fd, scratch->handle,
> +					     scratch->size, PROT_READ |
> PROT_WRITE);
> +		}
> +	} else {
>  		scratch->handle =3D kmstest_dumb_create(exporter_fd,
>  						      ALIGN(scratch->width, 256),
>  						      scratch->height, scratch-
> >bpp, @@ -148,18 +199,6 @@ static void prepare_scratch(int exporter_fd, s=
truct
> dumb_bo *scratch,
>=20
>  		ptr =3D kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
>  					      scratch->size, PROT_WRITE);
> -	} else {
> -		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay,
> DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR, &scratch->size,
> &scratch->pitch);
> -		if (gem_has_lmem(exporter_fd))
> -			scratch->handle =3D
> gem_create_in_memory_regions(exporter_fd, scratch->size,
> -
> REGION_LMEM(0), REGION_SMEM);
> -		else
> -			scratch->handle =3D
> gem_create_in_memory_regions(exporter_fd, scratch->size,
> -
> REGION_SMEM);
> -
> -		ptr =3D gem_mmap__device_coherent(exporter_fd, scratch-
> >handle, 0, scratch->size,
> -						PROT_WRITE | PROT_READ);
>  	}
>=20
>  	for (size_t idx =3D 0; idx < scratch->size / sizeof(*ptr); ++idx) @@ -1=
78,23
> +217,52 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratc=
h,
> struct igt_fb *
>  		    color_encoding, color_range);
>  }
>=20
> +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> +					   uint32_t memregion, uint32_t pitch) {
> +	uint32_t name, handle;
> +	struct blt_copy_object *blt;
> +
> +	blt =3D malloc(sizeof(*blt));
> +	igt_assert(blt);
> +
> +	name =3D gem_flink(fb->fd, fb->gem_handle);
> +	handle =3D gem_open(fb->fd, name);
> +
> +	blt_set_object(blt, handle, fb->size, memregion,
> +		       intel_get_uc_mocs_index(fb->fd),
> +		       0, 0, 0, 0);
> +
> +	blt_set_geom(blt, pitch, 0, 0, fb->width, fb->height, 0, 0);
> +
> +	blt->plane_offset =3D 0;
> +
> +	blt->ptr =3D xe_bo_mmap_ext(fb->fd, handle, fb->size,
> +				  PROT_READ | PROT_WRITE);
> +	return blt;
> +}
> +
>  static void import_fb(int importer_fd, struct igt_fb *fb,
>  		      int dmabuf_fd, uint32_t pitch)
>  {
>  	uint32_t offsets[4] =3D {}, pitches[4] =3D {}, handles[4] =3D {}, temp_=
buf_handle;
>  	int ret;
> +	struct igt_fb dst_fb;
>=20
> -	if (is_i915_device(importer_fd)) {
> -		if (gem_has_lmem(importer_fd)) {
> -			uint64_t ahnd =3D get_reloc_ahnd(importer_fd, 0);
> -			uint64_t fb_size =3D 0;
> +	if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
> +	    (is_xe_device(importer_fd) && xe_has_vram(importer_fd)))  {
> +		uint64_t fb_size =3D 0;
> +		uint64_t ahnd =3D 0;
>=20
> -			igt_info("Importer is dGPU\n");
> -			temp_buf_handle =3D prime_fd_to_handle(importer_fd,
> dmabuf_fd);
> -			igt_assert(temp_buf_handle > 0);
> -			fb->gem_handle =3D
> igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
> -								       fb-
> >drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
> -			igt_assert(fb->gem_handle > 0);
> +		igt_info("Importer is dGPU\n");
> +		temp_buf_handle =3D prime_fd_to_handle(importer_fd,
> dmabuf_fd);
> +		igt_assert(temp_buf_handle > 0);
> +		fb->gem_handle =3D igt_create_bo_with_dimensions(importer_fd,
> fb->width, fb->height,
> +							       fb->drm_format,
> fb->modifier, pitch, &fb_size, NULL, NULL);
> +		igt_assert(fb->gem_handle > 0);
> +
> +		if (is_i915_device(importer_fd)) {
> +			ahnd =3D get_reloc_ahnd(importer_fd, 0);
>=20
>  			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL,
> temp_buf_handle,
>  					     0, pitch, fb->modifier, 0, 0, fb_size,
> fb->width, @@ -205,7 +273,62 @@ static void import_fb(int importer_fd, st=
ruct
> igt_fb *fb,
>  			gem_close(importer_fd, temp_buf_handle);
>  			put_ahnd(ahnd);
>  		} else {
> -			fb->gem_handle =3D prime_fd_to_handle(importer_fd,
> dmabuf_fd);
> +			uint32_t xe_bb;
> +			uint64_t bb_size =3D 4096;
> +			struct blt_copy_data blt =3D {};
> +			struct blt_copy_object *src, *dst;
> +			struct blt_block_copy_data_ext ext =3D {};
> +			uint32_t mem_region;
> +			intel_ctx_t *xe_ctx;
> +			uint32_t vm, xe_exec;
> +
> +			struct drm_xe_engine_class_instance inst =3D {
> +				.engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> +			};
> +			vm =3D xe_vm_create(importer_fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +			xe_exec =3D xe_exec_queue_create(importer_fd, vm,
> &inst, 0);
> +			xe_ctx =3D intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
> +			mem_region =3D vram_if_possible(importer_fd, 0);
> +
> +			ahnd =3D intel_allocator_open_full(importer_fd, xe_ctx-
> >vm, 0, 0,
> +
> INTEL_ALLOCATOR_SIMPLE,
> +
> ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +			bb_size =3D ALIGN(bb_size +
> xe_cs_prefetch_size(importer_fd),
> +
> 	xe_get_default_alignment(importer_fd));
> +			xe_bb =3D xe_bo_create(importer_fd, 0, bb_size,
> mem_region, 0);
> +
> +
> +
> +			igt_init_fb(&dst_fb, importer_fd, fb->width, fb->height,
> +				    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +				    IGT_COLOR_YCBCR_BT709,
> IGT_COLOR_YCBCR_LIMITED_RANGE);
> +			dst_fb.gem_handle =3D temp_buf_handle;
> +
> +			src =3D blt_fb_init(fb, mem_region, pitch);
> +			dst =3D blt_fb_init(&dst_fb, mem_region, pitch);
> +
> +			blt_copy_init(importer_fd, &blt);
> +			blt.color_depth =3D 32;
> +			blt_set_copy_object(&blt.src, src);
> +			blt_set_copy_object(&blt.dst, dst);
> +
> +			blt_set_object_ext(&ext.src, 0, fb->width, fb->height,
> +					   SURFACE_TYPE_2D);
> +			blt_set_object_ext(&ext.dst, 0, fb->width, fb->height,
> +					   SURFACE_TYPE_2D);
> +
> +			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> +
> +			blt_block_copy(importer_fd, xe_ctx, NULL, ahnd, &blt,
> &ext);
> +
> +			blt_destroy_object(importer_fd, dst);
> +
> +			put_ahnd(ahnd);
> +			gem_close(importer_fd, xe_bb);
> +			xe_exec_queue_destroy(importer_fd, xe_exec);
> +			xe_vm_destroy(importer_fd, vm);
> +			free(xe_ctx);
>  		}
>  	} else {
>  		fb->gem_handle =3D prime_fd_to_handle(importer_fd,
> dmabuf_fd); @@ -332,7 +455,7 @@ static void test_basic_modeset(int drm_fd=
)
>  	igt_device_set_master(drm_fd);
>  	igt_display_require(&display, drm_fd);
>=20
> -	output =3D setup_display(drm_fd, &display, &pipe);
> +	output =3D setup_hybrid_display(drm_fd, &display, &pipe);
>  	mode =3D igt_output_get_mode(output);
>  	igt_assert(mode);
>=20
> @@ -358,12 +481,6 @@ static bool has_connected_output(int drm_fd)
>  	return false;
>  }
>=20
> -static void validate_d3_hot(int drm_fd) -{
> -	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "GPU
> idle: yes"));
> -	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "PCI
> device power state: D3hot [3]"));
> -}
> -
>  static void kms_poll_state_restore(void)  {
>  	int sysfs_fd;
> @@ -385,6 +502,89 @@ static void kms_poll_disable(void)
>  	close(sysfs_fd);
>  }
>=20
> +static bool runtime_usage_available(struct pci_device *pci) {
> +	char name[PATH_MAX];
> +	snprintf(name, PATH_MAX,
> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
> +		 pci->domain, pci->bus, pci->dev, pci->func);
> +	return access(name, F_OK) =3D=3D 0;
> +}
> +
> +static bool in_d3_hot(struct pci_device *pci) {
> +	uint16_t val;
> +
> +	/* We need to wait for the autosuspend to kick in before we can check *=
/
> +	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
> +		return false;
> +
> +	if (runtime_usage_available(pci) &&
> +	    igt_pm_get_runtime_usage(pci) !=3D 0)
> +		return false;
> +
> +	igt_assert_eq(pci_device_cfg_read_u16(pci, &val, 0xd4), 0);
> +
> +	return (val & 0x3) =3D=3D 0x3;
> +}
> +
> +static void validate_d3_hot(int drm_fd, struct pci_device *pci) {
> +	if (is_i915_device(drm_fd)) {
> +		igt_assert(igt_debugfs_search(drm_fd,
> "i915_runtime_pm_status", "GPU idle: yes"));
> +		igt_assert(igt_debugfs_search(drm_fd,
> "i915_runtime_pm_status", "PCI device power state: D3hot [3]"));
> +	} else {
> +		igt_assert(in_d3_hot(pci));
> +	}
> +}
> +
> +static int open_d3_allowed(struct pci_device *pci) {
> +	char name[PATH_MAX];
> +	int fd;
> +
> +	snprintf(name, PATH_MAX,
> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/d3cold_allowed",
> +		 pci->domain, pci->bus, pci->dev, pci->func);
> +
> +	fd =3D open(name, O_RDWR);
> +	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
> +
> +	return fd;
> +}
> +
> +static void get_d3_allowed(struct pci_device *pci, char *d3_allowed) {
> +	int fd =3D open_d3_allowed(pci);
> +
> +	igt_assert(read(fd, d3_allowed, 2));
> +	close(fd);
> +}
> +
> +static void set_d3_allowed(struct pci_device *pci, const char
> +*d3_allowed) {
> +	int fd =3D open_d3_allowed(pci);
> +
> +	igt_assert(write(fd, d3_allowed, 2));
> +	close(fd);
> +}
> +
> +static void setup_d3_hot(int fd, struct pci_device *pci) {
> +	if (is_xe_device(fd)) {
> +		igt_assert(igt_setup_runtime_pm(fd));
> +
> +		set_d3_allowed(pci, "0\n");
> +
> +		igt_assert(in_d3_hot(pci));
> +	} else {
> +		igt_set_timeout(10, "Wait for dGPU to enter D3hot before
> starting the
> +subtest");
> +
> +		while (!igt_debugfs_search(fd, "i915_runtime_pm_status",
> +					    "PCI device power state: D3hot [3]"))
> +			;
> +		igt_reset_timeout();
> +	}
> +}
> +
>  igt_main
>  {
>  	int first_fd =3D -1;
> @@ -438,21 +638,28 @@ igt_main
>=20
>  		igt_describe("Validate pci state of dGPU when dGPU is idle and
> scanout is on iGPU");
>  		igt_subtest("D3hot") {
> -			igt_require_f(is_i915_device(second_fd_hybrid), "i915
> device required\n");
> -			igt_require_f(gem_has_lmem(second_fd_hybrid),
> "Second GPU is not dGPU\n");
> +			char d3_allowed[2];
> +			struct pci_device *pci;
> +
> +			igt_require_f(is_intel_device(second_fd_hybrid), "intel
> device required\n");
> +			if (is_i915_device(second_fd_hybrid))
> +
> 	igt_require_f(gem_has_lmem(second_fd_hybrid), "Second GPU is not
> dGPU\n");
> +			else
> +				igt_require_f(xe_has_vram(second_fd_hybrid),
> "Second GPU is not
> +dGPU\n");
>  			igt_require_f(first_output, "No display connected to
> iGPU\n");
>  			igt_require_f(!second_output, "Display connected to
> dGPU\n");
>=20
>  			kms_poll_disable();
>=20
> -			igt_set_timeout(10, "Wait for dGPU to enter D3hot
> before starting the subtest");
> -			while (!igt_debugfs_search(second_fd_hybrid,
> -			       "i915_runtime_pm_status",
> -			       "PCI device power state: D3hot [3]"));
> -			igt_reset_timeout();
> +			pci =3D igt_device_get_pci_device(second_fd_hybrid);
> +			get_d3_allowed(pci, d3_allowed);
> +
> +			setup_d3_hot(second_fd_hybrid, pci);
>=20
>  			test_basic_modeset(first_fd);
> -			validate_d3_hot(second_fd_hybrid);
> +			validate_d3_hot(second_fd_hybrid, pci);
> +
> +			set_d3_allowed(pci, d3_allowed);
>  		}
>=20
>  		igt_fixture {
> @@ -470,6 +677,8 @@ igt_main
>  			igt_require(second_fd_vgem >=3D 0);
>  			if (is_i915_device(first_fd))
>  				igt_require(!gem_has_lmem(first_fd));
> +			if (is_xe_device(first_fd))
> +				igt_require(!xe_has_vram(first_fd));
>  		}
>=20
>  		igt_describe("Make a dumb color buffer, export to another
> device and"
> @@ -480,11 +689,5 @@ igt_main
>  				igt_dynamic("second-to-first")
>  					test_crc(second_fd_vgem, first_fd);
>  		}
> -
> -		igt_fixture
> -			drm_close_driver(second_fd_vgem);
>  	}
> -
> -	igt_fixture
> -		drm_close_driver(first_fd);
>  }
> --
> 2.39.0

