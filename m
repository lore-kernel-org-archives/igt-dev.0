Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CE9C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 14:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3FD10E7A2;
	Tue, 15 Apr 2025 14:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g77Ajc8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6912410E7A2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744727476; x=1776263476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GfNsYTb02UurMDSVelbM66LwI89dhXnqeINMAceZacA=;
 b=g77Ajc8UyCFrZr26ns7dUjgvxOCZksQjGifAJ9BcofztSR+PAcuqumkj
 0kKWNotmKN3CSocWXYCBLSsPUq8AqbnX4gQEcKbBu808AbAWXRGXSce46
 Lbs3JBgPgs8B6iMhMIsh3WvvOXsJiHmxQGc/IkaVCpC2675rQ5ODCBRMO
 /A+z2WnozOk63dXru7SJrsQF8FG9VdCL/DrJbHabFI6S/aSiQ0lRvfcfo
 4fJzQ3Ut1jZwhTYGcEuC+k9ye69QuSk9IyqO56yqeEvwJWmMYM1rleKUa
 o3OkJt3Qc6UiHYuslZt4ue9vhstlFMQSU3xgQAVwynqqQHov/4XP4pooK A==;
X-CSE-ConnectionGUID: zV5Ywim0TrOuJFR9yfmZ6A==
X-CSE-MsgGUID: cfWhmY3wTTu0AgHZU1YiFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50065120"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50065120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:31:16 -0700
X-CSE-ConnectionGUID: 5Yvrc5ZoQwaFPwAYad93Iw==
X-CSE-MsgGUID: MgZWabcOTWWg2wNzI0l7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="167309206"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:31:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 07:31:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 07:31:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 07:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ247aY79hMvSqsWHE9/V6wpAp2EWFn6W/nUcJTvKqOLcUSQPulTG2bcSJwqP8AXLyJ+SgmHRLEQuQYFS3qQeTCXFUmdhW3dRuvMcvGocBcocKuf5PgpQVeLTMUAbaVNCFVusND/RX48vaSrsSaO+xFF2IGVXekYxSMv1uIq3wHvYQfNu4uy6R5QsjwOUMpHc3Bu9wADlkLNUPed2dYrlmSpBgWo9Gq42q+jLLvayIcvD/h1S7xjObFR0jMKkj/YMBMgnrHJMctM1bSfv3pz6W2JRwSu5+dThQymiY9yO+dKEBMA8C4jI0EH84NaO/88howKME5Z8C0PLewzfYA1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYcvFBgk/HUk12E+nmE8f2I2D3DFEKD0H3ojdGNC3zc=;
 b=CLl6lf0csRyT9PFDwL//TcXGB7O9AJsOi5LDqmeyKgZU+1YWRHqtdB+NtuPshHfCS1g2BI1bg/OxgCw3M14PhTNIqmIry6rzb4cCiIeiPp/JwrA4QocLbknqxngVauPEIqJctCIwEg7BMdOhGC3g0ICGafWeU5fSHL/BHvRR7apRWxe0XxkaFP38jHfOAACKSBzHbvLilertbYDml1fgKGWQmordIJvqPzjX4Ea5D0d0YgwG0cYuamofiZtDvGwfKUDHb2DBc9yORuSStgBBTXgXJNzvdUcoFY9ACqJpNswxyYu0B78sAJkI4/kf2rQppxlHpcq/K5iLDOS5/AteSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 14:31:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 14:31:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Thread-Topic: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Thread-Index: AQHbrd4dBsy0Cpd4KUSPAOxcT/zMDLOkySpg
Date: Tue, 15 Apr 2025 14:31:06 +0000
Message-ID: <CH0PR11MB5444F67498BB1E985A3FBB65E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
 <20250415082711.4831-2-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250415082711.4831-2-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: 7637f59a-3b85-478d-28c6-08dd7c2a284f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?A1At07mnaWd0OaPqYDw/gaWwmlTL4LCVG6rPD3mKgXeTzMisQFHHeNN+yE?=
 =?iso-8859-2?Q?b9KfYOLQNjYNIvuvto4/GxCHcTU1ARc9fu5bRr2RfOCzGFffpO5VhG0nOT?=
 =?iso-8859-2?Q?NPwcs92a6nejX9My6sTZ8Ty9b/6hp8Zy4Q5CZ78tKAnljf76Uw3DGnAUBy?=
 =?iso-8859-2?Q?474eXcgh5v/VPegphIK2SsxPT+MsTvrx7nfVyl9rqNMREo9E7pj/iay8FX?=
 =?iso-8859-2?Q?onl8AMxnKsd9GQWIOmgdXlk9D0X4AFBWKgXEIe326SpvhxaORQf48wec7C?=
 =?iso-8859-2?Q?M3lhVCn9yw6zQ+VCEhWq1Zi9UPkTK1J0OqYeQxUpVTUc5wmIkgoZqENJB+?=
 =?iso-8859-2?Q?Vo+TIIVgIL6NmtbdJ+wQqF74+K10fjtC9KRnvpZFvUysTgYuxNrfXGHUrL?=
 =?iso-8859-2?Q?oGnTN1HTiMoSD5R6ynTiRVBy6z8xTKueY8d10CYUKZoc1azuxGmUxMS4/5?=
 =?iso-8859-2?Q?yHcq2XJ00/Cp8IsS8OjQx5SBnrha0+2FDa4McOPG5VErnWJFET6x5kVw6m?=
 =?iso-8859-2?Q?LHWM1ye0AVM52cTD08+2jAAfXXYCSkUqpPEidRVuPMrRvHU+qqD+1xytJO?=
 =?iso-8859-2?Q?Yu5p2c4R2WhO/sIgRRAwDcRtlX867JDyoGHGGV2FMo42iECBLUbV8L6Lxd?=
 =?iso-8859-2?Q?XGP204j6zkl6ixD9VK1v0XqVPZB+jZH17A1MT7ysLdaNVbPzaM+/gbwUSY?=
 =?iso-8859-2?Q?LTH0MfFB/HLkX+PX+PTPzAzA46X6hkmCiK8sgNaeaVxtazDz2cmArE+aQr?=
 =?iso-8859-2?Q?paTyo/dh8zV8z85rLDNA3E+PaAUdE8N1kaWjMthBQgTv0xCH+ur1BoDQWJ?=
 =?iso-8859-2?Q?nG/1qc+HWoxxXXytw04J9NHOuu/9lTwfIdppud27yaIeLBP0NURMUAuS5i?=
 =?iso-8859-2?Q?V71Yx4AdCIoVKzg4kAG0lOrAM8yFPFQVTW4PNUcLqyGG0w0sCD6Y9XLU2K?=
 =?iso-8859-2?Q?Q1PX+Z0u/WAFgrt8Vif0bVX38HIgDrB4wCQmIU5wcczfFDQsXRLnDW0NLd?=
 =?iso-8859-2?Q?tSaydawpzKrPweu4up14bFe9hB4OIgOUMwQ0BCMdov8LxPaQJ3O1G+7ce3?=
 =?iso-8859-2?Q?bzbcWiL2GFWlWIwuyXVPbiokfQW4Qj87bz7o66qQ+9Wvm1fBS2i4IWPaVZ?=
 =?iso-8859-2?Q?9TbpeAPaCrVjjpbSWGjn0Lhag03iQKpUrs75SxHqhcuDUtZGhSMeUIUgD7?=
 =?iso-8859-2?Q?C7DOqocr3lssIRBbxZqb5JH4pY7+X6XNcKckkrYillibk+i7sTF6cdbXJx?=
 =?iso-8859-2?Q?MlhFYqolBMdEdyYCHwHOK8iWj0JsynLRC1HN7tORaJrPPjdY2+4bnZzK6z?=
 =?iso-8859-2?Q?t/aOOOX58qnDmpjgaOnVteBvlj70pBEEWvevUuaDRQWaZPULTriD0rRI3w?=
 =?iso-8859-2?Q?i+7MdZhN3984pdoS4V+5SQdYw5fbLqgZummcKoYVz0B71vlAteGmTvoMM7?=
 =?iso-8859-2?Q?GBPYzhrRxHeu/9nUyoOyf9YYxSBAK1lzVtxQ+N6A1vcxr4gk7Ppeky4ify?=
 =?iso-8859-2?Q?AeJaYeoRdjrq+RNLFW9YYmv9WjcIRAi17bKNIlasOYkdHQEaXBhpgDKkZ0?=
 =?iso-8859-2?Q?9Y6OQXk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?7+sKmBlY0Gx+43PkG0acTydn2C4PjoUXHp1j/l07F+1USiRPx4WODCSDHK?=
 =?iso-8859-2?Q?glPW48bWD/iEMykYLhi6oJOJpNmQCv4br+aAk8cDuaClIvaPnciMSaVD0R?=
 =?iso-8859-2?Q?Q1YHTUq1wt+OOUeYRXToOXM0OmDW1NGj3ssPnJyxQ7JvXSNnWWvnRdVKZ5?=
 =?iso-8859-2?Q?C+rIdO0YWrlgZVJY1eXrlAKOBTjP1MW5NcKwY6LFlD2Y2FvwUM9XI9KZzb?=
 =?iso-8859-2?Q?4w8k4Qa3bbJLEML62xY0I+mi+sQThMLwvwFbq1eL5XfAIIReNoKU3+ritW?=
 =?iso-8859-2?Q?mlwz+NqGOj/zToZnJ2y9gFrhGp0Q9ZfMSXTykM7AToF5RPqRjk33aYZnXY?=
 =?iso-8859-2?Q?/rpDSYR2efamMSwWNKLQxhbK/QJ9NCIIw5IHtCnalQYOwIKWE7MHYAMuFX?=
 =?iso-8859-2?Q?GVsoxO3MRBJlJJXPqW+uYQMYBh2p2EK0EICahRXumLvreaxf35z6bPif0H?=
 =?iso-8859-2?Q?hO4LbgdXLGo4dWJoVUmbHABiScY/FhaQbZwp2DaGWXEF/NMEpRQptRysch?=
 =?iso-8859-2?Q?iA9lCKJ4hB5P07TmH1X95GjmdBJQqSY/Sm5ujSr/CxL/VXGdOvnZF7YNiq?=
 =?iso-8859-2?Q?TNlOW1CCD18dy4taqMhWVw3zmR/wGiB7QR7FZSf2uWfdN8TeJ3zp6u/uX/?=
 =?iso-8859-2?Q?AXsn97132OnMJU6If/Ju0zGX0p+RLwyfynHjHiQjoCMvBUKYfyKlv9TQ5j?=
 =?iso-8859-2?Q?c37Vbgk+T0MGz6e2GWjzvDnrDEKVdLgbHSYcmvS8yiPTANDgQ0Xr6+MPGd?=
 =?iso-8859-2?Q?EYlzGZ98S2YWV6F6A7EoXqtmm27K28O6fz2+MWdsdBoW/mbQtIzXhw6Dlp?=
 =?iso-8859-2?Q?wwOntKmeG7SVPDVt1ibonYFl/71gDMDTaKDGc2kp+60D++SwkkX1w8FL1G?=
 =?iso-8859-2?Q?qsq0h9rs+ZAkrjWE42ZATX2BV2N49UhmCwzl8Q8dmT3WlXdPKWs8e7GjAk?=
 =?iso-8859-2?Q?jp/C5ZBlAXBJLKtM5DOXv2OQdh5XRDjrwrgMm5l/N4qciz3/H/E4nn4Axr?=
 =?iso-8859-2?Q?lfUwZxDr96D687ArVHgsywUsgaHpcu4r3aNdNgqCmOh2H6mUDZZvfTnBqv?=
 =?iso-8859-2?Q?K8GTtB/rG9UJ2fA5+MAg44XLulWxydPp9j82cGg6aPGDKEsBIwQruoxKQM?=
 =?iso-8859-2?Q?7NhlDL/1PD327WZu3DfA0xInBGT+lDXLsammUG3fLGd3xPztd/a8hiG2OK?=
 =?iso-8859-2?Q?aRWlr3GFrlpTSauOfqv6ySziBMYmrNdkEX2ARQqeovZSRvBxqLpMzZ2vJY?=
 =?iso-8859-2?Q?s2fxf5WkOtuq3wn9dY7H7ZKABOQfLAB8x0VIWoiAqn8hD0Da0kw5ERru8M?=
 =?iso-8859-2?Q?I3UaPEkOzvhTC7svWpvzv6Ayetu2guKakqG/vRXWq1h2Wx7NDH9MbqUd2s?=
 =?iso-8859-2?Q?OUudVvsRlphvTHNl+Lf9TbINjEv0BGzGs4N5hzzzu9XGZSqn9XS+FJBTZv?=
 =?iso-8859-2?Q?FnT8afErdJzEkkr3olgLTgqW+xfiVa56PB9x4n3k9Pnyz73iPtkX7Oh483?=
 =?iso-8859-2?Q?6+1eIGeRyh+8jZyfDC+nhAHR79aRAXwIODmyMdcNhPx5XtfQ3WCGJIVH1R?=
 =?iso-8859-2?Q?4yFOkOaxocr1iDKa6XLhdW2nbwSfQI6QzIInrUN5EwcAlc5jHVa+JB6Cxf?=
 =?iso-8859-2?Q?VTBZAXwl83v5NhNTxKcsUZ6CWh4q98IcBf?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7637f59a-3b85-478d-28c6-08dd7c2a284f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 14:31:06.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kG5wemIIyEExag6RRauQZ6Zh01UIZWnXJH37vMJbh7Z/xOeCVzxrlaLNgP+vtfwqUAk4cFdxhWXjEijw5EXmJ9QcPDJWKmJ4VPy3tjo9Ct0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Satyanar=
ayana K V P
Sent: Tuesday, April 15, 2025 1:27 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal=
 <Michal.Wajdeczko@intel.com>; Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make setup_in=
jection_fault() programmable.
>=20
> The current setup_injection_fault() is always programming fixed fault
> injection parameters. Update this function to accept fault injection
> parameters for better injection capabilities.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 46 +++++++++++++++++++++++++++-----
>  1 file changed, 40 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index fdd11ffe6..e56cdb304 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -27,6 +27,18 @@
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> =20
> +struct fault_injection_params {
> +	/* @probability: Likelihood of failure injection, in percent. */
> +	uint32_t probability;
> +	/* @interval: Specifies the interval between failures */
> +	uint32_t interval;
> +	/* @times: Specifies how many times failures may happen at most */
> +	int32_t times;
> +	/* @space: Specifies how many times fault injection is suppressed befor=
e
> +	 * first injection*/

The usual format for multi-line comments is:
"""
	/*
	 * @space: Specifies how many times fault injection is suppressed before
	 * first injection
	 */
"""
I won't block on fixing this, but I do feel I should bring this up.
-Jonathan Cavitt

> +	uint32_t space;
> +};
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> @@ -122,21 +134,43 @@ static void injection_list_clear(void)
>  	return injection_list_add("");
>  }
> =20
> +/*
> + * Default fault injection parameters which injects fault on first call =
to the
> + * configured fail_function.
> + */
> +static const struct fault_injection_params default_fault_params =3D {
> +	.probability =3D 100,
> +	.interval =3D 0,
> +	.times =3D -1,
> +	.space =3D 0
> +};
> +
>  /*
>   * See https://docs.kernel.org/fault-injection/fault-injection.html#appl=
ication-examples
>   */
> -static void setup_injection_fault(void)
> +static void setup_injection_fault(const struct fault_injection_params *f=
ault_params)
>  {
>  	int dir;
> =20
> +	if (!fault_params)
> +		fault_params =3D &default_fault_params;
> +
> +	igt_assert(fault_params->probability >=3D 0);
> +	igt_assert(fault_params->probability <=3D 100);
> +
> +
>  	dir =3D fail_function_open();
>  	igt_assert_lte(0, dir);
> =20
> +	igt_debug("probability =3D %d, interval =3D %d, times =3D %d, space =3D=
 %u\n",
> +			fault_params->probability, fault_params->interval,
> +			fault_params->times, fault_params->space);
> +
>  	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> -	igt_sysfs_set_u32(dir, "probability", 100);
> -	igt_sysfs_set_u32(dir, "interval", 0);
> -	igt_sysfs_set_s32(dir, "times", -1);
> -	igt_sysfs_set_u32(dir, "space", 0);
> +	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
> +	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
> +	igt_sysfs_set_s32(dir, "times", fault_params->times);
> +	igt_sysfs_set_u32(dir, "space", fault_params->space);
>  	igt_sysfs_set_u32(dir, "verbose", 1);
> =20
>  	close(dir);
> @@ -442,7 +476,7 @@ igt_main
>  		devid =3D intel_get_drm_devid(fd);
>  		sysfs =3D igt_sysfs_open(fd);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
> -		setup_injection_fault();
> +		setup_injection_fault(&default_fault_params);
>  		igt_install_exit_handler(cleanup_injection_fault);
>  	}
> =20
> --=20
> 2.43.0
>=20
>=20
