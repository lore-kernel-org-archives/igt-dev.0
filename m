Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807D6C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 05:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA510E10D;
	Thu, 13 Jun 2024 05:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bt4dBk9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412B410E10D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 05:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718256569; x=1749792569;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=POINpKtDjVIRz4tRplVvU3ge5GvJ58UevOZSsDvpcnU=;
 b=bt4dBk9YRQKV+EfYqTMrAv4NDbF9YjuwwjGvlk0tWLn9SuXe3kpXkRwn
 37FxYMg6IBUgB38qr++bqYSfarBSLau+clykyqNO/OGUdmhsROCQF8rEs
 zYNTP1HtfH7y+9/Suj/2rlJljkBoo4lrZSbExHHNfKL1EF3f/WqgE3Ejw
 +2LqqbHOuhC0OUPxK8trRjTZT9lOvbT26CLfjGrC7sqCNMXvWrKQogWB5
 hWFVue0M8P9nu/Z6abY9a+ZSIiabft2xNEG3DCfcHXF9icgA14zSh7H2S
 n3J9GXEZNFxaNVI/Ejufv0bBj2LOmudmdypes4i6HBEktE+25Eby2238H Q==;
X-CSE-ConnectionGUID: V6xGACKQSLOnAAjgGa7L1A==
X-CSE-MsgGUID: 6KwgsF2zRU6k8nLD10uuLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15019272"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15019272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 22:29:28 -0700
X-CSE-ConnectionGUID: e0M5Cu8vSLSTHUlSZ4O7iw==
X-CSE-MsgGUID: Vn1BeNhbRk+7KBZUDn+69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44410541"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 22:29:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 22:29:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 22:29:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 22:29:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 22:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSo8YJDMgr+wv5NGTe218ds14/h3acCvY6EACCJl7WmAZOWzfJI8YthW8EMgsjNX7yh1HFiwBi9MQVsJaqS2GsDCYf5F60nQDKV8QSQMMObJBSF/3WQRjP49HfjLsihp+Di7IWNO6wj2NEXRuYRiNYs0nLT4dqZ5ulZs+aGuMXlNZN41AS25vBqoY4UFkjbgfc+LXlbjBnrLZaEDvjw+xadGnx4nUKlHkOtjiUiK6PbF4T/b0USTxGqHxRERJ63yOomHlbxzSJmXF/mSnACAudPOe1Pk8yx0skcTPw6MfIoikGG4bNHOjqz5xM+p0xzjLVRacuCmNh+lrf0W94rs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrG1mxYC9M6stB2c3RbM4suVfB2P6P/18Vsf8OyJOrE=;
 b=UFXsD0KbOlfEty49Q6UhconA7laq9pB+XN+SIpickn9eotKF3v1822AW2GCF3BXeUq1RAH47Fxlk9O1NctkHXmyNJBXAWUrwR2JYeDwzq8Aus1HBDkca1WDXXRvvonmB+aGE9rJ9qhI9z1E5wzNBbS9hg9660J9Wl/wLGBHvwF7ixPEKgJeqx4FZC6qYG3AfCamLmYu06fl+RHta69QwBtEeHZHkWCrRL8Pnu6lYj2Mlsq47LIosra5H42PSo4rrfQtAY7g/5ZhGNaEo3AFjI8dmVI0lY6jMEJdvNW99FYvoIynY1WD3ORdFTLnWLOZ/qsDGll/V/I9nBpgX1+UuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 05:29:25 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 05:29:25 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Senna Tschudin, 
 Peter" <peter.senna.tschudin@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: block gem_exec_capture@many*
Thread-Topic: [PATCH i-g-t] intel-ci: block gem_exec_capture@many*
Thread-Index: AQHavNE/ZqI6liQK50mYqVUN9GsG9LHFK3zA
Date: Thu, 13 Jun 2024 05:29:24 +0000
Message-ID: <CH3PR11MB8434EAB217A3D2B963173B048DC12@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240612140132.109022-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240612140132.109022-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6692:EE_
x-ms-office365-filtering-correlation-id: 69c2ad45-d84e-4e19-7342-08dc8b69c999
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230034|366010|1800799018|376008|38070700012;
x-microsoft-antispam-message-info: =?us-ascii?Q?HyD0YK6AHUryaB5BYqXUVumHpxJyuCbGsoZ8lBFp2FtrQUO8QU9BXe2+aLKl?=
 =?us-ascii?Q?pDOBC+TojfAakCAD4vXC/gyFlVdiNtaB4BTeFV2ZDNb36slaqAG/6z2uLHRw?=
 =?us-ascii?Q?utbY41e7cJad8nWpaxKpBnHVvfaWL16YhWt7btDPiglY084fmASCVeSYWFQw?=
 =?us-ascii?Q?9MN4WZ4R8SrWMeItj+eiwMIA/I3/vShF706Yvq0vPmk0ySnDGIjwAtInNMPA?=
 =?us-ascii?Q?GR71Fkk8QpJbn7T/dCH+OxDRj28Gbx9EfUNBRjhmkqYfcGdT451KRgTgd/BV?=
 =?us-ascii?Q?/UgonGvRwisOarUzTTpMdBgcu3GaXukWH/ov+ego5V4jDqP5dKLxarpSWG/Y?=
 =?us-ascii?Q?VVPrzuiIjHh9uDAIwuZqSi/ch8C7P9AR3Y9cxkweZHA0LgnMyENMkn5BX/6o?=
 =?us-ascii?Q?zsB0HN+7hyDmKpOkFcfsdIj97ZvpTREDLn/Ziz3oEfHZI+DVctU1bTSMcB4H?=
 =?us-ascii?Q?dnNL/6poaY5uej+XKqhf7nIaWbm9OOR9EHtrvIXytkcF9LA1fBke+bp2CUZc?=
 =?us-ascii?Q?6SvZfYezCACYRpJuLEQXiUUxvUCBCwdd+t0LlQgr7CYWFMKzY48WG9tOqj8d?=
 =?us-ascii?Q?/B9Yhw91ZRnEUnRd7VCaHzhzXLP/9D1bF/llxxncKmxx6nV/UEslthpmXbQv?=
 =?us-ascii?Q?nFFf+wqNinRA60JKhjsyqZz+bZtEprAGG/G3pa/tGr3dnEc2FREz2dO+oNq/?=
 =?us-ascii?Q?zk8eCGYhpnLeDg69BzGzmaVJA7Mz46SWVbKVWu0U0SK/10PEeLIyfY23ygCZ?=
 =?us-ascii?Q?B6YlmCZ5frg88KfT/ImCbtCg7yeT7Yy5+I4ixkn6epg0hk936+QGMV7d34SZ?=
 =?us-ascii?Q?2hhL+XRwYdtdZwAa/ex2HGUBr4AlJPn33NT31ArGQ1mRVeof9uOQtEpISZPT?=
 =?us-ascii?Q?i3IsxsnUKUAbJRdXGyPS00QGRskcto+rUgGHEbVjUMemv+WkESncRVmYwHDO?=
 =?us-ascii?Q?2CBmUgfFEBxZRy17eR5S0R8DFbuEehcv9uvmjdxaSe3tCj1KPBiLbPgyAPUD?=
 =?us-ascii?Q?I0Tq6nwku2bwQ5ZP9/HMkhDsg8XSbmyvytHONBaY2L6zZ5NjmWPoywwiKgTM?=
 =?us-ascii?Q?vWdoRaafggdhB7W1nXck3xJNcb6V499b1YcEuLPySiGnTgAVh+4kk355MZ7w?=
 =?us-ascii?Q?tz+xFWmFHxK/nM+JS0/6nwEJeqAj2bUBfbNJV6Zf/UNPHsPG8chtFPNhy0iT?=
 =?us-ascii?Q?cyj4XMiXRX44IWaqD5OpvuHyA2QGzBwAv1p4TUtXCAexoyZQ1LF5BVAZd66m?=
 =?us-ascii?Q?Nz6rd4jHhSTb/LU+ZddfuEuURxD4L19piHTgEoSuLdqNwOX7mnHAVhKDYUtt?=
 =?us-ascii?Q?XVKmSAm6FcHlJAfMER2jGujefTyE2xoqOVxShdn8n9LDZlFXGneEb/QbPheN?=
 =?us-ascii?Q?oaNwh5I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(366010)(1800799018)(376008)(38070700012); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j15kAx1ojyr7QrU1waeRL7V9RO+rsceaBn05AR+6jlSJGH+W/M+Xo/XDIoR8?=
 =?us-ascii?Q?q9za9hjbHCxv459QxKUELJruqbVvZXeAOOZgFXotxy7+LZ5lH0GekV6Vrhmj?=
 =?us-ascii?Q?Ze/GYKIylgbF74pR9EsHau7oy3n2R7usrspgeCVqf3VvzTv1QzQCWziG9T7M?=
 =?us-ascii?Q?FpkVRdy+aKva9upVSSvDPW8mvp5r7KUtHGdDRp2vyMkiSFp1NXwxynoB3lDI?=
 =?us-ascii?Q?vaWRuadLwDZxbrM1tKoWx+9kZNRffaouC9YH0zC6myIrBiVkvKRkBTWkw4y/?=
 =?us-ascii?Q?/a5AsDQcHBCbhqymaaOQ36MsIXfXlLztK/CG7aPaShlg+0qGLx8b40/vLJ/z?=
 =?us-ascii?Q?WTWG3c2uY7L+N6wAgptDG8zQ5WELKrWYl/HKKBXo/vvjZkPsndSdC3r1TPeP?=
 =?us-ascii?Q?5E8LtfSqrZxWaoRabUTakRLLN0jhczx77zf4Lg8Yr7c9zQimTbFFn8hksQgB?=
 =?us-ascii?Q?HQlC6Ecr+art54eaazSDmZhh3uuNO7BPodL0MMLyAvGtQc1k5JcQgTYohV5q?=
 =?us-ascii?Q?kbQGUB9m2VwkIJ6wU45eWOLLt5WOQq7R75iYZBSF6O4id0qLarqtf2w4c2Vt?=
 =?us-ascii?Q?SzKU+a5Yrn/x9j4Lzzz4QDtrPXQ4mwwDu6qDnEQ2UTA4DpKz4AQiUIau7+9w?=
 =?us-ascii?Q?4w/rnddmKbx8fgvGVl/FGsQtUa5dFvCTh7ZxMjzcCfLBsnjcg1N4FiLkz9MX?=
 =?us-ascii?Q?Jw/IEtFRvsMJQTC/wD2AGvfwEfsenzv3PfMZozGZQ0Wh2ueHKu5wcg41YeM7?=
 =?us-ascii?Q?bsG6+MUW+Mzbe7vftX8n93TJEK1DFRAJUR5tiUyXoLQqbn9Ce4dOzFZ8WLmE?=
 =?us-ascii?Q?q24C7qvzR0y9FSixopIgyAL8K968l4f6BEYpfPgeeb6tAbuI1SCybBh8rMr5?=
 =?us-ascii?Q?AtDh7BkVCXRIq7kahcf8MvYEov4T3HdxEh806dpHT6wwns+1WaHCa3fOmA8I?=
 =?us-ascii?Q?jncKri0MxdprIHkzPj24aRKiWfDVyMzih5ralIdnlDHHRVbz5cPOlt8V9WG2?=
 =?us-ascii?Q?51xUMVETD3f49PEzCjogqe3dmqe3pbqIvhn7Jll3I6LnNrBM4N7qrS8KBnzC?=
 =?us-ascii?Q?MqVL4L7HM1OI6dyHCTwEwsyiuqNae+UKcqk+b2glO1haSNwTjvmnbUH2f8x9?=
 =?us-ascii?Q?92WIitBFDhakVxVggw6t1UzzdelHs2T01Fp4SsbHa9LT/1P445x+DonV3VCr?=
 =?us-ascii?Q?29lDfeaszi3dPg4/tnC6/g5EP4fiDEnbyWchY/3Kls7JQVslB0yNG43vmQHt?=
 =?us-ascii?Q?LjPKgfLLSJ5tkKmUchDXis2SoztR+D5qBkKadU8Nz19JgBrPh6Y7vlhqmYit?=
 =?us-ascii?Q?0ayAywtI6ae8K+5BZi5NwsVpwNy153j5MoSpBzfsStQycYHFH0k+nPaqpBD9?=
 =?us-ascii?Q?ojdn4Pdy2JPmNckgB1W7NlNg5IsLqc34sqLqzgxVeFpdf/izifSmuDHSR0sy?=
 =?us-ascii?Q?s16vPKAFCfK2ZhseCLgX+0mDrqP3Kb8JjlFQiVMgnF1FDdO1vKq2+ZdJ0cps?=
 =?us-ascii?Q?MVH7dJrNpmezDwshLJTV3Pm1qiClc2yeVYvxMpDfyXoA9m1DoS7V96jy7yTb?=
 =?us-ascii?Q?XuTEdcahSSGDuu5MS3Kk2qYZ+QeEIMXME577oSm8OM1Towu+fSJjP6lDIe1R?=
 =?us-ascii?Q?KgamDI6zoH0Q4NwsTKdhs1wbUBi1T3l8iamhAnPZ0MqN2Y7bLEZ/7nYhqkka?=
 =?us-ascii?Q?SW16pQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c2ad45-d84e-4e19-7342-08dc8b69c999
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 05:29:24.9704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJDQ3HAy4vPI7U4WYGxN56OPDyQhu/M6UWyiHLo0Uwvb6YIOLzSyIAqzoFJuN0wjzrXr+EKGE/pOzL4C8oHeNY8NW3tY7eL6iUU5KNwVrYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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

LGTM,
Acked-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Wednesday, June 12, 2024 7:32 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Piecielska, Katarz=
yna
> <katarzyna.piecielska@intel.com>; Senna Tschudin, Peter
> <peter.senna.tschudin@intel.com>
> Subject: [PATCH i-g-t] intel-ci: block gem_exec_capture@many*
>=20
> Block all of gem_exec_capture@many* subtests, they are not meant to be ru=
n
> in CI due to long time needed for their completion.
>=20
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Peter Senna Tschudin <peter.senna.tschudin@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt =
index
> 4fdefb90d..00f037158 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -28,7 +28,7 @@ igt@gem_ctx_switch(@.*)?
>  igt@gem_evict_alignment(@.*)?
>  igt@gem_evict_everything(@.*)?
>  igt@gem_exec_big@(?!.*single).*
> -igt@gem_exec_capture@many-(?!4K-).*
> +igt@gem_exec_capture@many-.*
>  igt@gem_exec_fair@(?!.*basic).*
>  igt@gem_exec_fence@.*hang.*
>  igt@gem_exec_flush@(?!.*basic).*
> --
> 2.43.0

