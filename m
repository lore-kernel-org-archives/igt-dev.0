Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C021C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 18:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEED010E8BE;
	Wed,  2 Apr 2025 18:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+MJrS5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772B610E8C1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743618522; x=1775154522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KJS/ubzvCH/gRK0blDuZHpkhIj38labLmceS0CYEvEU=;
 b=I+MJrS5fgI8N+HygoYZubyn8K+v4DkQ3dKM0IJu2Hb7ygi9En7ahwUKQ
 k9WJgLsFUJbHsaTLRE9OuK9rjJKhQtOZ3y+zNnlhQU9zaFHMNZ/Tfz/8P
 /apqRZd5SJL2isUEkexv3LbVeVSUMqNGB8Vt3pvBXeaBd1WbPVH9CGoRK
 YmtnrL+ZnV0ERYl2kb523bCoQQEGAjyZE8eU1lsJGuMqb8s+Vtc4s7xbJ
 au9blaNdtu4ktw1hqrht21B3BQtOULlcqY1Y/PY21511NuQEDdYAxvHfd
 dg9XAm0CfeVRgLmGX2TwQCIiG8+w+suShjpf9N4EXBcksU5mcGGVuwNyA g==;
X-CSE-ConnectionGUID: oieKCGUfR8atb84En2p2gQ==
X-CSE-MsgGUID: k/nRU8Q3Su6g5vieRYz60Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56366634"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="56366634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:28:42 -0700
X-CSE-ConnectionGUID: RO7e5s94QuiMJh43Ay6gKw==
X-CSE-MsgGUID: 10qDjCZQTpuCm9B/3j5O7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="127625043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 11:28:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 11:28:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 11:28:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 11:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oADMCsGNRDskc7hRkf3g2r9jRLMLuhKLLCfDx7yPookn3rpA/w8Vr7PxVvHNsxR40JI2kIllQLCI8r0baDwb0FMV5UI7U6o3+rVUwRvGRH5WODMK3x68xt8nQNwHqXCCqn64w2nfVLJ95N1pvg5uaONXgVFyQ7BIUTPZpJ43/3SQpWoIjwIirvuMFgsBuVWn7xQFfKdotHdJzwL1YzLYQ55dK0/MWhJ+eRR1EGmiKB0i6voFZwPej5mSBjV7PcbjpCZ1KZyXpCwGJulE8Coy7uyJYOZirFifbRDVFW3hgj2hv51h9vyU6Pfp3OgS4Zl92/Gt8xOdUP7206s+WKbV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbl6mZWGC0TF4rdzhV9W4KEMCC+42uRBkSogAZ7sw1g=;
 b=YsMzrrTQr3ke2taB/jJ/NQ7Eb4yrqqV1JdDW60wE99ja5FJPX7hco+zwfWakxFNZ0HMpEy6RI6v5cfcGSZofIaNRwFcscaytKMAOj9YfmwCj1F4kmcgvoZo0+PcaaGLaVxLzjLRaovSTPES9g7R1c7PK2KqD8ibgFgWnBd5r7bx8LqLmLnXyoUPZK3p0eL0x68PVS0PdUkKzSr79cmbNMIsMeh+I1H7aiUCSC0DBrOsR7p2h+OEJBSiG8cDbnhl9w6+ws3UybbnooV4Zu3Ian6dPdfAGxamvtEDS4oV7qMoSiNsyUvibTnu8pdTDY+gc8c6AotvT2uK620HrxYwkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 18:28:39 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 18:28:38 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Peter Senna
 Tschudin" <peter.senna@linux.intel.com>
Subject: RE: [PATCH i-g-t v1 2/2] intel-ci/xe: Block more i915 tests in Xe runs
Thread-Topic: [PATCH i-g-t v1 2/2] intel-ci/xe: Block more i915 tests in Xe
 runs
Thread-Index: AQHbo+occTMxGvlH/ESaj7Jdg0yyBLOQsglw
Date: Wed, 2 Apr 2025 18:28:38 +0000
Message-ID: <PH0PR11MB5782DF52982A6A12505ECC9B82AF2@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
 <20250402161207.66601-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250402161207.66601-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|CYYPR11MB8386:EE_
x-ms-office365-filtering-correlation-id: 7118d9a7-3277-47eb-774b-08dd72143023
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LoWpDvud+Ia7aN4075pTElaNGxBIrs7vjZyUCab6s5KPlmcGFKeyD++yfx+3?=
 =?us-ascii?Q?XsJk/UdvSxcQl877P8jz6DdHsqwoj2G66c4gWwhS3BrbvhBnWO3kCyeCnhyc?=
 =?us-ascii?Q?TkeEGk3uF+z+hbIJux8SXl9VLhHWHOWjyeHJ33FDCsexrBCfQ21c9sTIAnVi?=
 =?us-ascii?Q?W9awfOzWRuE8WFU6n8PhPWPHG0XeTMm04BOKIaQWxK16JzNkHTmJSrWHrrcc?=
 =?us-ascii?Q?WUBpk+Q3lhOx6TfhhE/5m2oSxznWJcJyR3tMyDxmJfJe9r5aSXw2z/wp0qNL?=
 =?us-ascii?Q?DW0yUYRDvFUr5diUstTZe6KVNZhfqkUQ+wlqQA7NLK8yiQrsbcg0Bq/4cn0s?=
 =?us-ascii?Q?ImL8gD5JuinkJyVc8QFzCbhy7wVzYV9QNMpNn4iRs7ofOZZTwPzteXzjVQo1?=
 =?us-ascii?Q?NprykXZgusBJRJ1tMjOiUlmg+nfF9Gbvpol8d3osmJDRP0JRzWOERmty+vHP?=
 =?us-ascii?Q?GZC36dQJ6qGUFYq5nOiNjfQ1raA83PC0LuAgMKLJ1LHStSw1fcPORKlOCMFq?=
 =?us-ascii?Q?aD3dRuGY5Vttf/JSKjQye0qCI4SNJxYd5pbv3a5DBIWhoirQp4JtDawHMig2?=
 =?us-ascii?Q?9z1jEAh9EvQOBmmsted8CDd1L0Am0/OVqyHbLVSAYDhlXfwx/mNuxCmHMUrY?=
 =?us-ascii?Q?NukeZFuN5hl9hnCFQZ/5DgZXBlJlJqPjYfAOisxV0kRzP3CftXZ2ErNjrmko?=
 =?us-ascii?Q?NtbYiEvjq5T49DqhUqGADhJgqckpVMfIGcz0b6n1JxL0Cxw3cjOkUCLwqLwR?=
 =?us-ascii?Q?sj2HBZT6vCZbMgmCj7zdylYtKxzHKtN/UgB7Ti8LW68obVAAEkgAE5+Eud86?=
 =?us-ascii?Q?v7Y+IMHA7oRh99ShLzfyeo8+ibgttv8G2myO8msniXG3C8S2HfzX8Z74tfvT?=
 =?us-ascii?Q?gYgP6VefqBm4XOjSW9V7FoVgNBzuCPATzim9+2oX2RMXm4UbxqW56MBECzDX?=
 =?us-ascii?Q?OFzoeCgYdJffENKjY0V9KcswW++6a/KcgqzZhzLLilAuFjNjOzd30HOpS6Z7?=
 =?us-ascii?Q?CO9MKzVJbrJghho4yuc1eiw7Pv3SBl6nJaGGfun9z5wX5+kOWj7T3anlTIRa?=
 =?us-ascii?Q?6ugn3+2ZbxiHuABe2bkkqRzF4EKihu6v1TlwAm097/qGYpSJWI+DMjaaRJPD?=
 =?us-ascii?Q?Cc4zTKEbqsFo9Il3alHLp1bCzgUA+kZjPJ+zcpOHZvEa59GoZOfsHQYXMwyu?=
 =?us-ascii?Q?sSGR+R9vStYAcl2QTqPHlcEB2wkuE52ziooIRzxbvEWlKNAS8ncCx0qB1Vwn?=
 =?us-ascii?Q?9m649p6q1qnmRDOuhA9LN+lK57wNNDHq8UEiv/e8ONXVMi5iaBT0Mwh8Ig0G?=
 =?us-ascii?Q?R2GHmNfAzlEb9x/zlRT/llfx3nJenVHsbnUcAXJIB1oHbi1LGfe+SoiOajxy?=
 =?us-ascii?Q?oHS2ioQ1WnFdInOu3TRmdx8gLqpywCTd0wqvPjX2DhjV14KWP5dpd5exC7gJ?=
 =?us-ascii?Q?mUrqx+eVb9GX+rRvie678QcS+Bz9Netj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SGDIXjvuUt7PWIUYCS9rajEjnb+nT+j0iGQztcJ4qOc7UDW48ge+N0X6OmgE?=
 =?us-ascii?Q?TCyHqpReRRJvi2Z8somiW6nor2NkRLsyyRklYKPcBn3dktamZW5h6fwriHnM?=
 =?us-ascii?Q?0N6t++3b4pT8GUL4OYgN/iR2UEINvJBnsmMGaBUgOYbvCcx4KEnYCfv2Q5vx?=
 =?us-ascii?Q?TwHi0Ix5AT3oDv8EqIhP8IyFcRVBAlAqxqhkEgCRJEOSjseO+02vgW3HqXSp?=
 =?us-ascii?Q?CLvy2FuL/03lW8fftXZIyit6wGXJcRUUEFp50nHH0drylh3sq43b287JO4sr?=
 =?us-ascii?Q?UCygVV97WqypQeS/uqZgpkazqJ6akrprPM44kfiIodzPg40rGCljAKI/432+?=
 =?us-ascii?Q?xwBNjyd6FKGJYeGAgY8w7IYWck/YWeNRvqC0dDr3dJLotvbar+ZQHbSf9I5N?=
 =?us-ascii?Q?BBdRAKxcnzEKXuxL09CaWXWDD8Je3zy1u+O4119o/hfpmMYPJk38UGRcQ0Cz?=
 =?us-ascii?Q?eFismchvs8HUY4A/56T+8nteqFjYs3OCkYHxc+LDO7SiZTe1buL2rYFL/YIE?=
 =?us-ascii?Q?nRRO0V6g54W70+KY3NZlbnOfnjqe6TWlJiaCF+HAc7TxkFVskrbVi5hMuQwQ?=
 =?us-ascii?Q?M44oC68NgWA/hWQHYwy8ohmjW8hgjFQuvhf13YgazKY2bgOCLjcdeUCWQv5Q?=
 =?us-ascii?Q?PTlQWpb5r3ABCCIhmHbJcfvuogDUvQz6C29qHQtXuzPULgezrYgjytDqUpL+?=
 =?us-ascii?Q?bfEJz9hFRXa5iOZzMZ96kEdwajDgd2sj8xF38m126qQSfe4K+0vTHT1eDPB/?=
 =?us-ascii?Q?ljzl8ewVVHQAWb3nMLXv7juCD7PtkQH35DQux51wRDsm4akohPWD5Uo7/fRy?=
 =?us-ascii?Q?z3aeKfJDMHmQXonJ6fJC/n9CYhwG2zX88Xbn0lvALWbk1yh3GebRSV6VQa2D?=
 =?us-ascii?Q?debgCMcolb01J5UxK2sjJcEyX9J0OaFvEOU1KX+P2T9qrEgt/yoDNLjMT6lT?=
 =?us-ascii?Q?7UfStr2FZKF0p9NYwkviXUiApaKjXTLe1sMt2rFvfTTQSshl9Y15ehxwHoRh?=
 =?us-ascii?Q?VZqJOrBa+GH2NoqNsBRPq6FdfazGLLMX2al+4NLJNPzGZmgHQ3AehCQLr0JN?=
 =?us-ascii?Q?D0HPZ2oh4Z4daifGDLI8TxnrHAIlmRmgSSjn4vXMmRt6EuWPQe5Yw74I94Ti?=
 =?us-ascii?Q?PsNKfle7nuwvo+LEFfbfPjxKbMsW97rEGnM4Vyznrr9LqKLeoBFUA2D2RcNW?=
 =?us-ascii?Q?o6OZKIjMjp3m22CG9kKGn1KM4A0HP1qH1cfRPkK0MXWPn7Od/xaYPId79Y1W?=
 =?us-ascii?Q?SuTg0cF8pY0GXVNYsXpfcYPx/NQD6IHdn7HojMQoUGUTy9R8+hRtiTyX0qtb?=
 =?us-ascii?Q?yCXKO5lQqkQzrMNdR9Ct/dTW+mfPbM+zUSO2lEPbewdbD301V8JoEzzRSv2b?=
 =?us-ascii?Q?8fzVqSN9TVzpensz8cqJSWGQAxK6VOCvx2+Xp9T9Ltc94jrIX6/UDSk4PmAf?=
 =?us-ascii?Q?4woqD6CN9U2t6j//Rn81wzxy5IW1JAjChvlLEIZY+N/J7OEkeU9Ktoas6qkI?=
 =?us-ascii?Q?Vx2KgOJSDnF4lNJTu/wZuWwSGRK2a4UcuNwsABdBuP0AmFNpzkVUmbKM0Fy0?=
 =?us-ascii?Q?/bVTkOETg2ScfY1IiP0keG75QcFYY5vYbUI/Rx4zNNbYdk/I1OO+/Um8OIqT?=
 =?us-ascii?Q?pBOcrWrymAfCQu60sazOaEU64RBSvf0ELnIJHeIzCbAY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7118d9a7-3277-47eb-774b-08dd72143023
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 18:28:38.8935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSAENPddET+VAFQ0s3rEkpsGtAE/mNPw/2wOfhAVY3HQ7gMqo313fpyRsy+8AnGXFrkYU65VzvZ+8AyDllOU6L4JmfT8NA7ZLYwyPk7cR2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Wednesday, April 2, 2025 9:12 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Piecielska, Katarz=
yna
> <katarzyna.piecielska@intel.com>; Peter Senna Tschudin
> <peter.senna@linux.intel.com>
> Subject: [PATCH i-g-t v1 2/2] intel-ci/xe: Block more i915 tests in Xe ru=
ns
>=20
> There was added new generic Intel test intel_sysfs_debugfs which checks s=
ysfs
> and debugfs for both i915 and Xe.
> Lets block i915 ones for Xe runs.
>=20
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> 80ceba9a5..d02d0f73e 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -20,6 +20,7 @@ igt@gen.*
>  igt@i915_.*
>  igt@perf.*
>  igt@sysfs_.*
> +igt@.*@i915.*
>=20
> ################################################################
> ##
>  # Exclude mock DRM KUnit from IGT, as those already run at build  # time=
 on
> Intel CI
> --
> 2.49.0

