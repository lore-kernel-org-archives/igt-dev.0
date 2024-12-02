Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96719D7830D
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 11:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD2F10E6D5;
	Mon,  2 Dec 2024 11:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb4UOfp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B864310E1E5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733138323; x=1764674323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KbUYX7qlTz7Z/ignArBux7it5M5xWgzmfEIA/rsh0NA=;
 b=Yb4UOfp+b+aUgQgK5LZJGZQE4uXe88yG8ZmBMQsIMNBcbDozXZINubfT
 1KNkQtxkz3Fz2fAg3mKmKegITxHtFLkH8Q97FiluqFBmz2zhhgoYy4R2v
 tu+P4GRlhidGSk6GdtEh1E7HI1+FPmxis9QSjFjsBhZEqNWHED8tCJLyc
 1Xzi3ImsSyv5+YYN1e5NTr3xHQn1Im5szvRm3RWACFhOXc5imnGhXNFNe
 CbdXMAteQkZj4Asz/mmOldmFSYxhx8zu/2Oy9zTjCLPg7yOWmB7AOxgKC
 Jkui4ltihmjU8LwOqjTgcOV5FoqILsXDe0o77aE+axKOVPSCCb8IqwH52 g==;
X-CSE-ConnectionGUID: L0J7/R6UQYupXONfuYt5NQ==
X-CSE-MsgGUID: CMdzB279QhShOG5+0rpFFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36961861"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="36961861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 03:18:42 -0800
X-CSE-ConnectionGUID: vj6JnTvqSa2jjo6pun/W0g==
X-CSE-MsgGUID: 3bOLKM59SYqMIt4OyN6lHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="123926764"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 03:18:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 03:18:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 03:18:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 03:18:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs9HxrxzUMXjXrpxugkC3IhkBrqfDToVf3vWX0kLHGiSNQeCaDIr6hP5pUQ/Vi99NB524PAS23DZjDoXhwVrv2aMXb8RcDOQH7xrMxkIj0IUe4s9IvJZkGDS2i116K+7Ooz1USwc7Hqg/NRCeA3CjN8dYfUXR1l1qbWAiS+LlwyPofqZ1KOysufg4N07Ljq/VfXDDwXArRSfqNTPKNKQo4Nt3DQ7cpAn0JOxeS8OaXHtWubiXo7g0G0H/9YAnpZ5mJnozvsbSUqukpylYHluKFdalZTAoPf+a7GKlkc7xPOumcD2uJ8di+xv3VgDmm3gMYdKl61y55B0OIC3bUhLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6NTBM2cVwVvLQ4uaCVFU8VmBlW9ETl5vMZkdaM74jw=;
 b=cC1T+k50RN4PediyixXQ6i28T7M+D1c7BFbiolK+xhXB5TqF87NpdG3rQdHh/dEOuZX03CI79jaoVLXGDJbjwcyHM9JGIGERHKJPCbby4dy/JhDrAnYm7RxIXXQhP1WlnhuaUGqo8hjR8nE9frC64jvu3l7ER/nT/xcs8FfSCKMHvZTUGS7+CPl0PjcZXstqD4FgUYwMeO5SjVcm2zDwiB5HfkaZP2PZm+hM0ka5a8IxQCXR9e/qMReE04Mk5K1Oo6PSYYvIn1QG2Naq+3MKV+mbVt/DuQPp2ia0ObumHVScYq88vtGfMpqfA90vmERaK2fxdFRMwt9DseZAfbxQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 11:18:38 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 11:18:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
Thread-Index: AQHbRJcCq2H5Om6I40W2Oq/iTialVrLSzSNg
Date: Mon, 2 Dec 2024 11:18:38 +0000
Message-ID: <PH7PR11MB60538096EC53283FA21CC752E7352@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
In-Reply-To: <20241202085127.1785594-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ2PR11MB7520:EE_
x-ms-office365-filtering-correlation-id: 953b80a1-523e-4186-9bb6-08dd12c3121e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7bPMxV8mQb9RnhqLjp6/ULN3GK0A4nd8t1b5Pv15lUvkQBV7BBOt+ntH5PbV?=
 =?us-ascii?Q?lAXRWXUrl/5FPoT4bYePmPIPej7e3qnSlQayBMsaN4Bjbo8+0vV4zHYTNXH5?=
 =?us-ascii?Q?X9R6nW7r6DjWhcAFeUy4okfTmRR3BoUPh/KHAxHcfPbP1IWcYJMMzwEXBeiO?=
 =?us-ascii?Q?PT03zGKAXJIHRFJmskKV0RprjgqQffKJcs1gM79UQoIJ+xIrulvvR9YwyR0c?=
 =?us-ascii?Q?32A5e7SF2l4BH9vv2pDXKYhRqTFV7Vr+Kk6IIL9mTO7mh7sqOiisGk25Rp2J?=
 =?us-ascii?Q?3Gmq4sQx1Ejtl70znEaci3WyyNyIZH6iePFgAaSAnkc3VhvSvRxO+YHLw6IW?=
 =?us-ascii?Q?EQV35GePL8cpQALwJScn3AZ+p+5drCrnRWXUnwDJj0d6B4brE7op0p0mBkBE?=
 =?us-ascii?Q?pIP3GVkPFeR3eUUZRt6AfqfWRIjK9oj+wo3mO70uLvgvRdQUvwT5sJkNXYiE?=
 =?us-ascii?Q?mOIkTmoh/7ASixs+QgIZwbFnihDvcuQLEx1vLusJNHNca00P9qAgAenkQJtB?=
 =?us-ascii?Q?hJ0ozmAez9GtRVcA+Yi/aJYKzpWSNmtlVUIwgl9qqmgJ0IkI+eo4SZd3knLi?=
 =?us-ascii?Q?5HhJHy0mq20XhPInen8rGnX8oGn050IWK3ayHXmR//Ty9kfdiLQZ6DO5NaVB?=
 =?us-ascii?Q?NcQWjXi7B7P8ckx334qnB85NBvTm4TfSNZrCRB+5QkLCL3iKL1/RBht6kUxi?=
 =?us-ascii?Q?M2Wjs+Dkib76i/wY1E2AJXB5gHoOQJ/uSMwsk+sJjREGb8cFAl1G2SUb8k67?=
 =?us-ascii?Q?z6p3a6usQyE3CYabGHqSWAShpUdWbL2XmlP2yRGJJxO2KOD9hsBszFLbBx8k?=
 =?us-ascii?Q?r1nLQi3U905R7cHlTsy16HV461xB3xxk4NxY9OW5JNo7llvaGrLSpmELEGxv?=
 =?us-ascii?Q?5Hw7NDY/leyEASzPBliwB1NteASoEujuxqdjv9pTwdkAvZ4UdJS/UDmg+Mdt?=
 =?us-ascii?Q?b+im3FmW/hMd/I3zOzloUwxY0q+zuqCE50tSGPBW87i8eajA+j1U7EWQIop9?=
 =?us-ascii?Q?3GFwy9GFKqG2TmcITlECRoVJw/EKvZqiK84EC99rsM6EeE5csDt4fS9KMLBt?=
 =?us-ascii?Q?fzoFQCp9XAGBYTD+rFvfm8lYaOhp3yskXvLzg+/x5Rf+W58swC2TLpx5FnEw?=
 =?us-ascii?Q?h+IsyCWkxtj/hmmiktQbY1+6R3BB4U5gHd65fV8GREGabc5Y5XSb9Yg4ENRY?=
 =?us-ascii?Q?iARZ4581/FvrnwtPwvGb3xTdS2yoGgRDRVwEuu3ksf7kVdA6MWMuz17P1UdL?=
 =?us-ascii?Q?fEL9FCUk/jM0FEgBxjqsXF/wxH7C1aAPjVRFhw4PNug5la8Bw1FrJg3pfPLu?=
 =?us-ascii?Q?Hncn7nTSdfhoSs0WS5T1Wg3Dc4tdFZMqnUgJd7duQJWyOdAvRaMdDvMYUqMg?=
 =?us-ascii?Q?cEqyN2vq5sZf6WaDgdOR24y8JLoTO1jm1O84n/uwYsaXNvC8iw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GASbUGlgD+E1Nr+DB8yNu/b0JIgt87JHY0BkBsr/gguziM9ZJu8bp/fT5LoB?=
 =?us-ascii?Q?1uoLFYJ4TQUStEHRqAhkmfTSWEIdY7e3w6EAhi5vlMe2S5p+D3TnODGcsgTZ?=
 =?us-ascii?Q?m5zf7bl5nX91FYp84337sTuTkVxabd6h2ZnFqd80rlUEEYyeuufExeBVeR6q?=
 =?us-ascii?Q?BIJ9wGd6zPRUHiJ2fdfuXLVUy86oW4qDlUU5k9NZi0yuvdV5e/pGvMC3hQCF?=
 =?us-ascii?Q?oGtaIFPpEsI2SU08SCU2svm7w06gQlogHqzuizyiir6WsfrHzXdm3QcvAskl?=
 =?us-ascii?Q?6Q1WY62slMiYCpJd+5xyDjnkMe3zoJA/03mWmpInYgx9yCzDUxZiAed32M1F?=
 =?us-ascii?Q?r5Ht52wWruLoNE7Evy4UHimLboMSpUBMt70SLmRfBDd1b75wVzf+xrAi6glZ?=
 =?us-ascii?Q?uP0Pd+GCCh8nnv1XNr7HKmiqF5Xd8qdPMKhnsTw3GURRzqYOg7/kxdZg1OgZ?=
 =?us-ascii?Q?nhaVuW1KisU0HqofkE2dzdKv7t8Y5b8LsiUppUeBEivXK8g7umulJZtw6qPG?=
 =?us-ascii?Q?6dJR8f9F1xuZJ0ArlfdX9mp3jU70itfIpPZNZml2zLMjUVHgyhak+aKb082B?=
 =?us-ascii?Q?kbg5qgth3T8p/VEB1v4Thprq6EL1g4xuimvrw7b9YKONj6GzXRAZz+NDorKM?=
 =?us-ascii?Q?pLC/Cogo+TOS+Sp+6EQhl+9gSrZlti13RgoasfbEm/n4Xv2GMedr1RlGlaDd?=
 =?us-ascii?Q?9DpK1dyU2Zd7xwJ5kn4U+wmbZAkMq4qKjHJ2342xEgmvTFpimQ51R+a59Lni?=
 =?us-ascii?Q?0qP8/rNUhEX9dxJoc9esYBohMel7cJUyphMeQm6GAlPLyzNOvdvTJ0mZulIG?=
 =?us-ascii?Q?V4hD8JBGq95nPYS+/koiMMFARCCxeTYrgfy5gs/gXbbwM/WffqmySNNr9AbF?=
 =?us-ascii?Q?w3W5+bAg2N/wmuQ1ccjxKYqSB7A1gu32MI2sYOBo/pC8C4Z/vTYZQjYCYZfq?=
 =?us-ascii?Q?OrzyIMH7d1aoNI+pLZpVs/Ragr6ZQ4vD0HLDTN+ELlalqzhz5YDEdnunvhAT?=
 =?us-ascii?Q?/arBAI2GSRRyHKGwXu+9cv5LU6pfUDv8jgatangpx6lqcnfyzk8nIebemNeC?=
 =?us-ascii?Q?w0Xih6+40ud6cqBsKqfKXTl9lEcGCSsvy/ye34/TTlosTe8nWRrFLc3XhIzn?=
 =?us-ascii?Q?wXhRb5/j/njjDItaji3ebTheHhqk4Xdv2F/O9ux5gKdSCCidRltKDhQk9Oaz?=
 =?us-ascii?Q?3j4/o3JN66gHpMxrh8WZCHKSXJfAenwjQ1dLJgWMsuVuRl2CzSH0p3IfBgVx?=
 =?us-ascii?Q?p2thgy4nbTI+RJ94yzPQCmf4vv4X1K5BYGBz/2l69ljW9AaTlvQQjdx7c+j+?=
 =?us-ascii?Q?+i/dnfsHBx/z8Mi5hzIM+jgD8HV13kqAugd1OlFBTjyDB0nKfy2tJITLy649?=
 =?us-ascii?Q?k4i9X9FSkz3w7uGr1cT8+Tlgc+go6Iypftud6m9pvPGgLxJRqKN+F4ukHD0p?=
 =?us-ascii?Q?qeYjJ5FZvaZXVRUJcurPaPkoQedwBRxPe90pOYWwca1jOpql/css4SViJC3h?=
 =?us-ascii?Q?Nq8XmGgbiYx/oZyWULYYUtSYMH7qPK11ellWrApIBYM9y9BPLKVcET4W9RDN?=
 =?us-ascii?Q?S0WeManRh8VdLC50BSfns9mMIIobbU68/2iymk/E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953b80a1-523e-4186-9bb6-08dd12c3121e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 11:18:38.8372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PadIMUfk4/sCF6DYmo1q8p+0E++pufdjBIZ8tpDQyG9E5xtHKX5Jrbg52v3EnramqG1Ki21aXjLJ2nM/PxfRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, December 2, 2024 2:21 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
>=20
> Convert `igt_debug` to `igt_info` to provide more context when skipping o=
utputs
> that doesn't fulfil dsc constraints.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_dsc_helper.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c =
index
> 0de09b8e9..cea4304e4 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -69,14 +69,14 @@ bool is_dsc_supported_by_source(int drmfd)  bool
> is_dsc_supported_by_sink(int drmfd, igt_output_t *output)  {
>  	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
> -		igt_debug("DSC not supported on connector %s\n",
> +		igt_info("DSC not supported on connector %s\n",
>  			  output->name);

Alignment should match open parenthesis.
>  		return false;
>  	}
>=20
>  	if (!output_is_internal_panel(output) &&
>  	    !igt_is_fec_supported(drmfd, output->name)) {
> -		igt_debug("DSC cannot be enabled without FEC on %s\n",
> +		igt_info("DSC cannot be enabled without FEC on %s\n",
>  			  output->name);

Same goes here.
>  		return false;
>  	}
> @@ -91,7 +91,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t
> *output, enum pipe pipe)
>=20
>  	if ((connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort) &&
>  	    (pipe =3D=3D PIPE_A) && IS_GEN11(devid)) {
> -		igt_debug("DSC not supported on pipe A on external DP in gen11
> platforms\n");
> +		igt_info("DSC not supported on pipe %s on %s in gen11
> platforms\n",
> +kmstest_pipe_name(pipe), output->name);

line length is 123 columns, exceeding 100 columns.
>  		return false;
>  	}
>=20
> @@ -126,7 +126,7 @@ void force_dsc_output_format(int drmfd, igt_output_t
> *output,  static bool is_dsc_output_format_supported_by_source(int disp_v=
er,
> enum dsc_output_format output_format)  {
>  	if (disp_ver < 14 && output_format =3D=3D DSC_FORMAT_YCBCR420) {
> -		igt_debug("Output format DSC YCBCR420 not supported on D13
> and older platforms\n");
> +		igt_info("Output format DSC YCBCR420 not supported on D13
> and older
> +platforms\n");
>  		return false;
>  	}
>=20
> @@ -140,7 +140,7 @@ bool is_dsc_output_format_supported(int drmfd, int
> disp_ver, igt_output_t *outpu
>  		return false;
>=20
>  	if (!igt_is_dsc_output_format_supported_by_sink(drmfd, output->name,
> output_format)) {
> -		igt_debug("DSC %s output format not supported on connector
> %s\n",
> +		igt_info("DSC %s output format not supported on connector
> %s\n",
>  			  kmstest_dsc_output_format_str(output_format),

Alignment should match open parenthesis.

Regards,
Pranay Samala
> output->name);
>  		return false;
>  	}
> @@ -182,7 +182,7 @@ void restore_force_dsc_fractional_bpp_en(void)
>  static bool is_dsc_fractional_bpp_supported_by_source(int disp_ver)  {
>  	if (disp_ver < 14) {
> -		igt_debug("DSC fractional bpp not supported on D13 and older
> platforms\n");
> +		igt_info("DSC fractional bpp not supported on D13 and older
> +platforms\n");
>  		return false;
>  	}
>=20
> @@ -195,7 +195,7 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, in=
t
> drmfd, igt_output_t *outp
>  		return false;
>=20
>  	if (!igt_is_dsc_fractional_bpp_supported_by_sink(drmfd, output->name))
> {
> -		igt_debug("DSC fractional bpp not supported on connector
> %s\n", output->name);
> +		igt_info("DSC fractional bpp not supported on connector %s\n",
> +output->name);
>  		return false;
>  	}
>=20
> --
> 2.25.1

