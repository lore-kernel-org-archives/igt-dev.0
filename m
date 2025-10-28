Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E1CCCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 13:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B9910E3EF;
	Tue, 28 Oct 2025 13:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwCaKfSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874610E5CD
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761658007; x=1793194007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6bzM3Qqzc1+5DbzMiemzWuroV2YYDL5j433zsE/P7Ok=;
 b=FwCaKfSMeaFO2gEvXsrg2UANj21Trd+fm4EmCBlMw7u5KYinFI/VV70x
 9ZpM7De+eKI/FOe+04vtkm9P4z2adxymNZ1xTBaY6lnKl8j2c21kgNI9g
 Vmwk8Qj6jozUCm8HLkL9SWRdLW8hC1iIxsKXV4pVgmfusjxSI9Dc/vHHv
 id7AgIxvH56MtLjn1YaLuf9B0YUT3vu2/dFTospTtLwI+dmmZHJnPP+bm
 daGCpqlveB1Ql15gXG3R92vnb0MFTWWqVSOBInNAepiE3Z1J7VgRHZZ8P
 0Pwv2LvE0IRhKAKfqncNXVU3SFF1yA7gQToaX4CoCahG/GUM1OOXS4Ops Q==;
X-CSE-ConnectionGUID: MXkBwiKcQ+qZhcWQASEqIA==
X-CSE-MsgGUID: jK72oe4VTbmYPBjxWQ5RzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81179178"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81179178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:26:47 -0700
X-CSE-ConnectionGUID: GwjESjRAQPi+ibyAuCxBBw==
X-CSE-MsgGUID: fgE2fl0QQdq4mtERHCGiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190538234"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:26:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:26:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 06:26:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chEoItgzoR80gar3syqRcCuNI5ZkY2OMLVkvseHNv4o+IZehxtMDK4nKbw9WOewzH251VMjZ4Kz9g3JkWIjtqlkVjQ+Arbcccv4DwfCmC1LgcCHJ/Eb2WEy+DRd9raIZ9GsviUYBW+48E9aOtWJVWxzpMj3+U9ugx4dqPIsPQN0FN+A9hRPn9g0WYlwfCPpY5WVMUZrZLyHO1DIzMo7AmyGhsSkG7wW54aX/+KbxHpU8wpsjgIGvn2JjOiJT9Gh9n7mFpJTOnxNIFPpkd+aZXJVIedh6jz3MFv1fn1Zo3xXpckBnJJ3ygQ3Gg5yN/+oYA1NoipNjrnB8FFhFnOzK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbuCkBszKoQm/wdn6xOskMABEHFJeS++37iPQsu9c0g=;
 b=R/juU5pW4+nZcIKPl6uzs2+cV8ZCiaKClWPNPrnnqow5SiUGGE9Q1oIvEzgv9AtQuyObI9Q6CcsQIYtLS+RW/cXHJ9M593Bf5fj/VsNo3ly6T5yrCx0VP6YDyDrY0bfi1GtRYxd7d14+L7r74YCamqgDsptRMubMoYM0v2EQw5CO+ReyFc9GTzKOsQ0wtnb8LoBqpfa1KJmbAuhVpWAnqncBv7L6OmYbgGLje0ESRAM+3PWy+tLhzc+OsvejzY7LLivPEz+MiX4vlFrMCb7/UNrvr64XwGdTvLu3DH1wB9hzcashc22JTQf5jmdfttvIWtOgSn4WrzgBVvk/H4YYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 13:26:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 13:26:43 +0000
Date: Tue, 28 Oct 2025 08:26:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
Message-ID: <olee3uu63dypukc3fk6i57h47fakk2tlugmzzitkv6if7kiz43@u6d67yht5ll7>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <9556c7af-8b2e-4cd3-a575-1fbb44fd6c6f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9556c7af-8b2e-4cd3-a575-1fbb44fd6c6f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e0d9c5-539a-4542-bcbf-08de1625a28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cd8zPX1NS/Mqr6rjyqRTsFywDCd4KkViYD50tsFyRHT8skuifQJWatqihRKN?=
 =?us-ascii?Q?eJdTqOw1jHQyRhWdWWgH3BSpc3AO7RLeH1EEBmFFfmfD0kpFeeihfulw7A6b?=
 =?us-ascii?Q?v03stBiMw7DxTpEvVqgA1j/4sCL80pSGKmmTayunBeWNSBAfL5ZKFKOPHSOV?=
 =?us-ascii?Q?91qW4fG+/1LRPOAYffK7lolGpiO8wyv3ywhRmhtOWF/G80lzX+lW7aUpGX2b?=
 =?us-ascii?Q?LMBbsq68hJVdNT6Lvs7/wvP1kLFHQr4To0PrElXpE4wEIxWcsLgMxYt9tu8g?=
 =?us-ascii?Q?gHmli17W3wb5xcASpIHY/3MqQbiPVxuCowwPJ7t4NDqeFNkx5E8QWYaYrNGx?=
 =?us-ascii?Q?pZDb9rsmU1XKpl3bZOl892gbkjca0pAgPOt6129NRKjhomGwhkvOTQDcTZa2?=
 =?us-ascii?Q?78fHlfv+kyDBU4VolJhCrpscoigcdbvCPsW3f4rpkwOAJzhDP53ib7E4VwNG?=
 =?us-ascii?Q?90aZNxzSvAtUC62VbWWqLSSP6dwyo4ecudiHui3BmYBldWuzEBWRc/1NbGih?=
 =?us-ascii?Q?KFRHlaKCcNdk+/BIFbfd8wBJ5kOTv7fPn2Ahg2JUzlcRXbzPm2PPokpZ/hhi?=
 =?us-ascii?Q?60uACc0DHHCFrlw9v4ipN/1ZE8/Kl9eUbxk4ssUs4MJKmafu8TzpUC27GXJs?=
 =?us-ascii?Q?ram0BheR/dfBXUsYxexoGpMMCKN1epFZ071BFT8NoIaBuPx0ad8en0nQOKvQ?=
 =?us-ascii?Q?HdduxXAID6uKjMh3nN4yoauqpeH45kC/bPFNWa/2YozssrRw72UEEoeGJkar?=
 =?us-ascii?Q?cjZWhYIbScURwlsAD/jI2tz/21eVDOu/I2rTFpQMBlvS/JotLW6tUk+OLt9v?=
 =?us-ascii?Q?L7kuBXX+OLNc2D050vWeBpcpdabPBk0SXgFIXDstCaBS4grf+UC/QOtN5sUU?=
 =?us-ascii?Q?FKoRc2pyArvFDAduoNxPSt+CWNtuhl9o9aNMLQi//gZyuTcHsLsJLMToOQRl?=
 =?us-ascii?Q?oDrAlW9MYriOlQoAOyILZJW8DxLwBwUNrgVcxEs/+e5yXMeD2Azgr0LxSNHI?=
 =?us-ascii?Q?bM4ozsbQgnuGdl5t2RJwyjhfjCiIumeTFunAehfF+VA109e3Ym5iZjz43qoJ?=
 =?us-ascii?Q?w5JcomO+rI3O8RfHP1MwkoyzWhqByuG4rCpdfDbYMms5QnahBK4zhTolKHic?=
 =?us-ascii?Q?tc7Pk3ESp2KDuER+Eylb7kHDUAFTQ4dQ9vK6C/gln6GIUyiYnM4S4x5i5/rO?=
 =?us-ascii?Q?H8y5C3aQKIQ0TemeOkkrvrU3CaUxfTSIVzhSIm6eqDUEUh9BbNIxLMMkbNzY?=
 =?us-ascii?Q?QJrjFtwS/6yi/hDDDTfR1D2R0SVvtVhUKv7s9x70wyHJncZvIUvpnjKzOy7l?=
 =?us-ascii?Q?yIFDSBubv4OgCfCF0SeEbrtxHeJ5JMH7/EI3Y4DmO64P3Na9Zn/gh3d6YqNM?=
 =?us-ascii?Q?cAztDPwOPZKtKQIY/vXhoGcnlNOfqaQUHmxTOk1TPPxE7kKY2T2gQkM0T+Qr?=
 =?us-ascii?Q?jVSD9I0qbNErnjaQjRip007/cXRwDGsFv0XP4VZn1Hv0T0+oevs3Sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzT3/wWk01G1eqIYHbPHO0F9Rh6bxxNJ1TxdJ7/PJVtju+l1S6FCmfBnCZHb?=
 =?us-ascii?Q?pfewQYlyZ6QNFwhTSszZqg9FAxwVBcbI5tiGSwBzGMVs5Rwm+c3zygTtexlg?=
 =?us-ascii?Q?6YoOxDuHbfIH6jOGIujmDHc5SU0vpOr8GhMqs8pQvhnHN0L+a0zhYZuvC5WU?=
 =?us-ascii?Q?+Uz8puxulO4NdOb+TEEDjp0O3B7teHwSMPnn2aPez+cGX3Xxe6EvUOrLmNey?=
 =?us-ascii?Q?J+DIh2pmIqOF8bQTJaH/UfA+y7rSEYTrXdE3cIXa2THJ2yLljDHayKXZ7vFk?=
 =?us-ascii?Q?yQfKgKaknZ9GFYr6VMjpbXSYt1rHmZRLFXv2wJ9dFJzyYaykMYmX9L9APx65?=
 =?us-ascii?Q?ozscCQnCsFOAFOB4esurl+Em14kIvewJWwIUAOL4cA9RjUQW/BFzv/GcubX0?=
 =?us-ascii?Q?P3TSS3KU7gLOIWf9t6nxop1wnI9ryhfWP8JfezlVlAQ/jdpSw15tZ645OerG?=
 =?us-ascii?Q?18vJL8p7we5mpqJCyuEGTQGJvt3uptnpU37LAJlygQ4gcHl39E6WZ7fhLQPQ?=
 =?us-ascii?Q?YYCly3MR2N0h7KMTvOKKegTiNeTGR/Vmv3FPG/aPfGrTMTRRsQxKGG8358X9?=
 =?us-ascii?Q?c7Sftsgf39U+ea14KT8GoF+Haqk/69T+ouquiaKPij2gppdom147yLnHpxMD?=
 =?us-ascii?Q?uWgN7RCfp3u2aarD/p23Oux7pLTiG2V64F17v8rL1bTr2j1ikWaJLp/BO5vQ?=
 =?us-ascii?Q?dCcaQu8J6cColZ6BViayk9cwknNIHnDW6t+OE1jqSB4qkXS/1pqbhG7i0zps?=
 =?us-ascii?Q?UXFlH/biCI2Ogm43iRFY9u7ah8xG23ZsA5U0RSlvbYDRmun+eSgMox+krsrj?=
 =?us-ascii?Q?905+ltZm4h2L7di3TwBFZlAgojyvsP2rIYHf4pChDmyb4sSKkyMJnnN5tMtp?=
 =?us-ascii?Q?yIHD7umYR3sa7vs5vY4/bJezscoj4dxO/+Ay+ltkTYYY59nt7sSbtqzpOt1h?=
 =?us-ascii?Q?feuKvN1hpVu00zfyTD1QuGdg0GrRiTZO7nyyF17j61+py0o03hM1UdRiIJmv?=
 =?us-ascii?Q?DC+79CWlXvNDmx9TU08pyvnI/A4JfOlj8U/B2KWSG8oWel3WoIIidj6Bmj9d?=
 =?us-ascii?Q?WV3e1TpUixl779JyDr22zNi98kET7r1Pji1iyMMJ/OAi7MwjZWmQCJwVcapi?=
 =?us-ascii?Q?BQANMCfOrI76uhejyx8GBrBhDTh0qS9RafBlFtPOoLmiXGQlrPutHegxJF8h?=
 =?us-ascii?Q?HOQieXR+X4bNE4IaoMJdd0gTnlywnmx6rmHHB9Mij4mOXuQpnuJ6ltnQ6tcZ?=
 =?us-ascii?Q?qgObdAdny8BR/bfp9fZYFHnl2K1awE2+lgx7R24O+zKLbvQCSekZ/l7qM/tS?=
 =?us-ascii?Q?DEG3oZjfLhmhs5fzGcaIkRN/O5xAY02Jy4VZyuMYpWVoMvAa3YRYCGk5WYWA?=
 =?us-ascii?Q?CWFB10rAsShv+shgYrhQ0k9r/MTFdxih58uIwu7ROIJ/M43YfphXgsey34uj?=
 =?us-ascii?Q?XXeWrrAbl7jhgcc+gCJlJAwhMFMDXtAZXOTI1CUmgXRmMNID1CcS5z26uAOF?=
 =?us-ascii?Q?rzBqj5iSEEQJts3fctfj0loAxKvcNFRFiLUf+nBuv475P12Tu+1X1sz2AaeY?=
 =?us-ascii?Q?77uvLl3E6VIi80xFRZvp/7n5x632TTR/RFt7jwN+6Lh+nVy8FE1wJrS96c93?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e0d9c5-539a-4542-bcbf-08de1625a28c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:26:43.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk0b6LEntBRgG7I9BI9Y2jhgL+m48htIie8HC6jiv7N03D6zL1qa/aO0cXvVlQ5SrgsbPmzvV8phSx7KEP7offzTYx+Ap3KFa0eRkIuGStY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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

On Tue, Oct 28, 2025 at 05:34:03PM +0530, Shekhar Chauhan wrote:
>
>On 10/28/2025 16:12, Kamil Konieczny wrote:
>>Sync with drm-next kernel commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
>>Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com
>>
>>This adds NovaLake-S PCI ids, and with it there are two more PCI
>>ids commits, one for splitting BMG-G21 out of BMG for workarounds
>>and the other adds a kernel macro.
>>
>>78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
>>Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com
>>
>>edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>>Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com
>>
>>v2: squashed into one commit (Lucas)
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>>Cc: Jani Nikula <jani.nikula@intel.com>
>>Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>---
>>  lib/pciids.h | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>>diff --git a/lib/pciids.h b/lib/pciids.h
>>index 76f8d26f9..9f095a99d 100644
>>--- a/lib/pciids.h
>>+++ b/lib/pciids.h
>>@@ -26,6 +26,11 @@
>>  #define __PCIIDS_H__
>>  #ifdef __KERNEL__
>>+#define INTEL_PCI_DEVICE(_id, _info) { \
>>+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>>+	.driver_data = (kernel_ulong_t)(_info), \
>>+}
>>+
>>  #define INTEL_VGA_DEVICE(_id, _info) { \
>>  	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>>  	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>>@@ -844,7 +849,7 @@
>>  	MACRO__(0x64B0, ## __VA_ARGS__)
>>  /* BMG */
>>-#define INTEL_BMG_IDS(MACRO__, ...) \
>>+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
>>  	MACRO__(0xE202, ## __VA_ARGS__), \
>>  	MACRO__(0xE209, ## __VA_ARGS__), \
>>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>>@@ -853,7 +858,10 @@
>>  	MACRO__(0xE210, ## __VA_ARGS__), \
>>  	MACRO__(0xE211, ## __VA_ARGS__), \
>>  	MACRO__(0xE212, ## __VA_ARGS__), \
>>-	MACRO__(0xE216, ## __VA_ARGS__), \
>>+	MACRO__(0xE216, ## __VA_ARGS__)
>>+
>>+#define INTEL_BMG_IDS(MACRO__, ...) \
>
>Um, I'm not sure. I think what Lucas meant was to ask why separate out 
>BMG_IDS and BMG_G21_IDS. Regarding NVL-S, I think they can be in a 
>different commit. Comments, Lucas?

No. the header in igt should follow whatever got merged in the kernel.
A commit with "Sync with kernel commit XXXXXX" is just copying the
header over without changing anything. That's also why I think it
doesn't make sense to keep splitting the commits.

Lucas De Marchi

>
>-shekhar
>
>>+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
>>  	MACRO__(0xE220, ## __VA_ARGS__), \
>>  	MACRO__(0xE221, ## __VA_ARGS__), \
>>  	MACRO__(0xE222, ## __VA_ARGS__), \
>>@@ -876,4 +884,13 @@
>>  	MACRO__(0xFD80, ## __VA_ARGS__), \
>>  	MACRO__(0xFD81, ## __VA_ARGS__)
>>+/* NVL-S */
>>+#define INTEL_NVLS_IDS(MACRO__, ...) \
>>+	MACRO__(0xD740, ## __VA_ARGS__), \
>>+	MACRO__(0xD741, ## __VA_ARGS__), \
>>+	MACRO__(0xD742, ## __VA_ARGS__), \
>>+	MACRO__(0xD743, ## __VA_ARGS__), \
>>+	MACRO__(0xD744, ## __VA_ARGS__), \
>>+	MACRO__(0xD745, ## __VA_ARGS__)
>>+
>>  #endif /* __PCIIDS_H__ */
