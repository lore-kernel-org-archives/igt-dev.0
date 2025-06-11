Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB4C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 12:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8910E652;
	Wed, 11 Jun 2025 12:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QK4RFMZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091910E656
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749645085; x=1781181085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jB7FiNM0z+859it32nLuN8QtC1yJ3+h8rDGoBhDZQUo=;
 b=QK4RFMZHGR7kRfuLEjEU1bjkNVsBKfGKcfnyuK7V9PvLpFrPTtMwshI4
 ay5bQX7nb/pwTWFfmJMtx5n+v1zcVY9zfIDL/ztzaCNz12FCj2/EU7o1r
 NHdeRZBgdV9LVqn6ebNA7qFmGp4X835C0664DxIRmc45F8K5LXjKfLkqM
 xsHKLRfnd8Otkhcfj9WNzBpopSlmhhiOx81QODhSjAe9NfjDsugoee5n8
 7Ngh+RIpRAA7YRq2PaLjf5bTROErV3DxRR89RBmwalMB6Tdiv0bchjTEN
 G/Jo/46k4NMsE11ALp2oDM+kaNiriWAJe2iMxId8ipscXe0ltRMFJTZRK Q==;
X-CSE-ConnectionGUID: pRCLOntSR6221sYv5uBjMg==
X-CSE-MsgGUID: 0BjCG2MwRK2YXGky7oDDzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63196109"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63196109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:31:21 -0700
X-CSE-ConnectionGUID: 33WzBNL4QfSXDqiUwWzrlQ==
X-CSE-MsgGUID: 2LLfnRx+Szudw8Ocz/HkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="152073505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:31:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:31:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 05:31:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1V6iB5ocnnC5GMkPyFkepT5a15yVdPViEhQaOfdJlqp32M6zH9q9CYAiR1q9hx65MFtmyAHD17ERwrAVQyDBlKRq9YfQcciHhDZgMfbQoigav8ojkSqli0uJB9ZQU0vKyr1GTS8+qfSEklvLgT/ijahqm3YNmskOXFlnAvtNWpOIJqa1MKe26ZW575eN6TlxZ1mFwpsFA8tNuaqS2Gq79tLn6GPr+zrs+4/uD4u6YWxqQeXFwCB46JiR6VbOyj03o9+h/wLeggDxAY2ECPKhHqyFU2FZ8E6hLSoM+AE29Qm76lo6fTQCwY9whXLpdxDkYvWAdhoS8p63TBzfU+DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jB7FiNM0z+859it32nLuN8QtC1yJ3+h8rDGoBhDZQUo=;
 b=bfM/epYAwqEBAj28nIwfYZR4C8Bqe1x+C6qmygdi9D0ODaJQLOaGXT7a8Na8x6zk9VaXPhDHDcp1Dx8wJj7DW6D7byy+gIwt2S/43ymNyrfVcMhuMgFSkW6bk2CfhFYodELrzdgnFwDWo0Ddx8KebM1Q46jmaOzcou+Rf5PHspQeD5QW7DG69LfibW8MVzyVxNfFM8WOQu2q1i67pW3n0ap9ggsX/inBXCcxjTCss9ssmk6bAXPH8lB/YxBRswW/ohLszGQMaS+eADCndZQ+MisuhnSBORMA0HGL2eeglNpB5kw4E3j5JEl+L7/+QavsziKOGNr/mUkYL7dz41EMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by SN7PR11MB7512.namprd11.prod.outlook.com
 (2603:10b6:806:345::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 12:30:49 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 12:30:49 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [v2,3/5] Dockerfile: bump fedora version
Thread-Topic: [v2,3/5] Dockerfile: bump fedora version
Thread-Index: AQHb2sypBPjU+WMoGUyuoussQmuRtQ==
Date: Wed, 11 Jun 2025 12:30:49 +0000
Message-ID: <1ffdb2f8ca93af11c528316ad331ef7adad718de.camel@intel.com>
References: <20250611-bump_docker_distros-v2-3-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-3-90791ecb953d@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|SN7PR11MB7512:EE_
x-ms-office365-filtering-correlation-id: 8bc07d1a-21cf-4023-e3c6-08dda8e3cc35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dk1wQ0dkKzY4MjJSaTU2aHBZWWg0N2hRUVl5MnQxZytPTkNwZXVpeUU2VFB4?=
 =?utf-8?B?R2swZ1pYTnVwVXIwRzR0N2JtMVc4ZVZvTGR3UGxoMlk4RzUxdW8vRmd1N2I3?=
 =?utf-8?B?bWxFRm5HWStObWZSSDgwUjhGb0pJYytxTEw3Nm4yQ01zVTMvZnVoNHZkZk1l?=
 =?utf-8?B?OU8wMHNyajdJTVdxVndaS1JoR3BsbUhhbkpIOWNGMVJNY2plK1pCL3diSng0?=
 =?utf-8?B?ZUVtbGhOMXNlSlZoQ240THpCZVVBVWhJL1p6WjRUM0FTdFFWVTdzdC9BMXls?=
 =?utf-8?B?RlE3eXpBSFA5c1gvUmJjUlVuNzU4dUhpbmhNT09QaDNIQWgyeTVaR3lRSGF5?=
 =?utf-8?B?TlhsWlp5cnFBSEVsdGZTWlhnTDhsV0o3b1ZHTU0ycXRYbU5hSVVLUUhteGtJ?=
 =?utf-8?B?RnViblBjRXFCNU9GaVhZM0hiSjkxZFowMnpSUVFaU3prR1l3Wmp2THR5ZFdN?=
 =?utf-8?B?RkZCQ2hnQW9wZnhRekpCa2ZmUHhHUGdNR0pDZUhLSXRsNzE0WVJYWlhQQnp2?=
 =?utf-8?B?Mmt6R2dic1NKWE5tcHFMNGFxMEJ2Zmc1UnY3bmdBaXdJYXpzUERWWjFFWVNy?=
 =?utf-8?B?STl4RTllUktVVmVNWWYzKzYvRFpXaVg2NVhNQ2UrQ0FySUorYmYrVjZoYk9k?=
 =?utf-8?B?NUN2cm9hRU9iWjl0MGZEQUZ5WFZmSEorM21vMzNBMkZqakRMQ2Y1Vk5RSk1T?=
 =?utf-8?B?VGkzOVhFU3ZWNVFnSkswdkROeWtQU0tHNTBsOGx2UVJ4Z1NFMzdJd2tCcTMr?=
 =?utf-8?B?S2laR2oyb3I0czRNSVdGejJVK0YrYmZMVWdxL3JSNlAvWHhYdktpdnhyVFli?=
 =?utf-8?B?VlpldGNzQ0FlbVlKNlJwMDVhQzRHTHc0YkcrZUU4N0VvTVZ2Tmdka25UbnRE?=
 =?utf-8?B?ODArcXJnczBNeDBkT2EyZTBpYUNjeSs3UnhJbkZHYXRNZjEvd3IwL0NyZ0hZ?=
 =?utf-8?B?ajA3WWljNXZlaXhxZHBidW9XZW1pdisrM3dPV0x0RFY1ZUpJQm00aVJYbkx5?=
 =?utf-8?B?eTJXRlB1ZDZQZXFHeHVKWlhSUTBqMXRmdnpsb2NzU0xTUXZmQ1Yza21BaFF0?=
 =?utf-8?B?TGtGS2FLTU9nb2tNUVUxTVRvNk1wR3dKdFVrZWE1N2IzVVVscjhhRFA3L0Jj?=
 =?utf-8?B?OGJPcjJDTVRCVEE3a0MyTjA4T0hUckZySHF0T2xlN0NDbXh2R2hHZHZuQ21H?=
 =?utf-8?B?bWFUVWRta3VIdnYyWXJETWVveGVyK2g4SVVQOGwwN2Y2VS96WHdNK0Raa3hp?=
 =?utf-8?B?dFBlbHJCZGNlck56d3g1TjQxQVUrazNpa3RpL2ROdmx5RitMNy9WQUE4ZTQw?=
 =?utf-8?B?RlMzMG1FU1NmcUhWbGhOcE04K2RVKzN0RkZVRmF3VklINXlPSjM3aElHWlJD?=
 =?utf-8?B?bXp1LzkrTjloQiswSG45YlhaS252cWFrdGQxMk5BQWpOUHNVbGxROEtkbnQr?=
 =?utf-8?B?Qk5rTFVHZXUyM3RQeldXdzB5VjZidE93NnhyRktSTm04NXBtV2NMUkVHK2sy?=
 =?utf-8?B?bjZEMmlLVXJyc0lXc3pUWWRvNVg2VFJFWWxKYzBaZzRiek9xRmdNSzl1UWZQ?=
 =?utf-8?B?WlZrRHpya0Ixd1VBUG5Ici9VK1dBc1VidXp1L3hNZmRwTWxaMXhsWFZ4dzIr?=
 =?utf-8?B?ak03VWN3QjFZWk90Wlo1UkxDY3NEVGRjYUpyTEZMNTQzcXpUTlRkbFFOWmI4?=
 =?utf-8?B?cDI1azdnTXpoUW02cDMxRkltQ29GQU5hTjVubEVpOFdLTUZmZVFoWWJ5ZDZK?=
 =?utf-8?B?cnlvaTdjYWRENVNhUXZxREN6R0tzOWcyN05WYlNzekhSVEo5ZW5Yd0dJaGtX?=
 =?utf-8?B?elVWdWl5enpuOElCdFVrTUVSRHprNThjcm9PMzdmVGtXcWhObGRRSzFMenRO?=
 =?utf-8?B?SXQ0SFpodWpScUNRUC9FL2hqSUE1Y0NFMGxSTm1ZTXcxSEhHNTR3RFVab0lp?=
 =?utf-8?B?VitUTFg2bFU5aTBiUno3WE9BMThDM2FocHA4ZlU4cjJXbGx6TGJqZmx6SEZK?=
 =?utf-8?Q?V1k2Iao02qXv872SyAArjWzq6kNIDo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDRiSm1xSGlET3d2bHBLTzhDZ3VmNVh5M2FjSUZKTGhJZ2VGS3Z0cnlKNDc0?=
 =?utf-8?B?d0pPTlpYcm80Y0pQNUtoV2h2dG5TTU1xbXhsWDZ4dGphVmppS3BGNDJFRndh?=
 =?utf-8?B?MmsrT1lHOGRwS0liTEtyTW11d2NoZDROMTBINGlKY1ZjaSsvOXU4QUF6RVFZ?=
 =?utf-8?B?aW9xcDI4bXJ0ei9EQnA2Q3AweXYydmFGS3VLNlFHby9FQW1nakovOHZWb1J5?=
 =?utf-8?B?amloT1hwNjY3UnhVTXFTbFptVllscS90WUZGdjNucTZzcHp6d3l0SVpLNGlz?=
 =?utf-8?B?OStPOFNodUhwSm9VbVlyZWF3Ti9Oc1h6ZVhNYmx5akNlWElDdEZDaWJ0eStl?=
 =?utf-8?B?TUxSNlZtNElNS3FUUzZQbkdDejhEZmdNR1RPZzlZRFQ1REVsbTVJYjk4R3pl?=
 =?utf-8?B?bm5MOXV6U0R5c0h0NFBuU1JtSktiRjhrcDROZ2xWbUV6RldTbEVTbHJmckxI?=
 =?utf-8?B?WDUxNlgrVUI4aVpaZjh0NDVlM3Q3cHA1c1NqMDdTdWY4TTdGV0IyanF6aTJh?=
 =?utf-8?B?K2IrZGxna21NbEhWWTJ6SUhIekEyamRNYWdyY1ZBT1gydWFSandmd29RZGl2?=
 =?utf-8?B?eUxCUmM2Tm9kejVETGxPRVQ4bjNnSzJHbk4wVUwwK0RMcnYycnRiNFhEUzFa?=
 =?utf-8?B?aElSbEwveEdXcTc4bU5EbUhjejJDZ0lPRjNCcFFqeXpXQzA1V3FXWEdnOWg1?=
 =?utf-8?B?dnE1d1U3WitNcU9wejNWWThUZTZWcTVPU2MrWndQWTlkc1JoOHNYdVpOYlpZ?=
 =?utf-8?B?dHgvQ1A1bDhRWDFIdTE4azdOZFA3RmFLUGVxeVdybThFR1lXSGw3dG56SlpH?=
 =?utf-8?B?b1JaT2FFQzZNQjhGeFM1YWJMc2xxUFRCcjRFbnIyM1hSMkFHbEU5Y2tpbEN4?=
 =?utf-8?B?cW1Bc1ZiTCs0RGg5MUhUdDZUTWxadmtWeGozNnp2UFdKc0NwVDhMeTJQckth?=
 =?utf-8?B?Y2lBT2Z1bFV5MGZGekM3bjRWNmxPaWNNaUkyMWdpb2NhWDEvMVBCdmFkQ3NK?=
 =?utf-8?B?UFpCRGtuZDN2UjR5cGlBR3dBMnFjZkZ5eHgyZjF6VnZaWGtTeUl3NTdVMkx0?=
 =?utf-8?B?c3hrMGM2eEdBZGtuUGxjV3RsVFRMUEVaQ21oWDVBcWM3amFDMU42SDZKd1RI?=
 =?utf-8?B?Y2tuOW1DL1V1ZkxESGx1WVVlWElGUFpSRjFoRFlaVW13cE8yZG9OWWRPQkE4?=
 =?utf-8?B?Q29tYlR5alNoVTM3YXpYeTNSdFlGK1dSR1N0TUYxQUtGZjFvaDVBUFh3WWFs?=
 =?utf-8?B?T0VqNXdvcWVVNEJiZGJoSnNURlVGaDRHOFRlY2sxcEJQR2pUdE9UQ2ZMVEh0?=
 =?utf-8?B?cFlQTnV6aEkyVU1TVTlyb1lBWlBWWU9TQVpUOWlUOE03dnQwV1hPMGF0OHJ4?=
 =?utf-8?B?SHQ1Y2pYVFpxZ1ZXVFNXTm0vRGt1bC9iRGMwNHVmQkNJbU5Yb0hJQ1RzVEln?=
 =?utf-8?B?cXlCSjhaWFRhdUdDV1RxbHo5S3Vnbjg4VTlsaVdJOWdta1JHNnpMc1Q3UG40?=
 =?utf-8?B?cVhvODFteThOdkxJZzVySnZ0UFpsVHNpc3oyRklaYUFvWkE5YjhsU0JOMkIr?=
 =?utf-8?B?L3lQcExQRm1oeFpjQmpnYm5lN2hGT25ZaHpRSUVydFZFT3FOYXpKQmJ1RXBO?=
 =?utf-8?B?SjRSZndvYXZhdEhncXNRbE5kMGMrWkFjNzV0QTFzQVF5dFFCR1RIKzU5UzN0?=
 =?utf-8?B?ZjdsanViblRoUW1GdHpKbHE2OC9BRi9OUTV1MVkxWUZPbXBHc1AwSzM3Uk55?=
 =?utf-8?B?QkI0M0p0ZEZnM1VBTGVzdVZjaGtld1hHQk4zbThJVVg5QVVLN1MyYmV4eC9M?=
 =?utf-8?B?U1g0elZ3Z3NWdUpKTlh5MENxN0U5V3F6aUFBNHdkRlNYUExWUDhQNEpFN2tG?=
 =?utf-8?B?MWwyNkIzSG0rSzArcThJMUJPMGFqSmVIdjk5U3BhSkQrZEtvaU43SEJkaTZh?=
 =?utf-8?B?VExzeDRkQmFGVGZLeVh5SUZUekdTRU9HTDdTeWk4OHdzcXVVdlI3blZRd3FN?=
 =?utf-8?B?STVJQkh2ZDg2YldmT00wN2l6cUZHTFFYYndzYWl0SSsrU1VYb3NHTkFZU0Uy?=
 =?utf-8?B?dVg1c2JBcTRnaGl2a0M3WWFRNStjU21GNWNZOWRiM0htTkdGTk1sWUVFTnFC?=
 =?utf-8?B?ZWlUMjBpNk93Zm5qUytVRGZuenFIN2dvMG5vM1o2QllzeEVNWVJlVmFvME5a?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C451714FC8A5D4CABA95FE3242593F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc07d1a-21cf-4023-e3c6-08dda8e3cc35
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 12:30:49.3174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ht5E8xuTmWnQKpUI4ZLfEvPZ4pL7egdKcrAOEb5Hgmu72h83hl6L1EhZYuRKt//fD4Rp4WDZ1RAVUfjKGpgEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

SGV5IEFuZHJ6ZWosDQoNCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxMzowNiArMDIwMCwgQW5kcnpl
aiBIYWpkYSB3cm90ZToNCj4gRmVkb3JhIGhhcyBub3QgTFRTIHZlcnNpb25zIHNvIGluIHRoaXMg
Y2FzZSB3ZSBidW1wIHRvIHZlcnNpb24NCj4gY2xvc2Ugd2l0aCByZWxlYXNlIGRhdGUgb2YgZGVi
aWFuIGJ1bGxzZXllLg0KPiANCj4gdjI6IHVwZGF0ZWQgZGVzY3JpcHRpb24NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8YWRyaW5hZWxAYWRyaW5hZWwubmV0PiAjaXJjDQo+IC0t
LQ0KPiAgRG9ja2VyZmlsZS5idWlsZC1mZWRvcmEgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJm
aWxlLmJ1aWxkLWZlZG9yYSBiL0RvY2tlcmZpbGUuYnVpbGQtZmVkb3JhDQo+IGluZGV4IGRjNWQx
YjE2YjQ4ODgwNjk0MTY3NzUwY2QzOTkwYmQ3ZDcxNTRkNDMuLjAwZjQ1ODU3YzIwZjgyMzIwNTAw
ZTcyMzBlNzJjOTUyMjUyN2U3YTkgMTAwNjQ0DQo+IC0tLSBhL0RvY2tlcmZpbGUuYnVpbGQtZmVk
b3JhDQo+ICsrKyBiL0RvY2tlcmZpbGUuYnVpbGQtZmVkb3JhDQo+IEBAIC0xLDQgKzEsNCBAQA0K
PiAtRlJPTSBmZWRvcmE6MzENCj4gK0ZST00gZmVkb3JhOjMzDQoNCkFzIHlvdSd2ZSBzYWlkLCBG
ZWRvcmEgZG9lcyBub3QgZG8gTFRTIHJlbGVhc2VzLCBhbmQgdGhpcyBvbmUgaXMgNQ0KeWVhcnMg
b2xkLiBSZWFsaXN0aWNhbGx5LCBub3RoaW5nIHRoYXQgdXNlcyBhIHJlY2VudCBJR1QgY2hlY2tv
dXQgd2lsbA0KYmUgZG9uZSBvbiBhIEZlZG9yYSB2ZXJzaW9uIHRoaXMgb2xkLCBhbmQgSU1PIHRo
ZXJlJ3MgbGl0dGxlIHBvaW50IGluDQpidWlsZGluZyB0aGlzIGluIHBhcmFsbGVsIHdpdGggdGhl
IERlYmlhbiB0b29sY2hhaW4uDQoNCi0gSWYgeW91IHdhbnQgdG8gc3VwcG9ydCB0aGUgbG93ZXN0
IGNvbW1vbiBkZW5vbWluYXRvciBmb3IgTFRTZXMgKGxpa2UNClJIRUxzLCBldGMpLCB5b3UgbWln
aHQgd2FudCB0byB0YXJnZXQgQWxtYUxpbnV4IGluc3RlYWQuIEl0J3MgYSBSSEVMDQpyZWJ1aWxk
LCBoYXMgYSBMVFMgcmVsZWFzZSBhbmQgaGFzIGEgY2hhbmNlIG9mIGJlaW5nIGFjdHVhbGx5IHVz
ZWQgaW4NCnRoZSB3aWxkLCB1bmxpa2UgRmVkb3JhIDMzLiBCb251cyBwb2ludHM6IEFsbWEgOCAo
b2xkZXN0LCBzdGlsbA0Kc3VwcG9ydGVkIHJlbGVhc2UpIGNvbWVzIHdpdGggbWVzb24gMC41OC4y
LCBzbyB5b3VyIERvY2tlcmZpbGUgZ2V0cw0Kc2ltcGxpZmllZCBhbmQgY2xvc2VyIHRvIHdoYXQg
ZW5kIHVzZXJzIGhhdmUuDQotIElmIHlvdSB3YW50IHRvIGhhdmUgb25lIGFuY2llbnQgYW5kIG9u
ZSBtb2Rlcm4gZGlzdHJvLCBqdXN0IHRhcmdldA0KdGhlIGxhdGVzdCBGZWRvcmEgNDIgb3IgQXJj
aCBoZXJlLg0KLSBPciBkbyBib3RoIGlmIHlvdSB3YW50IHRvIGhhdmUgd2lkZXIgY292ZXJhZ2Ug
b24gTFRTZXMgQU5EIG1vZGVybg0KYnVpbGRzIGFzIHdlbGwuDQoNCj4gIFJVTiBkbmYgaW5zdGFs
bCAteSBcDQo+ICAJZ2NjIGZsZXggYmlzb24gbGliYXRvbWljIG1lc29uIG5pbmphLWJ1aWxkIHhk
b3Rvb2wgXA0KDQpUaGFua3MsIFJ5c3phcmQNCg==
