Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B56EE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 05:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6810E1F1;
	Thu, 12 Sep 2024 05:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIhbwSmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F610E1F1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 05:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120767; x=1757656767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yUYjlti35gLhG0qW+alwhCmY3pIKsZgqdhx4Se8Anzw=;
 b=bIhbwSmrVmBb/r7Tg0Mvfo5f9bC1q9BFS2uFPbJnPATOOGPaomlv1EFH
 QPtHRcEaVNkz1mdUCjnzAabHz9yGsRGUjQ/QmXh9LIMbrIrCvVo5w34xW
 CSJNoCX4I38B9kI6TLRDlGZz31sBkXTBwv6GeM/QEsfpaqfGdToPQp1iY
 EJjaTGUZf1bL2rMig48cCh2/W7vW5ySyoC4WqM5d3ywAtfxqBbbNDC1cp
 vFoIfl+osA6IPGPoMjjVyHFSOux+I0ppeHb40y/Tdw14P9HSD9yU1OQh9
 mFbMNz/F9BlSlcjukv8wex7v+v5Rl9OsQULiLpmwF1t/NuIvIVmrM5dBj w==;
X-CSE-ConnectionGUID: CaLHLSfvST6YTQ1HHspBcw==
X-CSE-MsgGUID: dMS74MlxTfCQI3n8nkRxzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42428914"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42428914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 22:59:27 -0700
X-CSE-ConnectionGUID: 5qdLAW4YTpOVE/CT1HPA0Q==
X-CSE-MsgGUID: BYOZ/mquReSbkgogYkOiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="68106490"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 22:59:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:59:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 22:59:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 22:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mya7LSvsL2hpy+loppXU/fIAZ50kId4C6zpGJXhA+VbEpMmpCSvyMVw43H8sTU97poguOwe8VPdtcrqlpg6PG3jj3KmxZhePwMjCb2vzDQ87SGBuZOB4u5YI4fRA2eJkMjALGThibcPyyiHvr4D+zDha0nxaWyOnO86uP7n78FW9jMSdWeuNxt8gP8sCkZx/TS1gI9C1fVd2OYAyYmnvSyfTFrCN3zDggzcVSFRBMYGHGVQGhUpqLmmr+HV9yGGogfm5MdgWYZwJYmKwTexcJ55P68RgMZaf3Qyit3qei2NFop1vw8vmTIyc1O9AKTT/ju1cQZk6fmA+2BttH8tlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWnyOXs6oprySjom6Iktj7kb2OVfQaB7+oBs6LANdeQ=;
 b=Wfja6BFqTmrXTvrJNMU9gD4oourdfvFdNMkrWlidTGzuQb3026dwavzLTUT3YE9P7p/W4pj63uM2FWkKvCswPutv20mIKI6SR/d7eROomTZzaAqn8lhiXH82vVzHYn2rbHr4wfknPOCaBTsPy/JWOXbepPGZDtyikhN6G5Zn1cw35sTADfOCIBEyLn4wksK/K8iSeAFTn5qBYpovX5JKfJ7nInaRuBygpwpQkk07TgekDD2SSF6OvK3tuKkXJUsz9CuNzFYcmrqANWCwH6+NgpFwbI89qSg4xcgogu5c1+3fTr/Hz+hV8r4lvdpGjeKgjy6739JqIVhZyIrfnhD8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 05:59:05 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 05:59:05 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector link
 status
Thread-Topic: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector
 link status
Thread-Index: AQHa9yiqzm+wUqlBlEieYDUY/arCBrJGI8oAgA2fc7A=
Date: Thu, 12 Sep 2024 05:59:04 +0000
Message-ID: <CY8PR11MB6889EC1D8582478EE12D34E7DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-11-kunal1.joshi@intel.com>
 <ZtcVhEy0PMwIu2F9@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcVhEy0PMwIu2F9@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: 75578fc2-456c-4af6-5384-08dcd2f00235
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fOFTDkK+W41ivNIpfM2aEXKvy1FTZpYHm5NhTKoRUdRKWdS4GV31XAjawpuE?=
 =?us-ascii?Q?QrviWKhvIuLYDy6f+7IerjawZ7tdxEDdfD2My9Vq61NT5VZBU5uGWMti1dX7?=
 =?us-ascii?Q?P5PKJI5OneX6P1gQ/g52mci9oh9Z2olDno9Nxy9c8Cx5yJz3rouhykOP74Nw?=
 =?us-ascii?Q?vfzmXhoqrjEAhoA8mvc12TttZmZ/wX/wDktF1lR8bkzvYLNQlIAKA8ij5T0n?=
 =?us-ascii?Q?1EqF6JvG//JHo6IDNixNcpHhkUhcDmpvLSg80TRcpNzOiWCNVaNMb7g9lco/?=
 =?us-ascii?Q?IO3tbBl3h5lX88gzx89Fq8SYXKRUl52gZ5PxKBixpduOV+u+RFX6jt/F7/gy?=
 =?us-ascii?Q?b2Lfwl4CtZ1rgCFE7n0UGLKEvrkL5e2fS7JDnJo+UHaAqBQI49EMmOxn3ZXL?=
 =?us-ascii?Q?ijNCeR2XIsYPv3bk4SAEW2qz/idFVQiY1l+I++1fF7acSKwHP7QINgDFLLTK?=
 =?us-ascii?Q?l2ems1kecLCcmr5O78bN+zdLzycS17PhRlAwv29lXFRA9WH/7r6X4NS6eLQH?=
 =?us-ascii?Q?JMA21OooAzDSoG3Is7YbvKRpChFhIMOI5h4E/VRYveq+T4XSVaqepV5ZzUTM?=
 =?us-ascii?Q?kCn9/mzY4mgH3J+a3vIvNY1x58kPmSW0n/2YBRAayxWyKPw8nusi0dYQoOMQ?=
 =?us-ascii?Q?SSDVOEOoAEZHtIBgy2bZ1nnv9eWZfznPNOr3MKLsntUwJarEkxiGJGAZQRzT?=
 =?us-ascii?Q?CItQ5dLXwVkEv5piBqoktQyqMpUnwUNylpjlHbVR6EWcdn4vyN5W8gsc/GNF?=
 =?us-ascii?Q?hIh6Wr1DVOIsZLITM4OP5hhg7aDYCccEN8I9tUcKH5b3wx2NvYf+5FFuDaO5?=
 =?us-ascii?Q?+/h8Nu2S9FfmtRxwaLVhI08TJp6xB9Ibquv6CLO7JLklkbQpvG2DbaMQlEzO?=
 =?us-ascii?Q?YDkM0c5IkbFSybp3CbPohieYZYtDl9b4jkwsiFZnxbhrPEptKQ9hNgiHsiBH?=
 =?us-ascii?Q?MNa4HP7eDE0j59BwpAcAcRENtYPwNrwd3CUb0VBA6H2OxMg27ESTrQd3LfvQ?=
 =?us-ascii?Q?qtqolLK0nPe1wStoBc2KEjc2sPaeN2D91bBn44NszCcAH19x/Yxlpw10WEbo?=
 =?us-ascii?Q?OBG53AP2hgn5/+ndhncMSfzmAaLKjlCbBSnwMkDzWU/S6j9fcNX+lcbYf0/E?=
 =?us-ascii?Q?FNu9XMdfF0qdlQtypGqUzCm081zCsYYgOvZy0LJh1lT06u+2KYX6xpblnPAP?=
 =?us-ascii?Q?NtkP9mMP5svZdmrg6ZdgW8OP/Bcc9o+m5F49N0efhTFeuPUKqydIJnjQ7uQQ?=
 =?us-ascii?Q?wONbgVXb6sBb2UezuaNoXdnenYh9sRFiPLfCz/bBs+N3AQ/frk0eQ1VBoNa1?=
 =?us-ascii?Q?eQljPH24bVlll8fL9RaYx7cS6vk/G8PGE2EwkE/1Jbhw3475i66/iwY5MMp4?=
 =?us-ascii?Q?vnhuCn+PRVS06JA2hxUdCj+CJgmVX501lYpVzkKkl11ntkRQLA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VtqrypXdMdJg+ja/QWI7zvehPDmvITWK5yUHoQPcV4ZwMJBMiXpdQdDwgOUf?=
 =?us-ascii?Q?Qc0vu96vqeLJAvUCScfft6rPp1bYr57pxj4XBmyVST//nHoQuHgbeY8LyhN6?=
 =?us-ascii?Q?K46F3sG/yP5cXDdRds0X1r7CI6qOKWn8zptKiWW2ahGvt4bP1F2FVmLUEtd3?=
 =?us-ascii?Q?gZiWvwSug0UHJinYd9aIFRPNnoEE6Ra6zU+TSQJiGtXGtD+GFlCHmqOgwq8S?=
 =?us-ascii?Q?utnCo52HFcCBIL4ttxvu9lnA4t4ReNhahpSQwRED9pPUqF4zjhoMq5s7VOif?=
 =?us-ascii?Q?qXqnKWJ/LVaelP8KbXy4PEnaVQIEGvwOIQQ7Q5FiQmc1B87kvA5YlVXisABk?=
 =?us-ascii?Q?CutkyhjMPoWzMpksj9MoCezjwDSqHqTNjcvtwfvDVFc/AlSzsACA9ZWldyp8?=
 =?us-ascii?Q?ZKT9xowKNTKDmSK/G/kdMqPypww1Kco/etTvFe7KAH1E3AB36W7Z97YVoN6j?=
 =?us-ascii?Q?GOhkg83Lcj6CfcdVjdHQ75chPLnDCX1vJdEN/cN4OigEgat2P97OaRrqmTsU?=
 =?us-ascii?Q?hTW4EUtPtHTre7LS00pi0cWUVN8U9tTWJgl4QI0uFa2qHiZ5+zuHT62d7IaW?=
 =?us-ascii?Q?y2PX6cIcaswADA52v1DYM0+JmZSMLzDDUa2D+/wPXY7xC4G6SvyT9ZjVv/jz?=
 =?us-ascii?Q?CGVysc2X6GeBBkQrUkwJfKop5FM4nudocbbs+xgC77qiZfeVbJEDfdn8jSF0?=
 =?us-ascii?Q?tQHq3JQWHr9W3jceAoeDMinae1TdJ8iScf59XmEEOrsX+3KqGtiEQbN2yZ22?=
 =?us-ascii?Q?M8WQHO5oGVJewjUeJgX3oZt3FfhT5n7Mhp1TMi5z+Z/rIBbJHfdJhOuMvWYO?=
 =?us-ascii?Q?JD7b2UYQBcP1qK3JJLHZtEQnFxHk7Q4Vrk/FPkfMClobQWIXkcssKJNAAeRk?=
 =?us-ascii?Q?zn5pOKdVAgoYGPehtiBhGV4B921XdXxC94MJLn9r6al12I3rRlxAQXKKgIvk?=
 =?us-ascii?Q?2ylan6+uFxiLTScRAaoTtSWLBGX9pVH6/6QfZCXGBWDxFhEObcNYSXMgdXX/?=
 =?us-ascii?Q?5VabtKOKv2oirot28v2rgPKZ2TCXihXSN9Ox45gdefvVImJTKhkSMhwCLSpJ?=
 =?us-ascii?Q?PwYIievCJhVKbI3w2HVllVVC3l+wD1n8Ev4MFK/00cXj6USE+HnfhpAMtJDg?=
 =?us-ascii?Q?UZKg25WNX6UtRMchVNUjBFkimf8pANo2sHxce7t6wSB5PBS8GBQ83Byeh0Tp?=
 =?us-ascii?Q?r6Hl30RSKnDShQNSij9Vr+waYpxJIkexGXGzzzj2VhgYleYh02LhqZjKX/o7?=
 =?us-ascii?Q?wYNnd7qXgzg844r+zlAJR7TKbiUgVBRkHCh4A/YmUfjz+ALenS6CNK9HwFCN?=
 =?us-ascii?Q?qzCsn2RSSaZ1b4Zb0kRXxMnxrQkfOpPgQ+Rbij0DMP8QWW58Cf2Z/d3pvb6a?=
 =?us-ascii?Q?AP6/UpjBL/SxQcPecAQty+EqyVBzX5D8Uzhh9LQ6uuSjV5umrniY1yvwH8zu?=
 =?us-ascii?Q?fsiGWWXq8pObKjdP5i8BB1x5pn4AeFp27mdBFVlv+PqeG3LjJlVsarSMUZ6I?=
 =?us-ascii?Q?odXnS/4jZtps0VgAleDzn6L3h6WBF3uSx1DS0ZNgL4OMVTLw9ydf3a8SLGIH?=
 =?us-ascii?Q?9GmXM3OfxvbtW/t28yd4E50p/UB06o7uEUqWC4MI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75578fc2-456c-4af6-5384-08dcd2f00235
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 05:59:05.0523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4cPp9ll0zIXtncBF8LHDMKDF4B//yHPPI9EjkzNndZp4Hb2qjTmnNRz8O/kgMmd43qW+Kz+mf4O/ysQS0413w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 7:26 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector l=
ink status

On Mon, Aug 26, 2024 at 01:36:08AM +0530, Kunal Joshi wrote:
> add helper to set connector's link status property
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 91f75243d..e0533f6ae=20
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2213,6 +2213,42 @@ void kmstest_set_connector_dpms(int fd, drmModeCon=
nector *connector, int mode)
>  					       dpms, mode) =3D=3D 0);
>  }
> =20
> +/**
> + * kmstest_set_connector_link_status
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @link_status: DRM link status value
> + *
> + * This function sets the link status of @connector to @link_status.
> + */
> +void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *con=
nector,
> +				       int link_status)
> +{
> +	int i, link_status_prop =3D 0;

The property ID's type is uint32_t.[Joshi, Kunal1=
