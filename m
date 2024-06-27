Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD23C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 06:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5210EA3C;
	Thu, 27 Jun 2024 06:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cl3sfEae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4810EA3C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 06:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719471522; x=1751007522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m078YFvY4SGLoKY+dA3QSLliDRMULrMfVkJj3Uinpfo=;
 b=cl3sfEaeh4gg1cF0QtsZDagsFTnJfnd5mM/7hzwqB81zHW1tldnn+Q4E
 JmEaoGYcqcfl8YjLScVkqYkgoaWVxKU56MDjYsAhzgQkeay2/PWUFQ44n
 qSrvMLkPbXVqeQjXX4cmlMKhmNQq2Cl7wN8gbtRxVgUll+z+A9mncfQWZ
 ooTdrEkzfLwav5pLbPJ9Vby6w58iVkUegrUMz23CEZAtAnI7u7CIgu0GT
 vcyIhpdbHFQr8BChRhgslbyuQBqk6GxFpXSTOjw45hM2JfBBY0WnI5YBY
 b0lZUoNMSaQFKyslV2n5vMDgUTZo49ch5nTrK+6W2q5wY/IZw7sUoagVX A==;
X-CSE-ConnectionGUID: zatzmKfTQWeQKuVuUiWu1Q==
X-CSE-MsgGUID: a/SVVjy4RMm2pvvbATpliA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16728067"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16728067"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:58:42 -0700
X-CSE-ConnectionGUID: KiytZ9YeQyqy8TydQUfFiw==
X-CSE-MsgGUID: kplMI8s4SYKxFxFCbTmRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44401090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:58:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:58:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:58:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6b2GREmkc4vx71Rlhqhrsf39Ae7AIfPX7VFeXEBYT+uvtaZ3gCVRywjq3dhiXB9pex8YoUMg6R4kxvHsb12dcABqRmQFRTlB8eQyPFOR0Hd/phx3Sf5UHOubiiyAwwjTY21f0t74TX43XQrhTlT2T+ySp9sVYfFLg9CfoZBGib2h7iuvIMbd1H3v8Qc05VEFhQtcWep5wO4NUGjjRRSepbsGUWD54syP46LNirzW63/qEQXoQLY2kr4ALnG8TxZzlezrybxHago+ZXax7RSCb2HBFkf86zCpaHA02HVxpnOLnI9i5xzsS8pttumbA8QMp3XZv4WfuPUlTBnV9mhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vURTfhyoJequ92FcbqTlYByqcC8AavtD8voFr+p+HRo=;
 b=NfAcUaTil9WdoPfqOCdBYW64h0b0Dpmz+ha3N85BDWB3QTUgSiVCs+3p8MQktBOdMXAZUfVnNJTdIlbLAtwmsyUY48jXKVAzo6VsEFnf334QZyhemhs3aObck62ELFtjK3xoT3EdgNAjauF5g1buVyGpwSm/hjU6ooiA4DEamUPCFCyVbKvv2fm2ikuHRE10BJzerY2G2tjvTGo68CbR3M9oWM98RS3f3LZ+w6M8p3b3zvR2T4roIhz+COcNtrpnNIs5SUDcxub4pugFGW8OsbM0i6HgrdHvkrocKXERxTotkNBL/MDL6cvFnBsnxCv5ccoXogYqragD/oAyZh2amA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Thu, 27 Jun 2024 06:58:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:58:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 5/8] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Thread-Topic: [i-g-t V6 5/8] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Thread-Index: AQHawVnqZms4iBRV4ku1ZdL+7BHUP7HbPASg
Date: Thu, 27 Jun 2024 06:58:34 +0000
Message-ID: <DM4PR11MB63123E5D0D6E51352B15542790D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-6-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW5PR11MB5859:EE_
x-ms-office365-filtering-correlation-id: 9fadb088-b93a-4adc-c204-08dc96768fee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VnKgxh7pPB+fDXcAOb4egSiW9je0p6aqvovm4jqx9p1p9IM5EmRsWjqeteQ8?=
 =?us-ascii?Q?mzo/NMvty5NiE5G3E2GRVI2nKg5TOH55foRoMbamrPj/M5k1CnvDzN8pZZGP?=
 =?us-ascii?Q?Tyt/torWGJ+60IV4uwZZPlo2P5AYpqdPfYgsD9nPbIWmWyPN5YMzIBQwROD8?=
 =?us-ascii?Q?DqF74h0a9hvEpbG058/oIg9cYwl0M5RkHjP7NJRb6yCtWGilTTQNJ3kNKAPA?=
 =?us-ascii?Q?tUHH9R6pmzK+F4AlFQnlWvBofsPgmsOkC+HJYgR3YOrUzm8dylmCQWidJ44f?=
 =?us-ascii?Q?n0odK0Y8PJj8C4Fvw+VrDH66WBWfyIfxOczXckSooGQR2ufLFqBADTLu+KDZ?=
 =?us-ascii?Q?VSVY+R0muEosvuiHCeAMsDXHiuZDmOmBDC682DWR7hC0/LmQKgBm++EKyybr?=
 =?us-ascii?Q?jSTCENkrM8gpCbHQiz6XTIm/AFyHuBnfAtYnmgvwsyXIL4AzrVh2/+iaCFa+?=
 =?us-ascii?Q?FNmDeVMaSUlkM5MbpRNSeJyoVJ3KcTgW4BU4ElXGqMGq+KdBcsSGAPdniXMR?=
 =?us-ascii?Q?tJr0peytA9QRkVxTBLy/ftIuxKLqPUPyY/Pl0cXMzN2ZvUEgL8AOysYiIv6w?=
 =?us-ascii?Q?raHd/UeKXAaJxLDPPFAH8jAIK0HBT6YL/YAl8QCKi1Yy6a/szE27uyO0HORm?=
 =?us-ascii?Q?Fiwmt0GS93Mma8EUF96/xPlqr6asx4JBE/YjkiKgbhHUAAlK2WHp1k3gHeJk?=
 =?us-ascii?Q?F2QwCtZdYXe5Pf2lfulgze8bh/E8KIDvSK4HleDS51ybhaRQhrx29FGt4B10?=
 =?us-ascii?Q?YXUZjaOemOjvV64im7JFiEQzNavvrUhlxm7o/fr05Alc5D7/gf3sqUSRys6a?=
 =?us-ascii?Q?1vbRLmMx7OA+ZjKqrPzaD9SvW6bbzK3FawUjwvxZvbCUnQjkqo0fMLacUy54?=
 =?us-ascii?Q?s2nOq8pgw8+fImUHlb7g+B6ubHCVV9dRSWLWFF5FfgsjSC46uvF0XJIsQ0iJ?=
 =?us-ascii?Q?C6FeN8oTJe5EBCflwflKAt0MSjM7mVhAvnTmmbz5ObLoNq4p9RAtafK27o6S?=
 =?us-ascii?Q?3DjsF/4ggL5h1szMLAg5TAkclmjm83RjQ6Z47HgyaCalrz9Ypo6DieYWAINQ?=
 =?us-ascii?Q?oSwIYvWCMKaXkM6EYR9Gy3WVjQNIKGC+WPCUk16IdS4IzLHK2mb+0olX895M?=
 =?us-ascii?Q?MZq+sRPBY6nD5uw2pJj6CkY/RNdtevhwFv3+KkaMgQ4tUzdGYSbId9k+AyjX?=
 =?us-ascii?Q?2I6L8N6eD2+7diKMvfHkptTXXd/dEaypjpHMDkFdPjl2BIaPg2hquEofaGta?=
 =?us-ascii?Q?yqKlG5fDxAnrYLtpYh4IYbuTMoxSu/w9zp3k2VsNVzsMw5+jjBU0vImfBGU8?=
 =?us-ascii?Q?qDcK1EoMUKATInUfNvsz+1zI8Ebf0PG6PEmN34n0H4wM/9oeK88K6IeF/542?=
 =?us-ascii?Q?AEQ1FQUtpaTEo4LmGLJRSYxuWJUO719u8wLOMx6Vcrb3Ttz11w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IGQfpKu5Hb8QFA/M63c5Dt627IFta0YtMCHlG8NZkw0AUbfcjaYyS7MvS9c8?=
 =?us-ascii?Q?w0EvDKLMqxBKQ3xZrXPB9m9k/xk3qgpiHYJ4zxZ4Ovo8v2wQ4eUEiUbLRtTa?=
 =?us-ascii?Q?3lXgdXTd37VByM8NS6KM6VCEJdCX1JIjQvJMP6wAjI+CxgLpA0RLaH0iXDwN?=
 =?us-ascii?Q?LLlUKTihXKzGl1STqdZ+MAJJg1dzLH5GEDYmObyhUJz3mmLveGag63r3V2vi?=
 =?us-ascii?Q?vME31aY17UoT+0GDf+Ng6aPV2+QlggH1Kh9dVqK6x1U+wj/SEOfM9Perfp+l?=
 =?us-ascii?Q?/Wtw/56bkyufzb1amRsuhJCCopTo/3vTFB5HjkiBTc0asKou5eDgz7kH4gsf?=
 =?us-ascii?Q?rKsCC1iLCD/EzJGj/Vz5lc7nCM5ll1CdkuWBbNM3+2RFtiHHDRFdSnh7WUZ6?=
 =?us-ascii?Q?DLawmPHE6hyPzOB8VZ04K5KqJUGz8nm/PWLe86sxMlc3LAq5++Foo7DXjNT2?=
 =?us-ascii?Q?cFuZKB5I00W8UxcOSYcLGFs5OYIFVRBvviwYHAy2XrtFk3c3D97JanOFV4gB?=
 =?us-ascii?Q?PTCP9q5Va1VO7q2L1OkrzqYtdGZYigFPS0jrXTz8VJrQcr8HHNE17JfptxTu?=
 =?us-ascii?Q?fZByyrKpFIfE6gqCD7jsBdperTRXU6zzVYcUR6XdI6b8ZuvwQDaZGyIJIPhV?=
 =?us-ascii?Q?GeVsOhdWqUuDYuaTk76jYd1GQdy0/xXp5hGn5gA9b1z72tbfE2duRhUHYkB5?=
 =?us-ascii?Q?HWt+mDje4jS5iAva8NS3bUIV5UYooulAzie5UdDxAUqVtKYIiW/VC/PfU8mf?=
 =?us-ascii?Q?BwfotzGfsD6HE4fYUbnpr+6yRymD14i1rokpt7uDTKXnHmcULyVvNxRQgznq?=
 =?us-ascii?Q?WGd/WwV0EpWP878rQ6trV4RPl6Sjo4P2rQF5dg0Dsoe3zVrfEgbv3RSOB52/?=
 =?us-ascii?Q?xmcR8b+d5+eUBJLLGZO0EpMpxa1/bdtzyIFl1dKIx9Ac2mtpy2GBNmkLUALQ?=
 =?us-ascii?Q?6mCQkgfkNxiO1D51/Z5+Ep3BKcfY3DEdUQoHNIu4TFJ7UBkBScFLOhfYfFZn?=
 =?us-ascii?Q?u2m+T5jTwwfZF0zXYleGF99IR2bC7g/8OgwqX3ePnX1vnkQ8NM/16pFKGFxG?=
 =?us-ascii?Q?pm/xMR6fUpTvHzjq0hV2QVNs8Z/W4pAFMg/WqJNWRqTr4zRbrX/1WruVTnFn?=
 =?us-ascii?Q?aZY/mX3gvMPOC5Z+YzZWpk5poz9118GHdNw7mEJfEzLNd6/aPEJkBZifbqDT?=
 =?us-ascii?Q?Q1soAGBOes2YHUG9UB1cRuE1Idwo7Yb90dCBWYk2U3bIcbNM7/hhYWcpdTgL?=
 =?us-ascii?Q?aBWLcioS/rDVLa5yag+OHmHJGcAQvZEKRR0bXgzhgQaO9spXBqglsrMZGQgw?=
 =?us-ascii?Q?0L4dpiU0RvCsEoVbrvCo9VJgPLQmXwgDpT66nOUjfrCm4SeIoQzuubUSCyzJ?=
 =?us-ascii?Q?1dIXafYQW2eO7Cr4FhoXJphL/Gt8MTBEs6s1QIVYBXsZM3ffk8EF9XfHefFa?=
 =?us-ascii?Q?LJs7jzBZ7R4sudSOV6zGSipTKpXprnfxa4ABaA1aNe9dwcu9ss1VJv3M8esk?=
 =?us-ascii?Q?HlNQ8+GNSu/UcuFiCvcT37YQOVeag+0VFNgOtIloIhGBJtYlhmbYjOAUxnkW?=
 =?us-ascii?Q?C6NzQgNPyeynOFShgEg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fadb088-b93a-4adc-c204-08dc96768fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 06:58:34.4433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UE82qzLjzzu7e13Q5fL18FIxlKt2Qy6BEbQxYSxOJJfud9DudM/wCBtYm8H3LV8Hk/XXG8IjixugwNgiA5GjGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V6 5/8] tests/intel/kms_pm_lpsp: Force joiner support in =
bigjoiner
> checks
>=20
> As we recently introduced the option (through debugfs) to force the bigjo=
iner,
> needs to extend the support in bigjoiner checks to handle the force joine=
r.
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_pm_lpsp.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c index
> a76b423f4..f9ac508fb 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -163,6 +163,9 @@ static bool test_constraint(data_t *data)
>  	mode =3D igt_output_get_mode(data->output);
>=20
>  	/* For LPSP avoid Bigjoiner. */
> +	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
> +		return false;
> +
>  	if (igt_bigjoiner_possible(mode, max_dotclock)) {
>  		for_each_connector_mode(data->output) {
>  			mode =3D &data->output->config.connector->modes[j__];
> --
> 2.43.2

