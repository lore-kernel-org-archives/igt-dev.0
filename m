Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36157C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 16:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D127810E8B3;
	Thu, 18 Jan 2024 16:10:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF46410E8B3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594235; x=1737130235;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rffnO4UQ+SjU3ehCLhiEznrMETzbKXF2z5yDexN4MI8=;
 b=XiKhzRJxOPVFUd7lzZc5ZIFN7A25tE5dj0rgexJoI2Vj9BsoSpkvRWQU
 1GCugS088L9uN0bvWGGY2i0ZONgKO8ziolQrkw0meik4d7IeNj7CS0sPZ
 Wqx4/LIioUlJgPU+dhSux3eCfUvr7+rwqbpce6FXt4enpbCa1WTGZ+sRc
 7gShGQvgaKuakltx5UYhcjXxtsGkdncckv71pfqadIFVc4vdd6F2vDoOV
 Nq4JKUxmnVkTy2WXAWjc9wlNwzhnroHHXC/VzWwTJUWRQmmq4ZVjh9OnC
 bmQXUzvFm5azM9DENgsBGy/kzUypzUn82G184+XU8E2j0n/tYzma3DsfG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="382563"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="382563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="26797081"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 08:10:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 08:10:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 08:10:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 08:10:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 08:10:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+/ym+KEtF45eWJZrJx3sLFKe74gsUb6t/e1kdbiCiHd2svEllCsjlsXDaMg4lUyTmyh6h1PpmTlqsUU/YLbiPTcC4sYgds4HkzS6z8+WpD8RIYnmSBZiAZe5xH04iF1mSDetfO3DriIKynycg1wtZxh9B53X4y2RxNDCsG6qV3I0j9G2nppz9GNYLmyJJNyBVtIGZkr9N63Y4AdM4kJ46tXbwJ90T4oIoPe0yl8xRC9IGaFywAjJ9L/gAABmAjf2ZgYjwswLEyq5eEqtoLdZ7xZ9stKpcVncK15zUYvZy+1Qk3qPeDJ4PZjs8JokoV7UGDiYDGiHNvmgPahRAOdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2dQaSNf/YWnT3O8e07a0aKh69TWKUbmmQNjkHOsP3U=;
 b=LIblGso9aRA81o/Q8f4UnXS/QVhPERExqmACR+7T7QowApnK5XpedGNHyjkqG4EkZtoyHQ8/9f0ErtiRrlhwPFA/1rwmrWqh1hf8MMP/3lS3faJ270D7jO6SPxRX4JrxDcmj33JAbDlix5NKYwiK66V9jFM9K9KtNNfGI8OOrSJzZoN6ZfSgJMBbHPuTwj+XlM7aTcsGJG4vE1aF/MfD7AGBkH76ftF0nLaOoZnRDGjVsJBTJ6Imsfy3Irl0o7jWQg27sSYIU4xPeuTPkaYWhORMk13ljpZ8AzV9oqRNo402W4HJcQmvpxLZ2aN+vRsTHuyFGWei3//aWy7LoqXSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 16:10:24 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 16:10:24 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if
 SLPC not enabled
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if
 SLPC not enabled
Thread-Index: AQHaShznWdHwOTtZCUOevH2SjRM20LDfvPXA
Date: Thu, 18 Jan 2024 16:10:24 +0000
Message-ID: <CY5PR11MB6211CBD9D475EE9E5A0911C395712@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240118145636.1775115-1-badal.nilawar@intel.com>
 <20240118145636.1775115-3-badal.nilawar@intel.com>
In-Reply-To: <20240118145636.1775115-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW4PR11MB6786:EE_
x-ms-office365-filtering-correlation-id: 4223687a-1fe8-48c2-416b-08dc183ffa5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IkNSFJHpnPhwkcQBprc7QSkqnc8DlhLviO1iPN5P2Br+QbLH89BDDcZinDct3h0f5TsJpjpdVS5PUGFIHiicZV1DEop2lc1mnoYH3WFKRt84kr21GtOZLKnGeRcmRIwJNn6E9ZCP3adu8EhlYDJRa77wK/fU8IGm9WjHcU1SPSTPnLah3Ri+FZqK9GNge65aS3nC1qRALPsLmvFd1caMPJingAcg2Q4S1XXtBxHpkDZjPoVpQx6cx+f1ZfSbnYMNbxJ5lxYOH0fQ4YTlnB3G6F0r/3O53Ajgc79mfjoF9cTW907lFCwc1/5j72QBPiPqwSrZGnH2hVIJeOt15JzA8eVsNUKLIxj45y3gUHdx4AhjCGCunQuGh+4lAdP13v8Ixb1+4b0nFFh7jnY7gL9oCtx/lWBbC6kz2vD9JebRkViDzh+AyKgRe+3jZJhvW3XtGJCmN68dW0oPonWwrBMvopTdr/92hdeZX5hYk/gt4kQGzyvbRkniCtchQ2oOvnnmRIbRWwVsl0ZRDDOrshwmMmN4e13RV9i6XxQ2HD0Heur2P9Q9j3VuXsQkjZf5N0I+SligiZn3z/EmRjcLNLFshnj0K5Dfoy/RFkPuFAEt7qg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38070700009)(55016003)(5660300002)(26005)(54906003)(66476007)(66556008)(66946007)(76116006)(53546011)(9686003)(52536014)(2906002)(64756008)(107886003)(71200400001)(4326008)(8676002)(8936002)(478600001)(66446008)(6506007)(316002)(7696005)(110136005)(122000001)(38100700002)(82960400001)(33656002)(83380400001)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ITxgZELI+nBwh8vo2Hh1WHy+WGm6GdHvPzCVgXkrTEOt3LFluLjz9Ee+VxNE?=
 =?us-ascii?Q?VInTfSjBBaFX4IdyVl8WtVhHc75gQfqCKozkIraD3nUwYjpgK+9lSbTDpA80?=
 =?us-ascii?Q?a+9PqEAYAkxixJGakwS54pIhBDXDxOl4cDmPpbL66YvF41Ci/MRn9RN76GyW?=
 =?us-ascii?Q?sYnDOjEzBF6KknKas6nCznk4CAYCqSTdf2sOxIhmOiJsuHal2/TExnJC7X39?=
 =?us-ascii?Q?f4aA9gdbxJhF2d+YBCKZsUIwA/MJsldNTrKwGuBEw04IGrNg0wzKUqgs4vKN?=
 =?us-ascii?Q?b15V/dJdFk3ZOr9X9BUosF3cvawrCOEvNB5kPSRemRIOiX3zujirACNdQfnt?=
 =?us-ascii?Q?z/yKpdf28EpUfZ526W2AIaKGFeSnsE68K664wy9J/vWFUro1reIy5eHQYYl4?=
 =?us-ascii?Q?DSqAxwIXErTKiJTTqJp4/sHcMzYODUveIRER98RFB3808FTaDo/sS0BfiV5L?=
 =?us-ascii?Q?N7HetDanpcZmUEpofLNXnh/hKIqHFF+do5USEogGxgh6AkqFSF68jLpypo8N?=
 =?us-ascii?Q?AgUFd+cr9omRK9NJg8Zho/TkgcvMNG4ieCJ+CtTDQ/s/n8+47+PxTaYR4jvQ?=
 =?us-ascii?Q?eItEQEyuQB6gI20pj3ITZDDEDlhZ9tnHTOwBMXLCzjvwpXM1WX28jetoxH5S?=
 =?us-ascii?Q?QgqNgaCMDyCWlMI2A35s8a9yzCppEx+lmPk4yqMh4Al1pf91j6ZvDL/8Kygd?=
 =?us-ascii?Q?LjEePih/Acnr0lg66wAgSYkhQxfDywrF/lgeQ3kRqo/enakWLbwIwNVH+eFZ?=
 =?us-ascii?Q?y4GUVmNO9UiyZzCv1Q3Jw5H6JMg7PnkjxWx8qy1f7G0mREbTAxroIscxm6ti?=
 =?us-ascii?Q?ZTiTqyyoetKIa1uCzCKbCv8GJQzaXft3e8ErB+VPaZ3fvQjdjykf4mEQcsOe?=
 =?us-ascii?Q?IHPKc/8eC84fc+kxM3GW3v5d2afkJJfQ1EB6p4/Z2s//shaD7DHxkCY/XE6J?=
 =?us-ascii?Q?Cz3y1ESy4QBGjYeusbSg/2mcJBrQkLFARIK9zQGnaI5eyYyaIZvpMuUe3NYN?=
 =?us-ascii?Q?g9wig8Te2kNemMSoolMJ8yR9NV5yFCaK9o4oeBge/c+Evm+gMJoc8VSCcdq3?=
 =?us-ascii?Q?NiA7mAYkOkVRb2dAkMeP+tCLthX86qStRJ16RTCGKHvcbPIawmYjb7d3f59W?=
 =?us-ascii?Q?rJU5XmeMLuE6241ezhvxDWbvGVwpSJwUzJrwae4TBzbVjFDSRrLgPVw4Q1Ph?=
 =?us-ascii?Q?dpY92zuo5SRAmPTkFokAeTatuhQDrFBpSopSsAIB4wJqshSo0uXX9SwFL8on?=
 =?us-ascii?Q?em8MaTZUFugyIgiZDGuyizoOQRFxIY2IqKCmTpa6AN0laT0+aEg4ASyMmZPT?=
 =?us-ascii?Q?tGXUIw6T67T/7LxZMRidfI3Uk7UwaBK8eWVLe9ZihjQxIBtjg15FbUL36NgD?=
 =?us-ascii?Q?t2WsYdTBaW3x9MkyjM92mxgajiz49M0Jl4LYum82QJVWU7pDVPdWuch8ELSV?=
 =?us-ascii?Q?hdOOew/uqIjLCTKpygyLELNbOJ7dk1AgdSJRTxwIEIxbTYeYxH3iIhICSbRR?=
 =?us-ascii?Q?SxKF43XRPJZd6y+G5w9hNg0kUOUChh+wSZOYWPiMCcnSuFXvAR46qg6YIJoG?=
 =?us-ascii?Q?GdjV+fLOsdTmN2RAp5SpcltvDNUnZ7dL30tH2Gsm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4223687a-1fe8-48c2-416b-08dc183ffa5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 16:10:24.1548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGOV97OGn58zVEYR1S5e3f59lkZnc8sAxsvhLwT9XQ9ZP+nweBWv5oDTuLkJ5n6LF2r9HhzpwpPVC9201v8z12vNUV6AUomKVKcPg7BEI+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
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
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Thursday, January 18, 2024 8:27 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if S=
LPC not
> enabled
>=20
> Skip GuC PC tests if SLPC is disabled
>=20
> Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  tests/intel/xe_gt_freq.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c index
> bf63e4298..853720297 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -20,6 +20,7 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>=20
> +#include <fcntl.h>
>  #include <string.h>
>  #include <sys/time.h>
>=20
> @@ -319,6 +320,30 @@ static void test_reset(int fd, int gt_id, int cycles=
)
>  	}
>  }
>=20
> +static bool xe_is_slpc_enabled_gt(int drm_fd, int gt) {
> +	int gt_fd;
> +	int freq_fd;
> +
> +	gt_fd =3D xe_sysfs_gt_open(drm_fd, gt);
> +	igt_assert(gt_fd >=3D 0);
> +
> +	/*
> +	 * When SLPC disabled xe kmd doesn't create sysfs freq entries
> +	 * so its enough to check one of the entry present of not
> +	 */
> +	freq_fd =3D openat(gt_fd, "freq0/max_freq", O_RDONLY);
	This is not scalable  solution for future platform, which are not using sl=
pc. Such platform can still support frequency telemetry.=20
	Thanks,
	Anshuman.
> +
> +	close(gt_fd);
> +
> +	if (freq_fd < 0)
> +		return false;
> +
> +	close(freq_fd);
> +
> +	return true;
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -329,6 +354,9 @@ igt_main
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
>=20
> +		igt_skip_on_f(!xe_is_slpc_enabled_gt(fd, 0),
> +			      "GuC PC tests are not supported when SLPC is
> disabled\n");
> +
>  		/* The defaults are the same. Stashing the gt0 is enough */
>  		stash_min =3D get_freq(fd, 0, "min");
>  		stash_max =3D get_freq(fd, 0, "max");
> --
> 2.25.1

