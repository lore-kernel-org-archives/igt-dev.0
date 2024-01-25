Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDADC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 07:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4073B10EAF1;
	Thu, 25 Jan 2024 07:52:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9DA10EAF1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706169130; x=1737705130;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gNu2e8Hkh7lpnBTrwhX1lMdX3kWjF5X1P9XVTpEnSb8=;
 b=CanbbKZ5juVtNIsUv4cV6sAGfWhiB0RzfCO5aT3+v1FOfCDRfq12onfH
 QA9u3CCIgON14LEO6Gwdr9I1+cxiYanbGidbLx+h+0tiKFxu6wTr+oz2r
 kTsJSmscgIZod0zd0do+Qf1GYFVJrXddBuL+KLxiqxzNZXHcfi7FxIrJ/
 +MFd5qGnKURgAPNu7oBWfsDKJSn9XteVx4FyULb7wF6ZBCFyvgfG/5Nck
 eEc/T1LE7hzFeosfB+CxJNV0Z1fGPGh3TCI4+D0yCiFgy2tKVH8BTNtC0
 f6A45mWA2DMPSKgABmUPiwN8BGSxY0YXUAZmjnHGcqBLC0CSIdMrBSsgr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400946866"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400946866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2140523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 23:52:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 23:52:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 23:52:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 23:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpvjRrpFchGz4eR3iyGAd94OZmLpqZrTVZ9BAb0FOlhrifxCCs2smO0FNHN+Xs9k7QXSzlQ84QK41c8xqL+hldBW/vYKhAaK62GWAoE707NaVmMiWQMExMSOdcqzdVxoRlU4jANlAtVUgmcgsx2S9fxPEVGaGDGgy/7Ws3ens2AoLjuthvYrGDlOuNnUqgTEmUPDL8o9nkqvStL+dakNmt4tUqzlr82K/u9wFfvYDFylAkzTtJv64l/+8ZDGE6SxABXiz4hE6mIFfrFr+HGfSMO/E/C+5M/bSBK1Im/3kCl33CTiJNbAYEf1/QhdEhDlmzDS+jFcDWiiAGk3GK12ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGFzpNRxPlupcSr7xOcpy+Og4JC5c8ap7JM72J57+4I=;
 b=Q7Y0D4cg99ljtu+3XKI5JFs3XcbssfM9jXffUAtmBef+dJWFcy3naI/yRwHexiSrn25dzMYDCWpwB9ybByCjKqmz7i5MjuUVkilBs20MMf5CmSutos9BezF0rHmSK7jq7n71xGHvIBQpSUrbRK1D1FjxQ0kgwB8cIZozwWbxtk0GLc6nvcf3cSAww2bXeKAtW7gvXxxPTHfSm5bKVLFnt5ltnXjNEu+ilnCNfrsHWEt0BvEZhO7AclfmoGF28QhTiGhzcA96cmuEur8VxjV/K2RweMM5sZ49eGJNdB9GFTGf3afddvhTebxHKKc+WNMJ1s0XlIfRdGmH+V1AlS9gyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 BL1PR11MB5495.namprd11.prod.outlook.com (2603:10b6:208:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 07:51:56 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 07:51:56 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Topic: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Index: AQHaTwXg85wbugtFvE+n6onNFvm+yLDqJ87A
Date: Thu, 25 Jan 2024 07:51:56 +0000
Message-ID: <DS0PR11MB7264D6CB83ED0B4ACD836998D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-8-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240124204134.71451-8-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|BL1PR11MB5495:EE_
x-ms-office365-filtering-correlation-id: 8af4a4ed-6872-40d3-4f60-08dc1d7a8106
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LihXbSk0K9F7FnlL+2vcOUYqI5urETKdQRV236aGc0z8kkbiCRDU1cVE+sk4ChQK/SfHxdu4TKka9EotecaN+vuHPE4iajSKNVsqHBXqWKsEc7zKrMpH3jlGiEjqjOkZdOpGQ5F2/mH1msI2amzRy1wljdWc5SPCrUojW6O121taY9+Q0AyVAwVoFKGj2c76ETKVpM6CaZearPIgnD4OWnEjfIjENqKrEafRXK8JAb2+LHBtG8sPEIKGaBzEHSJ0zin+DG8eAS2X/LtSARwrtbg367uybGcw57VWyHK+4qmJPFuDrpJHzvXMzsHuYxfmG3adD4dVnTAxugxeMzEkdAdG8b7o1ZuLU/AHwREQEvB8G8rQgNG3FnU8R9owHR2uJ0wvdPXPoQpxRPAGNiRzw8xdeY70JoK2spKCswUuR2UIiT6M12P61e35dfhlfmxFtD0Xi/7ER6HEMS4mwqm1DxZUlwUnIRUyPKlpL9vvyqakC0I9BJH4zJv7H20t87dOg0WXOSlF8uM5HT4kttyOr7aFs5IhuP3k1MpWJPHPRelRHd94vqP7ID5nKIys7ykiRuYwotgGn2i3U5gB2nvRX0qx4KXcQ6Ts1ae2iCv8QLAmW3pFlqFUeEf0QPaCSUza
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(33656002)(83380400001)(2906002)(52536014)(122000001)(82960400001)(5660300002)(66574015)(38070700009)(41300700001)(38100700002)(55016003)(478600001)(71200400001)(26005)(86362001)(76116006)(66946007)(110136005)(66556008)(66476007)(64756008)(66446008)(316002)(8936002)(8676002)(9686003)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?6LyKSGqMR767qmLzplQbKwQ8+GFHO94Y1xSJUnQ4PcMXx7sAt6B5i4rwsU?=
 =?iso-8859-2?Q?QyRG/jaK4r/k8iGEvPZg2d6LGYyH5hTt1UTjqrnktzsruphLm9Fc4988Kw?=
 =?iso-8859-2?Q?6DSPnnTUY1fIz3E+hPbQgB57qZKx1/VYSTdmSbTCSuepK13Hi/jZlMv+vO?=
 =?iso-8859-2?Q?WjQSA8Z3xI53zuBYSWctt3ZGm6hp3CY4/HVo2MFcYJxmx8/vtmowOv0Lrl?=
 =?iso-8859-2?Q?nx/KETdUVkEUj130cwcQFoxrHuA2up4dvzdW3jEoc83TqcSdTTDu1xRo9O?=
 =?iso-8859-2?Q?tdsys7DW6sLqGtGD6eGY9kkVLs/vf6xG68ImI2B4K7WUNv6Wq6ar1WiFsM?=
 =?iso-8859-2?Q?dwkCsLzy7W4ayeOjsRNX68UMV9DR/tbO1ltjysRRUY6MJwPgjyCi38pMs9?=
 =?iso-8859-2?Q?WHPNzTOSlVk/gDYAzB5fwizWFJKcfseoEQhASQBiEOGM5fLBw7BOSZzVW0?=
 =?iso-8859-2?Q?5rJtLnLao4cDJEx+wlPzzkz6dsCwhmo6Kytkt30xpvIaQPUg46FftDA5rY?=
 =?iso-8859-2?Q?N6d4lp6TevD7mJGu0wSZOJ1lCP40aS59UFytq9x7k4zJeIhDXVllDFIT5/?=
 =?iso-8859-2?Q?RoEDlVj/Vue+narfH8NPfDphWigkupO+0FZ9KuURLzL6uU/dz8SaD0zh3i?=
 =?iso-8859-2?Q?fVWSKP+wJnS7L95vtJzhmbxV76slRkg7NtVlb+GtBl7LazbyPx4RH04tld?=
 =?iso-8859-2?Q?tcnVVi6pnNrUFG+5OAZ3OlFNKfWsCIhXG6m1KDoLxSVI26HhDtsiMfC1CV?=
 =?iso-8859-2?Q?FNpHOLrkGcivqstzTR70oCAlNkpSp+dD3OXnJi6xI2EOIx/Gj7iqemb8PR?=
 =?iso-8859-2?Q?zKAkOjL6lgdA/zIP2xWk88Jb4vwE+UCYkxqHxre26EwP6VWuhEbDZOFdNS?=
 =?iso-8859-2?Q?pMkSSkddj06/qpI8Q3os1Wd8h04zMvhAIV8iuSI8WPNfzzyl64GhCpgEMQ?=
 =?iso-8859-2?Q?jLGuMyBK0mj+ayzmI1TkZU0Q3Gk7YwkeWFOb1lHCb3AhRml/PhCN5TmEfS?=
 =?iso-8859-2?Q?8T9zYWJBSXu70ZXJYLvQcaXvTHNP1ai/vchdLJhXRsYMWL0Sr6AnEyydNc?=
 =?iso-8859-2?Q?5cls5lc8pDEfwBKzK+XQA9hRXstkkwLmGrdsLx8b0lRsk49LSrtujcQ9YY?=
 =?iso-8859-2?Q?ZyIoe0gJD3qC/N7MZJfMShVQQtgSNhDXGKG9D1VnzRdCFdcRUWQXfJn8pI?=
 =?iso-8859-2?Q?qkTlfvVy5tOwW6ACzy6eXKNkqtzpLaNWJ5v3WI6lMeaU4N9XFgsk2oZZw4?=
 =?iso-8859-2?Q?eyOoD8FzMt5VTZFuR2a/79YChEiYivduLpFZ2DK8GeTYBoFbmn49NPVbvW?=
 =?iso-8859-2?Q?XGhW9HuZu5r34/WoWIb73Io1sITRJuRF7xY9E1UvjxvkitoeWEK0NJdbJj?=
 =?iso-8859-2?Q?Hi1KMJyvS1r7bb8B6kcywDi7N/e+5TBCnESLtWetn/mXC6BTq7D4S74QcA?=
 =?iso-8859-2?Q?Mi9OnV2fdhA6rleT5T2cEKNlSo2zl6OuCNMcuq8kNraAk26u4RCiy+/gHG?=
 =?iso-8859-2?Q?9z2mIhFdgF09VR3qi/Wbi6AL6JcfdmCVpQrirtOv+43M5nJYqMEnM/WDnf?=
 =?iso-8859-2?Q?5poZLtcpT7T16mozCl4ZG0tXEHT3hefvt6YlOSJKzmcG1q08fczgCDK5fz?=
 =?iso-8859-2?Q?BrY/83hkmV/Z5ZgB8TOPhTzDz4rAZb9/mrZSME+B2VC69NvBiaNBD+5g?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af4a4ed-6872-40d3-4f60-08dc1d7a8106
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 07:51:56.7336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQs2sLdhQ1ZM6sVdiyT2MDeHE5VRoexj2Wg8pv8QXXDSm98vs5MuyN5Rp0HH08PORekvlb2WFQXMBHXVhRJPekA2sldxKTCSG7NWvG0+/MBiphcIvk4hISWjLq9QSND7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5495
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

Hi Kamil,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Wednesday, January 24, 2024 9:42 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu sub=
tests
>=20
> Add a few multi-gpu subtests:
>=20
> multigpu-once-*
> multigpu-many-execqueues-many-vm-*
> multigpu-no-exec-*
>=20
> run on two or more GPUs. Many variant was limited to take at most few
> seconds.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_basic.c | 36
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c in=
dex
> 8994859fa..debffaaf3 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -11,6 +11,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "intel_multigpu.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> @@ -54,6 +55,18 @@
>   * Description: Run no-exec %arg[1] test
>   * Test category: functionality test
>   *
> + * SUBTEST: multigpu-once-%s
> + * Description: Run %arg[1] test only once on multiGPU
> + * Test category: functionality test
> + *
> + * SUBTEST: multigpu-many-execqueues-many-vm-%s
> + * Description: Run %arg[1] test on many exec_queues and many VMs on
> + multiGPU
> + * Test category: stress test
> + *
> + * SUBTEST: multigpu-no-exec-%s
> + * Description: Run no-exec %arg[1] test on multiGPU
> + * Test category: functionality test
> + *
>   * arg[1]:
>   *
>   * @basic:				basic
> @@ -369,4 +382,27 @@ igt_main
>=20
>  	igt_fixture
>  		drm_close_driver(fd);
> +
> +	for (const struct section *s =3D sections; s->name; s++) {
> +		igt_subtest_f("multigpu-once-%s", s->name) {
> +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> +				xe_for_each_engine(xe, hwe)
> +					test_exec(xe, hwe, 1, 1, 1, s->flags);

Nitpick: consider using fd instead of xe for consistency
Otherwise, LGTM
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +			igt_waitchildren();
> +		}
> +
> +		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s-
> >name) {
> +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> +				xe_for_each_engine(fd, hwe)
> +					test_exec(fd, hwe, 16, 32, 16, s-
> >flags);
> +			igt_waitchildren();
> +		}
> +
> +		igt_subtest_f("multigpu-no-exec-%s", s->name) {
> +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> +				xe_for_each_engine(fd, hwe)
> +					test_exec(fd, hwe, 1, 0, 1, s->flags);
> +			igt_waitchildren();
> +		}
> +	}
>  }
> --
> 2.42.0

