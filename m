Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FD8C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4B10E3DB;
	Mon, 24 Jun 2024 09:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXnHvcDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3410E3D9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719221216; x=1750757216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gztlHS3uKrkHMhLIpnBn7uWhThA0+k+ESSXIzMQrsgA=;
 b=FXnHvcDJq8l6lRUxnxeitMdktuKZuozGK/zlbgg60wQaYEkAVc4iatO6
 u2NszMN+kmPd/pVEVAFkgmknxFZjZoRg+D/45QhFWtXPeMd27rogIxCJ3
 jzgeTCzhYrLJhhA4+4qE5Q68wfOPZWWoUpMDDdtBVR3RUOXsml2EfQwdC
 5idBYDGkC+ZiFbJbsWVhkA+UtGWczSCEl7wY7Z1MjnewXZjo+g7PDArHJ
 g24+mhg+u/L/P2nb5vfvPIkhArs1cxlI2x0/NgbkKN7lYeBVk47a2r+Ca
 8d3yxQv8cFcGh1J0VjukAXiFAPlf+JJ3MCeFLgYiYR5XhaH77GJEzpw90 w==;
X-CSE-ConnectionGUID: 1eTxFlQ4RoKkD8Z2ME4oEg==
X-CSE-MsgGUID: otAli827QLi0pst97vgYtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16312279"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16312279"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:26:55 -0700
X-CSE-ConnectionGUID: 6I4LrDpQRRuqk9oj5bM/qw==
X-CSE-MsgGUID: 0dHIWQ/7TB+vFTPxtCa2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43681356"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 02:26:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 02:26:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 02:26:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 02:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzJp7+D+mb3tMxYoTAMF9Rxzb8cwa0NXox4I9Bl3Cby1SYQnP5JiQF0Fhc6keWNDv8uHqQE14pxJbsvaJ05N8nUvV3jrRcnrrsrXdFXuBxy12aBdokeerHDeXlkM+0UH++xm0UVRAWPwdLB0dy3cizUaG5HjcvzpnefcEYrmL0SbpoPkyedXcx/LiGnTJVBwwTTf5F2juZK7W8Iz5AiBZ9hNKcC9kn71j/o5FEY8BeLC0VaYReKYNKdhhigXvyQUw/WpMz9uB/y/IAbxLZLxJeAqUax1XUMdZAshN619QP5a2PEflsN/SHYBYgl+01r/EQ6aardySrFJVuYea5voDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//xT+5j9kKgACJJOu8WUd2hX6ODIftuTvv1IVy/hsr8=;
 b=E+EaQv408GKHh5ltqr5PgBgmSRXdCAB36TP/RUm+6+F/XhZAUmSfuUVfjk/ZaQUlSwndO8gHc+Do5DkLhOTVgGttAQASU6akYvg54CJAto4AYMcJseQmE/Pw8kN5SY3GYxxv2sWNZwN1mp/ncgV6R51hbSc8RqwvJQuZnm90eb74hGl58Rjli0fOKzT8b1a8JWh1pVDgpbaiiiyunfj5NcxbAZdm/G7qfreFRIMu4Vd96l2tQHV5BUYxb/bR9D2fpq5iNDFVgyaR6J6F73oVHDSEL/9Nc3F8DYpZ/e2gldNOY0Kz0VFn4jB7j+0YTkIWBm2FyM+wdG+rXSRx+rJJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 09:26:52 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 09:26:51 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Manasi Navare <navaremanasi@chromium.org>
Subject: RE: [i-g-t 1/4] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Thread-Topic: [i-g-t 1/4] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Thread-Index: AQHaw7jM0sYjwI1EVkCbcmtTnKzBz7HWqcKg
Date: Mon, 24 Jun 2024 09:26:51 +0000
Message-ID: <CY5PR11MB63444240AECB15CF5D3513E2B2D42@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
 <20240621084711.68444-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240621084711.68444-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|PH8PR11MB6729:EE_
x-ms-office365-filtering-correlation-id: 757a7cfb-c592-41d1-84c5-08dc942fc7e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?GnVsOrGkKWsMgUjZ32Ys3QuZzEUx7Bm9mXrqsdsGV+WhWjujMz/NuQHmbXPn?=
 =?us-ascii?Q?vDMv6vEokBJun4n/a67PjL+8W+jxIIDbAiEwxZi2tW2BWR08rW2wJOdiBXRs?=
 =?us-ascii?Q?ySxUDWdC1KUqDZ5BSW37p1nnLRNNeMm0Ndy1KNnqXcpRKAwCxkV5diQQojBp?=
 =?us-ascii?Q?THzA8DFfyi6l7ZEPD3xSCzUdtnFIZfya3pSv2Z2r0oz3RHfmRm+7sHJy5hPh?=
 =?us-ascii?Q?wajn99VAS0vhV0tjbA3ble6d51aMUoS4ZV+AEi09SIp86jXYJ3YJIhplqMfA?=
 =?us-ascii?Q?UB6b6n2Qjy687dgTMyQZMh43RYOVC/9Fyo1JXqg2O9EJ4i3xBLr5elhE+F7p?=
 =?us-ascii?Q?RVIBGneLqoftd/vV9yag7S/b7uZvfdi0ENwR6J9lj8hD6h7jvmcHHzFOWCQ1?=
 =?us-ascii?Q?jKYeTmKc1NOfmVYgSpZQrXKVDv/VV88wcgDigT+JvmT6E+Fwve/OqN6Z4udf?=
 =?us-ascii?Q?iP6rar78mrQ9pc/9TvjIOHA+1l/iEpznUkeZSam60nFdhsgoNMD5nqIPSQO5?=
 =?us-ascii?Q?QTICS8h8ibslOjx/VbaPEdukmATLyuw8e0YWwsq1qWk+bq39nVBK8GceHk1a?=
 =?us-ascii?Q?7JNplH0Nzd1qyK2E64IrCf73pknxT54MUi3+02xl7Mfo83ciEFzuqtwTAm3Z?=
 =?us-ascii?Q?DUKvA6VSEjmngOLEMxO3yRQxun9eVec7/bfMUZ8vQI5tYaJM0Kyqgh0T46H8?=
 =?us-ascii?Q?az/ZINxa7BNEKzzafSEt+zSAiOfwdMs/cCP8GKUDgN9RzQlOgOYjp5d4KMvH?=
 =?us-ascii?Q?Ft02MPSJKG3BRLTqu8tSvz2zbstMN0C5NcRMPeAHG9zyWAIJFh6Eib2uLqLh?=
 =?us-ascii?Q?f3OoMjAzszH0mcOh84wq348vCkWtuOyIJJ4VBBhrTZ8AkbLufZ/ePW/llIQ3?=
 =?us-ascii?Q?VwvR9bYP4jjQXtUwFmmm2chWCkAXNJ/ncr0SkvP+eowY2cCaPzHdsB0nAnFL?=
 =?us-ascii?Q?mjDzbzet7FYMah5Fteq6lcxZ8+lZF2g3/zA3Lohc7h1Hmw4xH61sAE1AzwfR?=
 =?us-ascii?Q?12rrfhGm3RDrKVCk12D5NG6eXOzs04GBhlELvWnTZUuexKPttXuzQV7IwKSO?=
 =?us-ascii?Q?x39LOZ3nEapUDkS1Bw9klWzxhP+EtS5zei09oaL8bmrfq7jtpjnB4jF+LgBD?=
 =?us-ascii?Q?iEq/Oa3o63VrlJ7LTpzeEm6leMvwOM9E95dFG/yMMpebQ0P4BHX8cJCoJ6i9?=
 =?us-ascii?Q?KGiWFyrOXizWHWkd2Gghd+eKKVN6HIsIRdfk/MKLIFsVNFaRYHHHp6oyPBBU?=
 =?us-ascii?Q?4wwNAxaVqUqs2iFwl0h7n18OFzCZrF6WmubYrUhq+WZrNOZ1latc2UKF4Lb5?=
 =?us-ascii?Q?TxZceX4Ilno4MFfhbiyWmy7zARiLvSVV1rewPDYblZbAuLQywzhYrZFjlxNS?=
 =?us-ascii?Q?IBs+WxI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J6VA6qQS3PTiVLw3hvVdwv/Gn7EfvWGzCaRjEOo9lgdI4PuPXaK/lfuZSmew?=
 =?us-ascii?Q?y8w4az3m/fM9Dzj+yDz1ssRbmVlim5RLV4EImAKKp8wdbg3nzSanUecFI7cJ?=
 =?us-ascii?Q?+ca2qIL4b676zrX8kPz5CekTJhAsIMR6TwldoFjFNAfY0Buy71yCY/VjODpH?=
 =?us-ascii?Q?3tEQEJwe99g7Etd+kM+qY0QVv2J9H0pjOX9Bh+15GaDCwa/SGaVd1VvD4VXs?=
 =?us-ascii?Q?aPzdxGwdBCGS5KwM7MPyByxpXf+HYtPwVEVNERTIDrZEY99LOGynb/KGgcMW?=
 =?us-ascii?Q?TG0bPf6B76gnGcuk9c/DD4B5YC0uJOEWCKJrEWtpH22K9aaBpX7d4+dYfOX9?=
 =?us-ascii?Q?CNYKP6Tm1Nh8NzPLLwvSYCuybmNemQVhC6iN7Ze4NZVedct9oqbTY8VTdbJE?=
 =?us-ascii?Q?VZCHBiHfZ7nAJUORAoVWWLbHyNGAE73p+5a8/+iHetj70gIbqsFM+17vpZwt?=
 =?us-ascii?Q?cmkdq7pCy9vXUu9k5DkktOigMWlZtDEKoFtiTtq7TjIpMxOKQ2knOqAY4BMF?=
 =?us-ascii?Q?SHEBZljjRnHSnU5/VjvUQTZz48P9+SiAW29T7LhWaspDwu/E60zJqKFZEY49?=
 =?us-ascii?Q?t/EDlt7wH+ZBi1LNTSurJIz0gWnjjRR7Tgzly1JfhgioH7OAxNn6BIG1Du1C?=
 =?us-ascii?Q?DqJelw9pRD8eL5orqKSv4hD96WeZHxbaYtKqHwm21QvDr2ODp3hxvrvjB8Cw?=
 =?us-ascii?Q?8FIhoWV+IiJ2u8H/C/Wh2lQkcwPEd1qzDk3dm6APm+6QtMBbqyekxKpH9fSs?=
 =?us-ascii?Q?Ox7jlGmZ9GElpn3xEHjjjecMb1HmQM8xRatucbJP6Xs1TjzLZioZlC0WKkdw?=
 =?us-ascii?Q?gDp4/8rF0PwBsixg55c0S68n4uFwwiU3pO8Mc1Q9XaOrtAd0vJ/FbuWm+jNb?=
 =?us-ascii?Q?TERVBovy3QdqvlAvgoMNoiel7opVj6dHLGZNopk2V1KjvPDWpoQl/rLlW9nj?=
 =?us-ascii?Q?RVzVsPJ8w/VM7vIXlqnlKHsoYvtxnpl9hhnq/qbDbiwYiqHPWsDn+oBvt70c?=
 =?us-ascii?Q?iwnE2oyFs4d/EbDeR9tm/3uM0P9J5Y3AfkKvnMUJQoultIEtDUJo6D/9BIma?=
 =?us-ascii?Q?qIvuuRwMgTni3nFihbbHs+Dx/pr3XRmleZIBroZoMqhuk6gYQQUoiibeB7/V?=
 =?us-ascii?Q?BZK8iko+G/wnv0cG/Q2QpgiTFzS9eXmEJ/ZJn9nNL7cRXBSwt/+YrcLKBsni?=
 =?us-ascii?Q?aE4PC3nhXwAnMTgN811N4jvJ7I7T1utyzmROTZ6wBcmQNovxiZEblnmISLZB?=
 =?us-ascii?Q?5SvMcudoiZouLHTCcA7RNR0D18yF0P8ZloERlDePtGsMTn/oZtcNA3Yx7YcZ?=
 =?us-ascii?Q?/XuiA8tA7oLlz49WPW7e2Njhl85h4ElH1WPUwe5ybKNJz8+/ddEiLa8XYt4i?=
 =?us-ascii?Q?Gr2Y4U1zy99g3zWK4gO07xAN4g3yvzztO5BMqLOvurBdsu0AeToL/E1vxqlT?=
 =?us-ascii?Q?hyxrw7MnEezNBIW8o36EIrlnXtja6YMkJvhH3RqKgh3zrdRbBMY2LIjrcYSY?=
 =?us-ascii?Q?xZM9vKBJkhkzDrmVlV+b4i8V0bvhbBHVvuqa+oAKkytT6p/l+iEJSuKgBWxO?=
 =?us-ascii?Q?xbQnUOCugrbfNlIRLxRcdn97RUYFyjbQar8UuOu+4utzdcvi85xaH2aNgW9K?=
 =?us-ascii?Q?katQnLIlPhvxsGZZuvIfTYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757a7cfb-c592-41d1-84c5-08dc942fc7e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 09:26:51.7241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyG9hcaXNKgCMKpznQiC7wfbMwjSw6YAzPsEqnrJXVcsyvaz9q9yP+2/GPzFDusiO8gA5fbKF+BApl+PumgY7b8XGi56Ohrzb2E8NGzK5hpGyJ7CqR0ONpEfyA2P/ZJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Friday, June 21, 2024 2:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Manasi
> Navare <navaremanasi@chromium.org>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [i-g-t 1/4] tests/kms_vrr: Skip low RR mode check for seamless-v=
irtual
> subtest
>=20
> As the low RR mode is not at all using in seamless-*-virtual subtest, don=
't check
> for it.
>=20
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 4b040fbe4..6fd04505e
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -865,7 +865,7 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>=20
>  	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_SEAMLESS_VIRTUAL_RR)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))

Changes LGTM.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  		return true;
>=20
>  	data->switch_modes[LOW_RR_MODE] =3D
> low_rr_mode_with_same_res(output, data->range.min);
> --
> 2.43.2

