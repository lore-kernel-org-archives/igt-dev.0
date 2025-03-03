Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BBDC282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 06:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3959D10E202;
	Mon,  3 Mar 2025 06:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDFEGVQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAD610E202
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740981861; x=1772517861;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=6DmSawfFa6V+vjH12qxWfG2TOkLrEYvt5LHu6OPeaBA=;
 b=kDFEGVQ46X9WH6skq9lDZfwVyDGu9TOKN8FfDDjBXTISwAv5J22VdJMr
 SjrnPVaWKCzilum0Vc9PPM/0oto3kwkEj/owumehG4EELfHhgGfrusWjJ
 S6pB8SnZM5N7rYEhaxpj8ChXGRqVXC2G8h7JRfz7C8SLu6HpQ1raxSZf+
 GgXDHRorfnD9xccFSFh7iRoEfz2bnt1v7K/V1nncMcg1HYPIw74RwCFYd
 MwjYfB6dazMu4A3BS/qZ5qSV61FPLMP1+R0dSdXtOJ3b6uCbXKG5GX5Jy
 ahxvhj1pOiEgCuAw8DOuy5R2BFT0zVgsJ4k5TrnE/PZCSIbymDAC3yty5 g==;
X-CSE-ConnectionGUID: 9W4+6GTFSYGIbMIl90QQ+A==
X-CSE-MsgGUID: 8SPymCJ0Sv+LcGPQVvRQkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41756888"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208,217";a="41756888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 22:04:16 -0800
X-CSE-ConnectionGUID: 8o7TpqEnQPew4R32xYEQcA==
X-CSE-MsgGUID: rUjVYHKmRAahvFI1ZDkWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
 d="scan'208,217";a="117713055"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 22:04:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 2 Mar 2025 22:04:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Mar 2025 22:04:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 22:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=remcZs9v7tk6lIWtJOFQmRZZMwCLcsba2mUAycluiBoiUqXRJuYLv5ljf7KyzZu5LSRVnJci4TVUwwWREcEJ4dluLjqsLrJwF4okIISxT1/26NxRZWQVxhqk7IjrVfeXeNgRhXJFPHTLUO0zRd+HM+DExtA7e/lq51QPd5PXbj8o180210EC2aRAquppwVVEUClzkLvx1jwAhZByTDsZwDUS4NE/ZHgzMg++P1dtOUTtmeW3c6d1vxb9ZMyGqNnhKvPwj9hooRGxTgtlCQZvbujlNbU0aSNA+XL7LKZfCvQk+AEKKHe16P/F0rD5H517MBoSFovHjv4Zkg39SukWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kqysytg58MR7TTcp5nBfGszCJ0CLX9/H9QgEQ3SpZs=;
 b=lOHLRzYrP3AQtxla/9PqpD9hQlgpECVOmr53d2IAs7FlIFMQbPEHXj9pPskJ+rCSINSATfL7l3bhDRq8pQlUv4QgaEKN+io3u9/bS6RhY89gl8p5q68C9SUZi7EffuuYbY84s4juiXTPd4qxgaWhTnnciiUi7utazEgGegk2EO6T8g0pCVtT7XJ78WnCdsqLv4V2BDu4vYw5frncKF2de7RV5gUYmVGWcxDFd6CX9Jvg5JukhwkIj3PfzMPO+W688bCEpvCMXZ3/GuEvwYeXZEJMwSqPq5fXwTXzgxhCHLmxzJUba3wMJQa2kRtYUelK3qSOgjsSi/qtCD3MYuxv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 06:03:39 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 06:03:39 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retrainig
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retrainig
Thread-Index: AQHbiRE7wuytJf4ksUSj4svHxWrlrLNcJmWAgATLLX0=
Date: Mon, 3 Mar 2025 06:03:39 +0000
Message-ID: <CY8PR11MB6889F969714087B68814FB44DAC92@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20250227123039.2933330-1-kunal1.joshi@intel.com>
 <20250227123039.2933330-2-kunal1.joshi@intel.com>
 <DM4PR11MB63124AAF248EDEB0AAAB3A5490CC2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63124AAF248EDEB0AAAB3A5490CC2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|PH7PR11MB6906:EE_
x-ms-office365-filtering-correlation-id: 5c39e220-cc2b-4b1d-0a91-08dd5a192502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?V5Ta/pYF0HCLjk+PqIhnkPsHEvTaTRoU4iPWX0scd96E+RDBqtwiplCh3B?=
 =?iso-8859-1?Q?0yxSHunLU6rjFeUQrghvkJ9M64Sl96GQPq79IOC8eYCBBDk44y0C/vpTs0?=
 =?iso-8859-1?Q?JSgCq+LOpREh7jwGj3O3oqKs+u34GwqGTsRHfE5Gl832kS3kw9b9tuKR17?=
 =?iso-8859-1?Q?bUi77mppKUzstqucjhabrN7NCWs1m9sfxMBMnRpAu2uhVcPyyOeIt3jvUP?=
 =?iso-8859-1?Q?maHerPz+NkjuoLLopuZ6Yt3stBTinkM7cBR+GNe+WFe51nxO0U7NVNh++U?=
 =?iso-8859-1?Q?g4MufiX11ltMyru5G7LuXVfqZXC9hfnw3mJi1fuxrkcsR98EGnsDUJfJ9x?=
 =?iso-8859-1?Q?+SKCpqp/ud+Jw+NxkH9kH4F5SOS1Dl6JCaXnHed32Q1BS6YO4U4KhM5Be8?=
 =?iso-8859-1?Q?nE+MmuIFCUP7ATHBvPJD6KnWde5vQVj31epLbQ4rvsBsnPw1T3439AARIx?=
 =?iso-8859-1?Q?h+J0AvMS5Slzi0UlGrP/SSsZuLTBybI/PUQTpHLQIM2RBoouFKm7jWlhej?=
 =?iso-8859-1?Q?CWeOLVDiagKDVb3A/9V2NLFpJwYlSH3wHi5p/js49E4YQ66xiq4rujSMTa?=
 =?iso-8859-1?Q?jOwSjs9VtNFeg4wTiLlSfU+ry2Agj2Ma94FDevfOOqtDILnKUM6gmAcD/n?=
 =?iso-8859-1?Q?2JTNPRXxjyy/JT9TpOK8cXTnBrbRqNn5wrRTWGBBV2rsZaNjhnzVM+eXgm?=
 =?iso-8859-1?Q?Z9BwkFedCRpAy1DtHsMleVuDHgg7o6LtivzAqiRFAA8i0IooEVrJUkAfqT?=
 =?iso-8859-1?Q?M+e48VBx5t9hHZ16JnkwCfxNyFQ25bzRryCQMfvyqnGalgizRiqTEQ9TTf?=
 =?iso-8859-1?Q?naVRyLc96qR/vAbltGlA2NrMGFzqnK9QJbxSll+35OU21AQ5EfuS3VCJTk?=
 =?iso-8859-1?Q?lmfM4U5Yq8Z/kjCbRS83LRfqRTX/av1Tt7iO6q7oLUjbVx5GIZLXnheZoG?=
 =?iso-8859-1?Q?EL54tLN41v1tCDVCFojdce7b2Wn+YreDFtQBwZWZVyw70hMYsdpaizTcs6?=
 =?iso-8859-1?Q?ICiFzKTDnO1+b83jS8DrEQnX0zCKmHEOB1UlF7Ypsyl9c6XH0ZrYqCk0Dg?=
 =?iso-8859-1?Q?efeb2oBtxElxWblmmh1RtJLTtQ67vw4XuCfvWoHMr7BrbB4qalo7zfoST+?=
 =?iso-8859-1?Q?gG6iCtL0dc0nccOvVv55uKmizW49l4FDKgDCefVQe8CWQIgakE9fN9tZag?=
 =?iso-8859-1?Q?Kktej4TBtZkl1102ExemdAIMVq1BbP7p8osrSJmbMTgZH+DHmI8EHVYcKo?=
 =?iso-8859-1?Q?AK0A+B82B4YgJAz0W/y5aF/j2jUbxGVVpUdGoX0oUZI+TpXG6U62IPLerF?=
 =?iso-8859-1?Q?1wkMkTxeYgSD8LSqTULSU3hJDcf0kDu2JVqyReLqkZlKoNjjUJ44F3jEB9?=
 =?iso-8859-1?Q?as7LfyxfJsGbh61ZL8n6bbM+7BKStXxGVgsLrNPzJrp9f32OBl7a59Obvg?=
 =?iso-8859-1?Q?MmY9W/cDC92ULcwhxjVE80keD+8YO+vn4/40mJHri/lAfDzWJ8gdE54ugx?=
 =?iso-8859-1?Q?7lxLSDwrzgSiH8s0NYpDWu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NRiFzScByRx6zrHwUZRLwz3AVxmafzbZb6Cd1H+vIo8GCk2qcR3LGgCM9B?=
 =?iso-8859-1?Q?/khLP6IhnsxHcM65MoEamJ30W6WSicSTnQ+565O6YWLTOUdY+kiA2GCWEe?=
 =?iso-8859-1?Q?vW+TODMmEF6n9SstYmCRbLeTcWw6MVKcSyixzJ0nKKXdAvj2AMU6jL68UW?=
 =?iso-8859-1?Q?k1ImTO2uUmjaWCfHPn8+jY8cU9hTCCLKxxisM85mxUiMLLB9CqnJcjxy57?=
 =?iso-8859-1?Q?Uar7AWprYcuDJzuPl7/vKljxkpBJYg/yxmt6DM5su/ONZU+Xh+cNo0+c0b?=
 =?iso-8859-1?Q?77KrsBbvaIiZNVWm61K5tn1FdOk+e/TdEnehYNiJ06zky6TjhkEUPP5GgF?=
 =?iso-8859-1?Q?p5VrW22Q2tEcj+mhRzX31JpSmUUrHnKBRwsyBnRx9Up2mOTxineqynUrJE?=
 =?iso-8859-1?Q?EGys/K2nfcNKqE5Bk/ihQjgWMU7I2xNUS3f3YqXtgIvDL8QPyIF6lCNDyB?=
 =?iso-8859-1?Q?hi9jwrcZfXPJjlKFEZOPpNc4oX2jKPoNxvrDXU+J9oxvb/2JEWJbvTHLGl?=
 =?iso-8859-1?Q?ZfXeMHK/8Dc+mkarB8l0bS2ptT5FLJO0ceaJ2MlE4sc740Fb4Ts9UY47oE?=
 =?iso-8859-1?Q?GxtKMaSKE8hjjJpcm2rBlpOA6ynNPzSFCoRgZnq+d4v9t9zmbipYveNr72?=
 =?iso-8859-1?Q?iNhSlISqClI8Y2AtP0hf5zcNb6G8rmyD3z2QCVx8fDa2QVRouVEjP0Lemi?=
 =?iso-8859-1?Q?WcFI2B9RwdnF1ZqrTlipVGW/47HLaasA8uY0OB9cv7zOh5ph/rm/4JH4vb?=
 =?iso-8859-1?Q?bCf4Y0woguPpFnZEwNwTRfm8SqZEVm/5Wi0eNTu7TESEiKMV7ccqm/9NEF?=
 =?iso-8859-1?Q?1BQ4CqoCeSI0YhPYp4tQmxBWE4gRs06v95pAA24EsgaqObfvIw0Siid5lg?=
 =?iso-8859-1?Q?YxbYxk59sO8vl7upopLbhU4z82BlPkH3rKstUjjs01vRwxOUvX8qP0Wt7j?=
 =?iso-8859-1?Q?JP1mheDXl8WEo9Ix5+Y0pjkPsMG6aJ+CP5iaDTAoERM0woL08Tw4q/Vu4A?=
 =?iso-8859-1?Q?PECGN08uml2gspHBzCrDwKyNRQtGM6jsA1+3KaXS6FiGIufgfFpHoz+/gj?=
 =?iso-8859-1?Q?2ZDeqp9fuVU8Frgxd0J2nZovDwsZ/EJF8F0h8vjSAf6bVAWLbFBi3lpYmJ?=
 =?iso-8859-1?Q?xYmdTkqFfWTbXHXnNyuRyMERzoNa4BGzqHn5dr3Il49CMpC2cHvvU3ylH1?=
 =?iso-8859-1?Q?raEGY1QRNrJCkM49+cqRwdRhmCg2f2fNJgc400y6M7PCD0dVNjqHY+2gk2?=
 =?iso-8859-1?Q?uUjcM2DynG4EyU7Z7eUq0HrKu+4f1HzmgXPCOW2xezXs9rKkYAt96Zx6Gz?=
 =?iso-8859-1?Q?VGlgDeSPcqdG+qHZW8iMLDHZ0MHKTG60yOd02tDTKXuhcKZjovNqVhEjTt?=
 =?iso-8859-1?Q?grz0LTYfgXLsvYrRa7To3ahKHUJdSQquPFZj7hnUs+XKE/suEubWVNGQkU?=
 =?iso-8859-1?Q?Ogu4qEd8ZQOuVfHgKXUwL+oKwrLW/fk4jve7wJoFFf6GLiBeZ7cgp9Duq0?=
 =?iso-8859-1?Q?GcTCZoo/9qT4hNLFWn6wK5dEKL5lfd7GoHR6zlUyIupmCqPCMC92x1Zsvt?=
 =?iso-8859-1?Q?j5EyHQRwGVJGpew+jLxGX4Ka5KnLfCYgB5AgYFANDtVFXeHnlk8Ag86X+g?=
 =?iso-8859-1?Q?koe+rff/shMYzbck/H1woZnVqgg5hj8O0d?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB6889F969714087B68814FB44DAC92CY8PR11MB6889namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c39e220-cc2b-4b1d-0a91-08dd5a192502
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 06:03:39.7457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twA682IkE1iUNu1fH3lX2YHJKBxfFvErBAo/CfJs3iZJzEBNAO1B4pjFkcGKLujV2/g8jGkLeNSoLYlKqfewxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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

--_000_CY8PR11MB6889F969714087B68814FB44DAC92CY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Jeevan,


> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Thursday, February 27, 2025 6:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
> before retrainig
>
> Retraining can be done on enabled output.
> Fix test to do modeset before retraining.
>
> Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index f00376614..33e690a60 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>
>        igt_display_reset(&data->display);
>        igt_reset_link_params(data->drm_fd, data->output);
> +     do_modeset(data, mst);
We are performing do_modeset twice any idea why ??

Right, that's a miss from myside.
Will shuffle instead of adding twice.

Thanks and Regards
Kunal Joshi
>
>        /* Retrain at default/driver parameters */
>        igt_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
Here also its there.
> --
> 2.25.1


--_000_CY8PR11MB6889F969714087B68814FB44DAC92CY8PR11MB6889namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hello Jeevan,<br>
<br>
</div>
<div dir=3D"ltr" id=3D"divRplyFwdMsg" class=3D"elementToProof">
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">&gt; -----Original=
 Message-----<br>
&gt; From: igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; On Behalf =
Of Kunal<br>
&gt; Joshi<br>
&gt; Sent: Thursday, February 27, 2025 6:01 PM<br>
&gt; To: igt-dev@lists.freedesktop.org<br>
&gt; Cc: Joshi, Kunal1 &lt;kunal1.joshi@intel.com&gt;<br>
&gt; Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modese=
t<br>
&gt; before retrainig<br>
&gt;<br>
&gt; Retraining can be done on enabled output.<br>
&gt; Fix test to do modeset before retraining.<br>
&gt;<br>
&gt; Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7<br>
&gt; Signed-off-by: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/kms_dp_link_training.c | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/tests/intel/kms_dp_link_training.c<br>
&gt; b/tests/intel/kms_dp_link_training.c<br>
&gt; index f00376614..33e690a60 100644<br>
&gt; --- a/tests/intel/kms_dp_link_training.c<br>
&gt; +++ b/tests/intel/kms_dp_link_training.c<br>
&gt; @@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool =
mst,<br>
&gt; bool uhbr)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-=
&gt;display);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_reset_link_params(data-&=
gt;drm_fd, data-&gt;output);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; do_modeset(data, mst);<br>
We are performing do_modeset twice any idea why ??<br>
<br>
Right, that's a miss from myside.<br>
Will shuffle instead of adding twice.<br>
<br>
Thanks and Regards<br>
Kunal Joshi<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Retrain at default/driver=
 parameters */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_force_link_retrain(data-=
&gt;drm_fd, data-&gt;output,<br>
&gt; RETRAIN_COUNT);<br>
Here also its there.<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
</div>
</body>
</html>

--_000_CY8PR11MB6889F969714087B68814FB44DAC92CY8PR11MB6889namp_--
