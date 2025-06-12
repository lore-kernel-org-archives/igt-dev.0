Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052A4C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 14:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB93310E878;
	Thu, 12 Jun 2025 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdCrzheq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9BC10E873
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749738037; x=1781274037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VBEewUFtuDx7iqUoqff3paEKHQYu3jL2Il1gkEpOC1Y=;
 b=RdCrzheqkiBK3UZxvWCnI93Pg8N/jVCFasEnjI6JA96usc3a/8dx6j36
 5Xj7NMRmtrY1On6ylbAnJM2DH7upjhPAZbdihY3upBzd0u8R/gXNdcgke
 a3Y8Lf14abBSjvXrDOevJgLo9vVo5OV05eW2vpQvwxP/TyWQjCpAd4NEI
 SKb4Ly5rzApGsNuCdp+0C9yDPB4IHi32xogntMlEN2z2JWq7DEcXyJsmR
 1vAJ27+jL4A+DlJmeDgZsdX9D2id/x5M2lXXZ0QJ56pHMEqSrRxbOKZNX
 iTH6B+BidxICuFhoH29qtRttIknCP9p/sB6r0mJziCbjGTqGForrVle1g g==;
X-CSE-ConnectionGUID: 8upgFJsLRmeq0P0AJw5vug==
X-CSE-MsgGUID: nCB/rraGSw2DbJpizGzSNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52020047"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52020047"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:20:37 -0700
X-CSE-ConnectionGUID: vpYn40SEQsWfWtM1wOEDeg==
X-CSE-MsgGUID: QbAgiwGPQ/ap7+CrrAtDHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147442088"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:20:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 07:20:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 07:20:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 07:20:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M08cr4XdWLAQvw99MPssGc2DTqv+RWzP2Qbdx69FinwctTEWOCCh17TtbehqVxDtYSNqjxWoRtN8Kk9rY8g2UnI+SJwImbKDu4Wgvv/p5RF+wzZ7j2JqZ8QHs/Lfe6BSV29HbESvJ5R7YoltoB802W7Gq6inh4pAxplnkKdH8LQ/0kC5mT/i7oADcZs7bZiSbykLpAQPueI0OuQ84p2I5BvxLxyMBcyLBGB0RAFXFGLJsUce1KwXVzizBMN4ZUTHCXBAYwNymGitcK4Ja1lKPbbanlLgPsJFLqWqiXC852kJiwD/8hXnidjrQj/7zsEmPuhzD1SFmjnJM6LjB8oWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pLOzy6JoSR1utobrh7TXt+1voAAAKNAzhiK0fkTMPI=;
 b=CefE1d81X8naW+zpBNqHKWuPU+g/SwEL7yPCW3qGnraj1VyBR1r5ZDd+YAiMAL8jJRHp5xUuQ2adJ4cefHdeh4H9qXD598JU0uBAZ84WjdG56iIQH9qjd+Z3zN0kRXu0FniedE9d8SmAW4AfMcDyHEbICW+ZXmzLkeZ/xRNM0GVijae6GMTXPwRtwkOOrJx4kMxssEzu11oHtr5l935lAMMgtJWqjTdhGlKFLFOsSfh4G3svB/q3Sha3ceQgnyh6mPROkpyKexsiKvtm1iBnkag6g7M4lCjvaIbAGGcLAmtCjf2jEn7ieR59dOHH3tmIagBBUivPWQqk/DTuaG1Lfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 14:20:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 14:20:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Topic: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Index: AQHb22/hCXX+z8nLl0CwT5ZzBqu/grP/jCag
Date: Thu, 12 Jun 2025 14:20:06 +0000
Message-ID: <CH0PR11MB5444419E64DD6CDC14D13ABAE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250612081524.26153-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250612081524.26153-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4794:EE_
x-ms-office365-filtering-correlation-id: c431d1d1-f28d-464b-9b60-08dda9bc3b2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uqhH2i94Fz450XGLKV3C8/ENHVQI0Bxxd++ZZvlvyLQU9z5WJcqlpMe9GM9C?=
 =?us-ascii?Q?MVLHWQzntJLc1VyCBPKTJUYoqrdOT4bqG+Ar2Ivb1ASWesrC4IqhKtm4dd+k?=
 =?us-ascii?Q?QAtp5Y+rNYSFmK3mHuncqzlcbdu2c/RKo6hNmxJoLoOePB8ZtkIkjrNjpib+?=
 =?us-ascii?Q?FjnPtWWLiQn1ssVpym0q9daAsLTCdL4ddBBfZ+kAygv4d+bumDUaQ7/B10f4?=
 =?us-ascii?Q?ypbbMiP5whC62eTq+vqcnKVnyaceU9UJaX2CYvZXhjbXX8Juj20ybkqoeHq1?=
 =?us-ascii?Q?GTFcnmKKlCaYYi7HEtORRNKBXLqTHWM6LzSOyEZKcTlRGwaABvC0dJ2o8V2z?=
 =?us-ascii?Q?/PKCD5NUbPGBkO83+WUqAfh9f3U9l4OOG6GG92tt564mMxoHbLbiexAIzDMm?=
 =?us-ascii?Q?UkzQoK/WvN8flry7A3G8BulZabeftWQG3QIGR42eqnpNs1bklfBIgYD7wr1P?=
 =?us-ascii?Q?dU4F+php7ozpCiaDUSGHOmU6vJJDpWfB6n4CwsCsqAHLf6OBR+Hk9Ut57iep?=
 =?us-ascii?Q?f9AfmdpEDJZdMDGstdGhxxGemPWPtky4KZdi3Pp58tefaAOJsmIPrVJe79Ru?=
 =?us-ascii?Q?sCJ7lHQzx4brDMmdYmxwxoNpG4whRY6deKggaW4H3AMPflZTbQr/FuMyE74V?=
 =?us-ascii?Q?ZxYbUsrZeyPXxYlrY+Y7o3yFSpQi8jkfpSRR8lvjMXbOXK9vEx+t9dCnSLLx?=
 =?us-ascii?Q?8oGIjZKnz2TYmF9lzgHckpZtxllxfMqKjvZdgjMmcYbTVMSP45W/zxoiZ6xv?=
 =?us-ascii?Q?NLq2uDpiX4suRkfwIxmw1UIBy35BJ4g7uIDFiBnc5141yLi99H9uC9C9gC34?=
 =?us-ascii?Q?CNNjNRqOHl1oWOQaHVcH1+kSQXx4HhzMHN54Qd5ubk394ugJ6EPCsmEideDE?=
 =?us-ascii?Q?ui7upLrhRJrCJvlwSqYdNk9I2VLMP2kdX7NWW6B8tqbATgrWzfNQp7CzehAm?=
 =?us-ascii?Q?q6x00lb9r/hAuvbuPvmKtL+bfzG4/LSo2NHlCtYcJskZKpHT9d38naswNpLV?=
 =?us-ascii?Q?BzEiHPzXEa4muyMEKJz+sP/fR+Z5R4E6/8w8d4+rUxVKGnuHd+5oVj6JigIm?=
 =?us-ascii?Q?NmiIH3BSkXP8jIGzFfRnGMRuV3xlrsJYXRIPXNT0QkMH2rOuUNNaVSeJhgt+?=
 =?us-ascii?Q?MuBX5RDGfkdglK5ezHJmAhe6+PbeW/SUAMWJWivLiAub0Dq5jMxtDIffrW7Z?=
 =?us-ascii?Q?jUy85b0yxltPLylBItVHbEHZKoHEoQO+r/6/hkbj29Qlf8KSnTpyZw9N3BIK?=
 =?us-ascii?Q?KH1ivCw37XV8ykKDktSHmY1rE+x1qTHAzIPDm2iXDB0WrOfENwIf3jcn106Y?=
 =?us-ascii?Q?BifPakw4onrN/at018azd03NXAuuxKiMk+udQ9UKwK9P/cK66tOi6x+ud4Bh?=
 =?us-ascii?Q?uwXBFqK6pqTHB/ZP+5L/XbOeKoB35wLzhxbp1sbZtd+vS3s7FH9TscnTvSPj?=
 =?us-ascii?Q?WelcbtqF7nY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M7Aa+CJK3tbjlirWDLkQGK6dedXiYYWs28UgOIaZ1f6hlkSaE3PNWIprmIjG?=
 =?us-ascii?Q?LKGBK3+ee4Np3wCbLeMTgLR21stxG2KRjRYP8/QVnfcKIsfKafppAGheSlv2?=
 =?us-ascii?Q?k1wteyRp9XgQkbvmG1iFKXwd5m9yrc/FsjE66io6XgJFwAbXhzLza1sFgu0J?=
 =?us-ascii?Q?Erduwu3/u+fQdmETdN6rFYIuPtw5aHrrt4gHkObHICsJx0lPW0kCvbX1fzgr?=
 =?us-ascii?Q?FJlnOZb0xnzvoHqsoluHWWIHqlWHESvsAJChaphkLOK+CIr/MP0zLPE/Dl1X?=
 =?us-ascii?Q?YNKGI3frR0EB5oXP+di0CLKZpmVAyn0WViSlSOJllCS9F0ZS+LpRI117UJxM?=
 =?us-ascii?Q?0c5Ft4KA7p3+CvCsIQifDF5ONx+3qfEC6229+26zXeHQfUjZ0zZmtqMiSfVS?=
 =?us-ascii?Q?cIkLbYwn8WUOKPkE4Ne4G/Y/CWWgyOtmWqi5/y7ZAuRMKotyUkEvoOc60ql9?=
 =?us-ascii?Q?y6zRaWQDZBaWl9F3IMKGxxAhl5uJpzJLXYr9gK0qnQL26kUbJ4fOz3ElfCCy?=
 =?us-ascii?Q?WjG5Scwf2dlefe0cXkIsOyCMYJq4eyF5Z4yZUxSskHBx3m8tbF+DZv7U6ERn?=
 =?us-ascii?Q?jPU/oHMZuu+BbXjDZkrL0ABQ4FrDDWjBgqQl8kosUPDNQfNuY50DwAPB374t?=
 =?us-ascii?Q?aciiPSVr6z+gOTaVk0qZTNJbXuTQT497a1waiB42Kqd13vns2R4QGeJ6xy6x?=
 =?us-ascii?Q?rhksZ98PLqWfg2ay2s5YqVeKBds0YoG+Q4j8RTLJhB+Ri3cIvrvLq98l8Bnp?=
 =?us-ascii?Q?fNAYXjSdhPhEfnRMOAOLDU9gLLSw+Bxc2F2QewzziM/gWhhz7vP142wvDj66?=
 =?us-ascii?Q?Nkk0eewuVYSPVudYjLk/QxMR/y0iHkbMCDpfiSdZvi61KXEUPUfv45/ol7Lf?=
 =?us-ascii?Q?SA+1kLIWP5uVzstWkzvO41L/EkEjK1oqRuDb9BOvkpn1rVJUtl1/q7nowmHF?=
 =?us-ascii?Q?AK5Jpu3zxW7SyqAYNB/RKKIRwWM2I2WEYv/gPqjXbuxbEwcdmwLaTa7E0F2r?=
 =?us-ascii?Q?Q4C5SxvjMMjCP1Y4wwiPtX6jS57N2S9VgVb5nlgkBLM9DNakbUK+GwJyDKeO?=
 =?us-ascii?Q?wtsVIbgha6bIkNFy8UktPL7X/m88GYKfl6P/aYzqcEaokbdUS+zKRB+OYFo4?=
 =?us-ascii?Q?gAyFXE4huBTe7stpKgropEaahkVrATUZvBF7wif4QvjGm5LVO4qYEbaeRfSa?=
 =?us-ascii?Q?//FnzF2Tu3U1WihnOwH1xUCnvsBdDOhg5PROb2ZvxEQSMnY3gFC/nH/Fw6ly?=
 =?us-ascii?Q?hZ5xug8GWh58kniaG07TcMxEQiFKVx8EQelMyegX/BZOW33bKYMJhpkH5d9w?=
 =?us-ascii?Q?6N4DE1SYajWwgkAWVc03oHYsyKbqedE02FWyQ0rJ+p7UD4LkCOtPonT0T58b?=
 =?us-ascii?Q?e9xAjyUj3G4MggweLzZqhmeAlRoTjdhBl+SSJ6KMnRBNTJGPftZ1Zg54FFjh?=
 =?us-ascii?Q?LFnssdn4NJCaDwHZEuIu5dvpzJOt2saaNKF0DLoBL86VzOG/IrLP72LmApag?=
 =?us-ascii?Q?rC7KoQJuli6Hke6lXBn7wnVTSI3fYWxDz497PcWEbnva/t8Hh9qyCGPNQcto?=
 =?us-ascii?Q?q8oijhlvfMf0i/yhr9wJQlCn6Jrv9NfbMEW4w7hMzhr7xk1OmFmxtPiEyyGZ?=
 =?us-ascii?Q?Aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c431d1d1-f28d-464b-9b60-08dda9bc3b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 14:20:06.7989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJi3EueEA4sYm5lnhuWEbHdrZW281Zj0ndB5XGsKS4rDxvb4a3j1t9lz0Lv/dZHqu644r/vgk5Xovg88Xk3rypyJeY1AjMt2PBjGSa9POMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

-----Original Message-----
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>=20
Sent: Thursday, June 12, 2025 1:15 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John C =
<john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; =
Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT d=
umps during fault injection
>=20
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_should_fail_ct_dead_capture() helper function,
> ct dead capture is avoided which suppresses ct dumps in the log.
>=20
> Inject fault into xe_should_fail_ct_dead_capture() function along with
> xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
> Same as https://patchwork.freedesktop.org/series/148416/ which was
> reverted due to change from XE was still in review.
>=20
> V4 -> V5:
> - Fixed review comments (Jonathan).
>=20
> Test-with: 20250612080402.22011-1-satyanarayana.k.v.p@intel.com
> ---
>  tests/intel/xe_fault_injection.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index aa3a3a7c2..8245c558c 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -113,6 +113,22 @@ static void injection_list_add(const char function_n=
ame[])
>  	close(dir);
>  }
> =20
> +static void injection_list_append(const char function_name[])
> +{
> +	int dir, fd, ret;
> +
> +	dir =3D fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> +	igt_assert_lte(0, fd);
> +	ret =3D write(fd, function_name, strlen(function_name));
> +	igt_assert_lte(0, ret);
> +
> +	close(fd);
> +	close(dir);
> +}
> +
>  static void injection_list_remove(const char function_name[])
>  {
>  	int dir;
> @@ -192,6 +208,18 @@ static void set_retval(const char function_name[], l=
ong long retval)
>  	close(dir);
>  }
> =20
> +static void ignore_fail_dump_in_dmesg(const char function_name[], bool e=
nable)
> +{
> +	if (strstr(function_name, "send_recv")) {
> +		if (enable) {
> +			injection_list_append("xe_is_injection_active");
> +			set_retval("xe_is_injection_active", INJECT_ERRNO);
> +		} else {
> +			injection_list_remove("xe_is_injection_active");
> +		}
> +	}
> +}
> +
>  /**
>   * SUBTEST: inject-fault-probe-function-%s
>   * Description: inject an error in the injectable function %arg[1] then
> @@ -227,11 +255,13 @@ inject_fault_probe(int fd, const char pci_slot[], c=
onst char function_name[])
>  	ignore_dmesg_errors_from_dut(pci_slot);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> +	ignore_fail_dump_in_dmesg(function_name, true);
> =20
>  	igt_kmod_bind("xe", pci_slot);
> =20
>  	err =3D -errno;
>  	injection_list_remove(function_name);
> +	ignore_fail_dump_in_dmesg(function_name, false);

This is better, though I think there's a stigma against giving a single fun=
ction a boolean
mode switch like this.  I don't know where that stigma came from, but it mi=
ght be
preferrable for you to just break the "false" case out and run it here dire=
ctly.

Perhaps something like:

"""
 static bool ignore_fail_dump_in_dmesg(const char function_name[])
{
	bool ret =3D !!strstr(function_name, "send_recv");

	if (ret) {
		injection_list_append("xe_is_injection_active");
		set_retval("xe_is_injection_active", INJECT_ERRNO);
	}
	return ret;
}
...
	ignore_dmesg_errors_from_dut(pci_slot);
	injection_list_add(function_name);
	set_retval(function_name, INJECT_ERRNO);
	ignore_dump =3D ignore_fail_dump_in_dmesg(function_name);

	igt_kmod_bind("xe", pci_slot);

	err =3D -errno;
 	injection_list_remove(function_name);
	if (ignore_dump)
		injection_list_remove("xe_is_injection_active");
"""

If you do that, you can have my
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	return err;
>  }
> --=20
> 2.43.0
>=20
>=20
