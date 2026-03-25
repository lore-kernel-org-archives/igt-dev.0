Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4091A106B526
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C8510E555;
	Wed, 25 Mar 2026 12:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0NMHuHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D224710E24F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442622; x=1805978622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aupnzpM+Z7WbrgMRB5vVU356rwuL7H1/4iWf/ZZIWss=;
 b=P0NMHuHaJC4EjtnchQopYKReMd50BzjkTwQZvBEuk75e4lwDx4epSpXZ
 2UDmfOCHevyjpERN2KzmUYGYJw3+YX2cwoOe8OTjvM9TxaBxwluBA1KDD
 QgNJr1mt8KZZv35mk9u1YOOqKX7Zx/dhyx5Cx5m3cHGyJKwdn0GaOMNMw
 WhclLXtc3o+CbnDGO21mek8NbMETSDJPk/Wsy6XQidBLZlvb5bBT45JmX
 d17gNwCmN5f6GiCBFeUKYiFNuEUKm5iaJRmdO8o+2nV2IVCp/Zw25Xtb5
 Yd3Ya+AlFlrggc2PVoYTym42O5n1QYz2/hezHxZX3GOpCLOiRFHKvQYtK A==;
X-CSE-ConnectionGUID: t3P4u7pvShSBEtLhDDUHyw==
X-CSE-MsgGUID: TVwgHg4rRBO4jcj2kVSHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75443074"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75443074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:43:41 -0700
X-CSE-ConnectionGUID: EHFQ2zKXSc26u/XUoOsW5A==
X-CSE-MsgGUID: cIcERFOPRiasVdODZ0Zupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221784155"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:43:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 05:43:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 05:43:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 05:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJnBWdoSjtUrJSnpMMgpBR9R9veXqKavQlJc7qOtoj8mal2BYh0fLqu5ywFDrqQbLdXEgXigYXxGnb9YI/ohkd3U8qYrKRJFp2T36W3+JrIodilM0m+NAwn0RTzf2k4+33Y/Iynq0d9dV52UuNjeivT3GpApZOE023hBepymDiydZpuW/lYtVgp/hugJO1stkxxxoKlldiA4yCaMPlqTPFUt1k3+qStPy0SoOL0OR8OBYe8+bzHwdBKX8ku1H2w8jd2Zotakb2m4xWn1tFacYcnqh+1YWGJfhKta/3844R7tUPINJ4reScKlWLnWG8Oh7D/qPV+XxTJafJee3gU6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aupnzpM+Z7WbrgMRB5vVU356rwuL7H1/4iWf/ZZIWss=;
 b=QNv2YU7iLPTgt7TFXMewmY5OPmD/5ZEUVvoaViOH2fZO42WREGWzCqMWrv1raI/52Ny1TjC1lwTxTAmygaYwh4Bg88lCcRxZAIvtACeSaQ2vmYaHgscOt4G4UAL+Wd1qgnEoOEkgE53kPyGeaoa4Z9MxpLcApQE8teMh6fb72CD7p4Zwtr3AXjMC6dqT7FwpemFzGh39DrH8QoqNc4EzJb55F4ddYDEvvNamKSPiGYvqZx+3jq+X5W7BoE7b6PFw2ZfLTBmy79tkLtD8iDWbsreqHgT8DD3gbf4EPvV+DScuV4sEvs1Ugapf6cBOuSKMOBVAI5wX3uC/qr9sEriMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 12:43:36 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 12:43:36 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Thread-Topic: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Thread-Index: AQHcvB0yNI7SQuqA2ESq5awKcBstpbW/McCA
Date: Wed, 25 Mar 2026 12:43:36 +0000
Message-ID: <310501a7a46810ded3d6b88f50da975ca798f04b.camel@intel.com>
References: <20260325060339.2499618-1-sobin.thomas@intel.com>
 <20260325060339.2499618-3-sobin.thomas@intel.com>
In-Reply-To: <20260325060339.2499618-3-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SJ2PR11MB7715:EE_
x-ms-office365-filtering-correlation-id: bb7a177a-a46e-46b3-2c0b-08de8a6c21e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: lgVW+kE3+LCbkN2qlmpNkpTeOzcNq7pEQDw5x+5ZMJkc+WWV8SamoUCchfz518P/REWpwXSlKzIOkV8kJUjpjTn2riCGmYRpcqCELEuXYmR/LkS/CXmLquksFBj79OnR9wuHYLsJvsQbtDjgQzl5c9DX1jnsV9dvF+oXkTXGWaM1OhS3lz60Az9+2bNtrfzGh13vZ6nr6IZD/y/QsjNHRbZwXNGRS77FZKAXsVs0tbQrV4JOQDbfF6F66OnaCKJRe8+VN4sm71xiJiMZ6A3bqdawOOy7hvyHJ/2zZSx52JtIbRS53NvZ1XuP8K23SLB2dCEpATS1yypuuLcMAmTK+EBE3rh4ZU69aB1HFSfL9zR1ydnwIEVSejvfyK5NcrtGdqne+VTNwCZkcRtn1Sl8wLV0FkY2Vehh6mt2hgUMELswNwVf+g8+m3Q68OSRXTzOOBTeP7wwnhFrP5xmYr0JEElGJbIFSd9MEsexXx7CxnCGksCNaioGAKQKHmGqKcSAdJjwGlKHtIyaX/0HYal7ONpllqEdyMHivK2VXiIxvX5MDBsCCEe1NGaMW1XdqFq/BLPfZnlpzyfH77oWJRw1S94mU7julUOYWbOJSK96emRZnQsbzFyjdFmKEvQEMuETlKMQEN/Y4Qxq+yjeBSVAo/tVzisqtVXD3F1LmuM/cBr/b9AEa26kj4aICi70Oacb/8cLZZXBMEInJwtsl0BvD9ldl/VyK+LjtOQBx8l3eYY6qiRrW99/IPraEnDCAK0LDxD+gURanJOymexnsXk5xEAq8mFd4Jt+5CYHXN15lI4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUYvRG01VXFXT0pSWUhqM2lJendtQUtKc0xOSVFqZkcybHJQOEJuMVd2bFYx?=
 =?utf-8?B?OUtjQ0xXOUJ2aEJVc2RMV2g0VlV4NjRCSVhjWlJBMGF1U1NkZGR5aFo0NVhu?=
 =?utf-8?B?b0VMZDhOOHMvbXEzL2FyNzd1clhiN1FMM2QvQUVtcDR6VWJTNnU4RGJEZEd5?=
 =?utf-8?B?QTRBUm5zZVV5OFB2U3kzMGZnYTEvL3JnTmd0ZklWZFNka2RHelIrdnZpRG4z?=
 =?utf-8?B?aER0elhqMko0WCtiWjZ1cERXNU9Pb2JOdVdJZFdzRWhRcFkxQno3dTFXVEpQ?=
 =?utf-8?B?V0JyNVF4VThOUnQrOS93NEQrT2RZSll6S1o5clNNRHgvdzBtUlRDK05PNGhF?=
 =?utf-8?B?aEwxODVRY1crbGZDeEpIdEdhaCtqSkFsQkpoNnVDSGpJMXFvbDZOYUpzbjcy?=
 =?utf-8?B?MHk1L21Ja0laSldVZVFHN0I5SndVMG9KRmNqMGNOcHBGSzFnZ2ZTU3lGdlhX?=
 =?utf-8?B?bGFLOUYwRU1Wd2lGc1E4M1VYeGFlMnZoUzl2a1RFdGNCbW9MN201c29KMHgr?=
 =?utf-8?B?SEJVTm50ZU5tcittVU1QQXR6SnNOZEw3dityN01lYnp6dlV6U2g5cVhQSWJz?=
 =?utf-8?B?NnJVNTZkZ3ovdk1nTzlsU0JjRDlLaDVETjZHY2xHT1NRd3I2a2djaGhRSUtZ?=
 =?utf-8?B?Mkd4UjZrb0F5OWhOeDhZQUNER0JMVm5oU21xM2NKY1gxcjlyaDBheXFKN3k4?=
 =?utf-8?B?NkNMNGFQQ0xVbjZzalFINWVHbm42STRDbi93VTZYdzJGNGV6Ti8rRGN4d1A4?=
 =?utf-8?B?WThTeWZ4L284aVI4ZE1GWUJBWkNmM2ZVcE51aHNCS09YMWpxdkdzWTZScmw0?=
 =?utf-8?B?YkJpbzVzSzVySmpOZWFjTmx3L0RyNXFFSDB2YmRTYndQNmhJdXZCT1R6MGtE?=
 =?utf-8?B?K3NOeVZPdVpyNVl4T2RVY1YrRDVCUi9UUjZFeXFpS0tpV0ZGMG9kdEpaZU4w?=
 =?utf-8?B?SFkySzV3VkpObG1iNWp4clBHS093MWUzcDRJUitCTkZ6WVExK3JNaU5jYU4x?=
 =?utf-8?B?YmdTeHBMRkxKTlJRVUxBOWd6N1prbmgycHJDSjJZeHlXV29mWVdWQjFLL04y?=
 =?utf-8?B?amlDd2J3RFArWEZzd21DTVlpR2JJYjF1MnFIOHNrdVM1TThMZHRXUWdpMUFk?=
 =?utf-8?B?QVVuc0F0dFhIeG8xRFNyUG1uZHB3bDhTbEtBMzdaODlzMTEvQ2wzRjM2NktW?=
 =?utf-8?B?enQ2K1lHLzFHUFNSWUhIaEVNVUV6cEI1ZERhRDhUczV1YU5SaStNS0RmcWFZ?=
 =?utf-8?B?QWtYaGhPVTF6bjBqYjhqanhjS1dmNWhxc25wSkl5RFNtWEF5RWhtajhhOEZN?=
 =?utf-8?B?MU9kOFU2Mmd0M2FJVStXL3d4WkFUUEFmQVlodjF0QU9aTElJQ1dRRmZscEdS?=
 =?utf-8?B?L2J0OWlsRWFVR3dCYmkybDZ0ZFVSWW8wTGNjRE9Taldab0szU1gyVVNPaEJa?=
 =?utf-8?B?L1FkblhyNzNuRUYvQXhKcklaajdXQXYwSWFid3QzZHhWU3RodW5ELzgyRmQz?=
 =?utf-8?B?YmF4bGtpaGdHb09tdE5LT1ZMQzREeHNleVFOMUduS2VJZlYxVEdpUFdIL0Ir?=
 =?utf-8?B?anBYNko0OVVWZlJzamR3TTVjQit0UlZ5bWtheGNjcDRZOHI1UUxFUkdRWFBw?=
 =?utf-8?B?ZkZFanQ1Qy9RenM2blQ0TGV2cGVMSmllTGx3ZEdWa0hKMzAvb3p5cEJaejda?=
 =?utf-8?B?dWthSWdSUS9YMTZRZWgrdjRLMko3bmJhVTVNTWcrczVSK08xZGVKYW9XcWNm?=
 =?utf-8?B?U3VPd084MXhNWHExOXVpWkF1VDgzYmh2MXU3YTZlMGszWDdNaytrUlRFV2hm?=
 =?utf-8?B?TjhQNXRVakEwWURvYmVtSUs4ampqdTNsT21MQUdRYWwwcytFNHI3bkZZQjZx?=
 =?utf-8?B?dDNadkxQdlRpb3RQeXF1UDdBZVpwcHZsWUNnVFhsQzVEZ1RtYWdoa3ZwVTJt?=
 =?utf-8?B?QnVtc01lVlhwMkF6aWNDUVhlRjdmVGlZOGEyajdzd3c5RTlONzhPbkw1WlUr?=
 =?utf-8?B?VHRIYTFENk9sUnZVZGFReXI0d2dHNXloL1d0SzRuSXYyMU5MTTJVMWNZWE1r?=
 =?utf-8?B?aHpqbnJ0ZzE4a01lWmNOUU0yWnc1K2FCWnk4alZpbHR1dVVqcGwyaTdaZDc3?=
 =?utf-8?B?cE9RbHgvUDJ6OGJrVjk1ZGZKUWtXQlpRY1ZnVHMvanAxYTEzV2NMcU82Z3M2?=
 =?utf-8?B?Qm5SOExlNXlodGNUZEtuNy8wbGNVRGZQRkpUSFBVbDh1bDU1cHJTZkg2Z2Zy?=
 =?utf-8?B?SlAzYWxYQ3ZoSTRjRTQxNUUyYmV1WGpLSEtDeFNURUs0TmxRNnUySTVrY1pj?=
 =?utf-8?B?YndIazIvQ1lIYkFNQm5GTnNxVTNXUFBsMWN0K3lLMSt3eldZUitDVExUS1NI?=
 =?utf-8?Q?Gu5Fop9hF+2BN4YfEs38T3E/ZvPk6QSrhuxkOxyRwthh3?=
x-ms-exchange-antispam-messagedata-1: H39wtOhJ76zFBA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E22D8CF52BC464492D79EB23053E087@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D/Y2Eg8bA6zHlnBu5TnFJoMPIl5fDNyQoyCooA40YSMQIwiWGD04c/BQOOm1+0JmMdm6QVXzB5UnR6kzK2nIYrsC8sIa/Tkgrou4SjB3ox+PktaaWFgEdqE28tmFOA77wo1teNwMxX79Ao+RV1DGeNzufKJwqeFMDpG/cdla0vJTSCvVDdfAAqYHw42/eBIq9NlXMVa/ivJ0ti6s9NS0wqehGlVXNPrweeIkvRi4XIyHy8RrrdRA2ABfXpAjSrN1okdrD+DLG4JIV8uhnAXaY12bW4IXrxog3mWaVMjQeb3Tp68N95ondgMyAcck1y6xlgYEIdF7FAHAT0m6TdjpUA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7a177a-a46e-46b3-2c0b-08de8a6c21e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 12:43:36.2215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3Ae0BM88zjt2k5dC1PyzUATOj2HJUCpxu3D/R/iOLdskTqCCjDhnm3iAc3tcmcT6c/Pm5BI3iRC2ogxxT7ceqjMOA0l9rZPu2t+8EGyKg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

SGkhDQoNClBhdGNoIGxvb2tzIG1vc3RseSBjb3JyZWN0LCBidXQgc29tZSBxdWVzdGlvbnMgLyBj
b21tZW50cyBiZWxvdy4NCg0KT24gV2VkLCAyMDI2LTAzLTI1IGF0IDA2OjAzICswMDAwLCBTb2Jp
biBUaG9tYXMgd3JvdGU6DQo+IEludHJvZHVjZSBhIG5ldyBmYWlsYWJsZSB2YXJpYW50IHRoYXQg
cmV0dXJucyBlcnJvciBjb2RlcyBpbnN0ZWFkIG9mDQo+IGFzc2VydGluZywgYWxsb3dpbmcgY2Fs
bGVycyB0byBoYW5kbGUgZXJyb3JzIGV4cGxpY2l0bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
b2JpbiBUaG9tYXMgPHNvYmluLnRob21hc0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGxpYi94ZS94
ZV9pb2N0bC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKg
bGliL3hlL3hlX2lvY3RsLmggfMKgIDIgKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuYyBiL2xpYi94ZS94
ZV9pb2N0bC5jDQo+IGluZGV4IDE2YWFlMDVjOS4uMzBjOGExNWY2IDEwMDY0NA0KPiAtLS0gYS9s
aWIveGUveGVfaW9jdGwuYw0KPiArKysgYi9saWIveGUveGVfaW9jdGwuYw0KPiBAQCAtNzk1LDYg
Kzc5NSw0MiBAQCB2b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLA0K
PiB1aW50MzJfdCBibywgdWludDY0X3Qgb2Zmc2V0LA0KPiDCoAlmcmVlKCh2b2lkICopc3luY19h
ZGRyKTsNCj4gwqB9DQo+IMKgDQo+ICtpbnQgeGVfdm1fYmluZF9scl9mYWlsYWJsZShpbnQgZmQs
IHVpbnQzMl90IHZtLCB1aW50MzJfdCBleGVjX3F1ZXVlLA0KPiB1aW50MzJfdCBibywgdWludDY0
X3Qgb2Zmc2V0LA0KPiArCQkJwqDCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50
MzJfdA0KPiBmbGFncykNCg0KVHlwaWNhbGx5IGZvciB2ZXJzaW9ucyBvZiBhIGZ1bmN0aW9uIHRo
YXQgY2FuIGZhaWwsIHdlJ3JlIHVzaW5nDQpfX2Z1bmN0aW9uX25hbWUoKS4NCg0KTGlrZSBfX3hl
X3ZtX2JpbmRfbHJfc3luYygpLiAgQUk/DQoNCg0KPiArew0KPiArCXZvbGF0aWxlIHVpbnQ2NF90
ICpzeW5jX2FkZHIgPSBtYWxsb2Moc2l6ZW9mKCpzeW5jX2FkZHIpKTsNCg0KSGVyZSB3ZSBzaG91
bGQgYWN0dWFsbHkgdXNlIHVpbnQ2NF90IHdpdGhvdXQgdGhlIHZvbGF0aWxlIGFuZCB1c2UNClJF
QURfT05DRSgpIHdoZW4gcmVhZGluZyB0aGUgdmFsdWUgcG9pbnRlZCB0byBpbnN0ZWFkLiBJIGtu
b3cgdGhlDQpvcmlnaW5hbCBjb2RlIGhhcyB2b2xhdGlsZSBhcyB3ZWxsLCBidXQgdGhlIFJFQURf
T05DRSBpcyB0aGUgYmV0dGVyDQpjaG9pY2UuDQoNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3lu
YyA9IHswfTsNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKwlpbnQ2NF90IHRpbWVvdXQgPSBOU0VDX1BF
Ul9TRUMgKiAxMDsNCg0KV2UncmUgdHlwaWNhbGx5IHVzaW5nICJjaGlzdG1hcyB0cmVlIiBsYXlv
dXQgaW4gdGhlIGRlY2xhcmF0aW9uIGlmDQpwb3NzaWJsZS4gTG9uZ2VyIGxpbmVzIG9uIHRvcC4N
Cg0KDQo+ICsNCj4gKwlpZiAoIXN5bmNfYWRkcikNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsN
Cj4gKwkqc3luY19hZGRyID0gMDsNCg0KV1JJVEVfT05DRSgpIHdoZW4gdGhlIHZvbGF0aWxlIGlz
IGdvbmUuDQoNCj4gKw0KPiArCXN5bmMuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsN
Cj4gKwlzeW5jLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0U7DQo+ICsJc3luYy5h
ZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdCAqKXN5bmNfYWRkcik7DQoNClR5cGUtY2Fz
dCBjYW4gYmUgcmVtb3ZlZCBpZiB3ZSBkaXRjaCAidm9sYXRpbGUiLQ0KDQo+ICsJc3luYy50aW1l
bGluZV92YWx1ZSA9IEJJTkRfU1lOQ19WQUw7DQoNClVzZSBhbiBpbml0aWFsaXplciBsaWtlIGlu
IHRoZSBvcmlnaW5hbC4NCg0KPiArDQo+ICsJcmV0ID0gX194ZV92bV9iaW5kKGZkLCB2bSwgMCwg
Ym8sIDAsIGFkZHIsIHNpemUsDQo+IERSTV9YRV9WTV9CSU5EX09QX01BUCwgZmxhZ3MsDQo+ICsJ
CQnCoMKgICZzeW5jLCAxLCAwLMKgIERFRkFVTFRfUEFUX0lOREVYLCAwKTsNCj4gKw0KPiArCWlm
IChyZXQpDQo+ICsJCWdvdG8gb3V0Ow0KPiArDQo+ICsJaWYgKCpzeW5jX2FkZHIgIT0gQklORF9T
WU5DX1ZBTCkgew0KDQpSRUFEX09OQ0UoKQ0KDQo+ICsJCXJldCA9IF9feGVfd2FpdF91ZmVuY2Uo
ZmQsICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCg0KRHJvcCB0eXBlLWNhc3QuDQoNCj4gIEJJTkRf
U1lOQ19WQUwsDQo+ICsJCQkJwqDCoMKgwqDCoMKgIDAsICZ0aW1lb3V0KTsNCj4gKwlpZiAocmV0
KQ0KPiArCQlnb3RvIG91dDsNCg0KSW5kZW50YXRpb24gbG9va3Mgb2ZmLCBidXQgdGhpcyBpZi1z
dGF0ZW1lbnQgZG9lc24ndCBhY3R1YWxseSBkbw0KYW55dGhpbmcsIHJpZ2h0PyBCb3RoIGJyYW5j
aGVzIGVuZCB1cCBhdCB0aGUgc2FtZSBwbGFjZT8NCg0KPiArCX0NCj4gKw0KPiArb3V0Og0KPiAr
CWZyZWUoKHZvaWQgKilzeW5jX2FkZHIpOw0KDQpEcm9wIHR5cGUtY2FzdC4NCg0KVGhpcyBzaG91
bGQgKm9ubHkqIGJlIGZyZWVkIGlmIHRoZSB3YWl0IGRpZG4ndCBzdWNjZWVkLiBJZiB3ZSB0aW1l
ZCBvdXQNCmFuZCBmcmVlIGhlcmUsIHRoZW4gS01EIGNhbiBzdGlsbCB3cml0ZSB0byBzeW5jX2Fk
ZHIgYW5kIGNvcnJ1cHQgdGhlDQpoZWFwLCBzbyBpdCdzIGJldHRlciB0byBpbnRlbnRpb25hbGx5
IGxlYWsgbWVtb3J5IG9uIGZhaWx1cmUgaGVyZS4NCg0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+
ICsNCj4gwqB2b2lkIHhlX3ZtX3VuYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVp
bnQ2NF90IG9mZnNldCwNCj4gwqAJCQnCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplKQ0K
PiDCoHsNCg0KVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGluZyB0aGUgbmV3IGZ1bmN0aW9u
IGFuZCBhc3NlcnQgdGhhdCB0aGUNCnJldHVybiB2YWx1ZSBpcyAwLiBQb3RlbnRpYWwgdG8gcmVt
b3ZlIHNvbWUgY29kZS4gQUk/DQoNClRoYW5rcywNClRob21hcw0KDQoNCj4gZGlmZiAtLWdpdCBh
L2xpYi94ZS94ZV9pb2N0bC5oIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4gaW5kZXggM2VhNjUxMDYz
Li5lYmExMGJkMzQgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9pb2N0bC5oDQo+ICsrKyBiL2xp
Yi94ZS94ZV9pb2N0bC5oDQo+IEBAIC0xMTYsNiArMTE2LDggQEAgc3RydWN0IGRybV94ZV9tZW1f
cmFuZ2VfYXR0cg0KPiDCoHZvaWQgeGVfdm1fYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qg
dm0sIHVpbnQzMl90IGJvLA0KPiDCoAkJCXVpbnQ2NF90IG9mZnNldCwgdWludDY0X3QgYWRkciwN
Cj4gwqAJCQl1aW50NjRfdCBzaXplLCB1aW50MzJfdCBmbGFncyk7DQo+ICtpbnQgeGVfdm1fYmlu
ZF9scl9mYWlsYWJsZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBleGVjX3F1ZXVlLA0K
PiB1aW50MzJfdCBibywgdWludDY0X3Qgb2Zmc2V0LA0KPiArCQkJwqDCoCB1aW50NjRfdCBhZGRy
LCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncyk7DQo+IMKgdm9pZCB4ZV92bV91bmJp
bmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBvZmZzZXQsDQo+IMKgCQkJ
wqAgdWludDY0X3QgYWRkciwgdWludDY0X3Qgc2l6ZSk7DQo+IMKgI2VuZGlmIC8qIFhFX0lPQ1RM
X0ggKi8NCg==
