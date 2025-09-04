Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A73ACA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 07:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1674810E9A4;
	Thu,  4 Sep 2025 07:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3fAmFbyc";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD2010E9A3
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 07:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mANspSBV/S8I8y4Nug9V30mbvq6B/QC04oovRusHE0JAxLvVFkCgdX72B3GxpYCJKnHm/F3ykJvdhMlTjCyvKxPp9/jn6KCn6e16B0d7BvFHMR1AKs+SGxXIbEIWPFC8kfh1oRqEbECbtpsIgDOTiu7aa/OJgELgG0Ho+9nVNbZ2ngwOoxlYAHZBT4Ki3k1QtEjTsdzvX4LDBnTTlgBix7zL9K4aFIoHGZjNgGRy+THU/jzIqosKdMsth/JroN3CGAAfFOENJZtra0UgwRrTEPnqqijXx826UTwMHv7HzgF6Q8S9hFeAJ8tH0ON+FjXfwEwwY0mcxdMJtdIRY5DInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjcTdMYXNb2fcxWRkl9oEtAVGmJDMFzOPmG3yPOqx4o=;
 b=eoHQDrbhHjz2Lk90xsA1E1ph+l4vQrjUHeub6amcaPZd04/3bn+Mg+06WruMFXKXhw5N5NISJFnbjD5LTqXCkqOVpSaupnxHxryA+BhAdELYNWOT3AzzSFRSfMbFwWaCNPSqQvBhpN6ijhlykhEezKf+8gcezXjc78/wj+2hd9X8jzUFbz39Y/F2bNmLOmJOoR7h7v7ROyFucPjcF/BD2kModJSZZTKmSVadjWiJffhTsit42p1iXLKC1dTna1vs9UXVrwWXW+l1bYS0BC7ABZZGtbzdwPV+7uCTrKf6Yv58OeH3G+ZfSpOvxVdKdkkBH74nYfaNWfTVaKmBK4ti8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjcTdMYXNb2fcxWRkl9oEtAVGmJDMFzOPmG3yPOqx4o=;
 b=3fAmFbyckP4EXW2zEU8W+iu1JFBmi4Zl6MMG89tzKJSHVOCMQyOw+1M++87ekhq9ZricDhdeTKnZVPDWE0xZjR7H4WaLSlVdyucANOyZl9RXPvMGmJZFNoREI2fJLr4tUv+P310wu7H5JJEYDBp1YGD3ylVf3ke/e3fcburFKGo=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:36:56 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%7]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 07:36:56 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] tests/amdgpu: add CE write/fence subtest using new
 PM4 hooks
Thread-Topic: [PATCH 2/2] tests/amdgpu: add CE write/fence subtest using new
 PM4 hooks
Thread-Index: AQHcHTG7yG39epjukke1XKzjPOhZ/LSCosIA
Date: Thu, 4 Sep 2025 07:36:55 +0000
Message-ID: <DM4PR12MB51528D1F7803E4091F908701E300A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250904002012.123970-1-vitaly.prosyak@amd.com>
 <20250904002012.123970-2-vitaly.prosyak@amd.com>
In-Reply-To: <20250904002012.123970-2-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-04T07:36:06.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DM4PR12MB7671:EE_
x-ms-office365-filtering-correlation-id: 76d02706-2b3b-47ab-ad9d-08ddeb85d2f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?c1EvQjZlNTcwZTZMMXhvWU1KNUlmRWQ3UTNlcjRCeTRtRWxHTEw1WjNBcnNp?=
 =?utf-8?B?MlNpTk95RzR5U3ZSNDl0UFRadGZNSFVkbXZzWGdTS3FoUEZtM0JmaVFwcVhC?=
 =?utf-8?B?Z0lLZDl0NFcyUnI4SG02UzFTcWtZSG5IMTF6cFp1OW1jcFhjYnhJbndXeGNv?=
 =?utf-8?B?d0tLallIekVOeWM1MFRDMkc2cUpTQXlBaVpRN0xuaXhPWXNzVk9HQnRkNmVr?=
 =?utf-8?B?eWtJMmM3WjJBSzRpRlprMGN0K3UrYlpRSTZPSW9ncnc5YkdMV0tVSk1mTXRS?=
 =?utf-8?B?QlJGMDhBMzl3aGtOV28yejJneUtzcWZrc3VuVUpKZVVvaklnSnl2Y1JPK013?=
 =?utf-8?B?dkZNRmM2U2hsQlAxTlU0OFNMUHhlOHVhMms1RWJ6TXUyaVRUNEMwbnNOVzAx?=
 =?utf-8?B?U092SVgvcmVhL0RXbjB2NlZUWWMxVi8zUFFneTNhaktoSDZESVp5MVdLRGFm?=
 =?utf-8?B?bTk0aUVYZk1TbUNWbzBBbGdyQlJBSHROb0poUWo1dDB1SGQyczVkcVdZZGw1?=
 =?utf-8?B?NW5VcGlDM1VTdmY4aExaTTl2c3NqOGF2UFpHcnQwd0QvVFp2b2FxTE0zYzAy?=
 =?utf-8?B?MVlPY1E1dnoxU1NXc3Z5aFROUEVRM1pCSEFISzZrTXdrVlg5N3NaUlMycVNt?=
 =?utf-8?B?c2NWOFlndjNzVkdpRTBteWdZcGIyVDI0aWw4Qmc2RU55Z1FQWTV4OTEyVjJy?=
 =?utf-8?B?SnpscFA3dVZqVUowdDB5a2NHL3M4QndIcUNqTkJrbkpLUkQ4TGlyZ0x3WEp0?=
 =?utf-8?B?cGdjR2tDNnBRTDdEZHhYd0NuL1o5alpOQjgvWWlPNkhRVndneDhWSVU4akk5?=
 =?utf-8?B?dyt2WEh4ZjloL0V4K2txYWxnTjBObFZ4aGdYTERJQU1ZdGU1a3BsdmJVR2tE?=
 =?utf-8?B?L1Z3VllMUm0wR0cxbFFsS0pocFNIRk9hZTRCd3RoaHJYU041K2NWbEZiNld2?=
 =?utf-8?B?UDZiNnZ2OGkwb05hK2dkbllkaHlpRVU4NjhjQVh6S1FqM2JrS2s0cFNpTXkr?=
 =?utf-8?B?cE1wNlkyUnd4YUpvTFRWSmlNUkxPWVFrUFlRNnpMRXQ4MlhQeGFGQ2Mwd1Bz?=
 =?utf-8?B?M1JRRWtvdE9uaXp3eHB4V25sRU8zWkE0K2p5ZGVCM1RzTnhJdjNKYjFpY0Jh?=
 =?utf-8?B?eFRPd2ZRcWduTlg2KzlReTJIMFRIOUtYd3hmeWQ0U2dJTTBGWS96Rk83dUVC?=
 =?utf-8?B?aEFiWVlJaWNWZjhTMHFlK3VlRFZwbklQQVdSYTZ2cGRja3JydnN0NlRmSXRM?=
 =?utf-8?B?dmVVWkE1WXUxdUMrSUhnK0YvMlc1bVQ1TFZEenFxM0NhSjJWb1hCWFJ1Ri9l?=
 =?utf-8?B?Nm5HT2FBemMxRHJRemYyajJJNnVqYkNhUWlKUWVIN09TZDVsT0lRWHNmVmJl?=
 =?utf-8?B?M1h5Ui9QM3kwWVpzMWRTd1I5QnZyQWZDUTh3SSt3ZlNXQ0ZjMStaU3RFYWhI?=
 =?utf-8?B?UXVBbVhKSGx4ZUFrTCtEVGFMRjVxM3BUakZadDdSL2ZKWVp4WnBwMUltekZs?=
 =?utf-8?B?dkwrRFh0T1NOQWJtR1ZCOHduS2F5cXY1NzROOS9XVmJucjFKSEsxL3JxaGpk?=
 =?utf-8?B?MHRqdDJRSXdDMitFbkptaFBhMzVQUmR3dTM3MmJHdzRSSFRsYW54OUttOGFH?=
 =?utf-8?B?YkxXN1ovWUlmalFQZFNRUndQMGtDZHRFZkx4WVlyenIrMnNWeDIwcW9TYkpo?=
 =?utf-8?B?Yjc0bGMxOHhrMXYyY2txZFIzaXpQM0p1all3eTlNNm9JY1lvOGZQeWczQXBS?=
 =?utf-8?B?V0ozS2xZODVMaDRGS1NNM0dhZk9pcVE1YTgxbEVNUWU4R0VhMXlvWk9CSnRX?=
 =?utf-8?B?NlM0ajhHY1FZSnZhWFlZdG5td05zMGhlRTZ5Z1JwelFWdGtiQmFHQlYvb2ZM?=
 =?utf-8?B?cWZwT0RIcUxPcVlBa25aWnhhMmJJeXN1MWhKOEtFbDl1ekVnUm5obzVBS3VC?=
 =?utf-8?B?SXE1aS9xWHp6WGVYZENJRkJuV3RnQXFIRzNJbXJBcXJCYzM0ajdCV2pRL25l?=
 =?utf-8?Q?prRxHzFlOKitNqJeRmTHvfVhQtB/Fw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zi9nbVMvbzRoRE5vcUFlM0VKUUJVdnBDV1Zsc3ZKTXFWSnF1TGxpWDFwWjF2?=
 =?utf-8?B?TkFad3ZmRFllZmhzeXFlK2dCQ1A5RUVyQVFPOXEybmN4NmRTM3daQmQzUmdm?=
 =?utf-8?B?K3RtQzJhaUt5dlVmdzRna09oUWVYdEtubUdIaFg4Ym1McWdBbVVIVHFvaXk5?=
 =?utf-8?B?UkxKcVJtcU9SbHdGYkl2OG9TdDRiOENGRGxTNWhZeGhtb3pWdDRhQVFnUWxt?=
 =?utf-8?B?dWo1a1RZNzRZNncxellJd05haWtCMzRhUXBCLzIvbVN5eUZ1c0FCNFg0MG9T?=
 =?utf-8?B?Y2VMTDZPZ0pFNnE5QzFVcDZlR21iWk8wNlNKVTlqVWh5cFNaNHFMOXluYm9L?=
 =?utf-8?B?bzNhT0dlVjRHcTNXYXFRVzB6VzMwWjF3bzlSVk9PWElHVlJ6aG0zbWNKKzFP?=
 =?utf-8?B?U0lweUZ4K24xUzBReE9ETFZmWVBMUVVWSERzQWpObG81Z3pqVy93TmRYVXlS?=
 =?utf-8?B?RDgxY2c2eUk4bjB0QWs5elFISjRTQ3NSTTQvUGxzL09wREhEdzVpL2NHRklF?=
 =?utf-8?B?R05QNWpPMUlEUHhEL0p0TlRsbjNPNEszQ0dKZVpFUGNMNXhwbWZ1aldZOURJ?=
 =?utf-8?B?M3BRNERwc2lDZDNJd01kY0J3U0gyVUhrTWxuYkVtZlJHYVdCbUozS0d4TnFw?=
 =?utf-8?B?c2FBY1k2aTBscHRXUEpGWWxIWUVhSWxUN2V5OCtVUGN3dnhYODdZK3gyTzUy?=
 =?utf-8?B?ZkRBdjRSY0E5VVl0Q0hsRlJsY3Voa3lXdDJzcWs2d2trK0N1aTJ4bHo5UXNW?=
 =?utf-8?B?NG5UZVNtamxkd2k0Q1phc056Um5NT25LS0k0M01mbkJZSFBHM0NlajFQVEI3?=
 =?utf-8?B?bHZiUGREQmc3ZHd5d09tcTFTeitZZ2xFTnZNRzdQK2xhRjRPQlJWQVhURWFH?=
 =?utf-8?B?cDEwSjFUTnhTMVlrUVNVZnRTOUtlWDVLWXB2U0VreU1scWg4RDRvV096N0lm?=
 =?utf-8?B?WWZHcTkreHZEVU5GVk1yWXdQVmtsY3Viczd5ZjF2dG85c1Y0S1hLRFU3Zm1P?=
 =?utf-8?B?dmg1SXpta0tCNGJhNE5qK2djSmFuRlo1bXRyTkVKeXdiaFlJSUhtcDlMdUlJ?=
 =?utf-8?B?Vi90NGtmb0o5NDM4T3pXTWpPS0NjRVo1TE1LUnkxT1B5bkk2Ykhvb0loWnZi?=
 =?utf-8?B?OUNnYnlkNlNHak5jeVMrcWVuRUVVRjhsTk1jNXdVNGJwbTZSTUdxcTRRMHJm?=
 =?utf-8?B?QXBRK0JZL1lydkJWYlgyN1p3aW42Rlc5M2podk1JTDA1eDVuQ0kzZy9pNnRy?=
 =?utf-8?B?QVN4SEx4VVp0d09lUlh2OGttNDFOaTFYWXZzaG9IVHpjeG9pWUl3WnRzYTVD?=
 =?utf-8?B?K0JpUEllaHdmdDBRMlVpS2pqb0hjM2dhT2Q4aWFPbmExaTMwcWpqbGVZeXU4?=
 =?utf-8?B?NFFObHFqYmRxWFAzeTVHUEh1QWdYWHpFRE9vZU94Mmw4b0trcWF6VmFINEcx?=
 =?utf-8?B?Rm0wS29mOG5oUmlPODZ4cXNiRGR4UVZ1dGNkS2RWdTlESnhkU2NmaGIyZkQ0?=
 =?utf-8?B?dHFvR29ZZjNHd3FWOUV1SURKY1Q3aExEZ2gvVFJNcGZDVUs3NjFZbEJvYURO?=
 =?utf-8?B?WmNPc3ZsaWNXVHNiaFhHWlBtU0VreUVpQzhYdzZnRnAyakZkKzltOGNjZlFz?=
 =?utf-8?B?M2tuRmRvaWhHNGtXUG13Q25qWXZGUFdTTFBFeDZMREIzbnMxcEJuMzdwci9m?=
 =?utf-8?B?bzVjYUNUWHV6Y25jTUtObmFrZ3Bjb245RHpEY2l0dHdMV1ZocFdsY1c3QXJq?=
 =?utf-8?B?RzRrNFVHMDZwRERROW9ia0RSb3gwZkJGZUhQR1FENXJHRUZVMVVyQ2cyRFN1?=
 =?utf-8?B?cWFqVE9lazJwWC9vS0d0U3djcXFiNFRnMk9jVDFQWjZpdmVsQnhLUlBYb2ZB?=
 =?utf-8?B?S1Jwem1COW14UmhkK0dzZGljeFlJa0Y3NjBHaHp1b3owbWFuNEhhQVlOcFNl?=
 =?utf-8?B?VkZQL1dzSzZUMG91SE9RTGhRV1FuVTJxZDJiVi91ZnZmSEZjWGpoS2tkNmt2?=
 =?utf-8?B?bUxDUDU1ZDVZSEl1UlllcUNrVzAyYWRrMEw2TmMyam56MEZ1elhoRm1lZlJC?=
 =?utf-8?B?bC9vUHJMTGE0K2pGOWRBeHRPQm9ORUFsMlcyZ1RBTHZtNUg0YWJ5VVcvcktH?=
 =?utf-8?Q?06ig=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d02706-2b3b-47ab-ad9d-08ddeb85d2f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 07:36:55.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rch8DRdjTaDSjcwNGBolGYMdU1X56cniXGtb2CtvzE7w3YDUioSETuh/DLKN4DyRFkX29GEw87uzcmI6v8qaLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTogIkplc3NlLnpoYW5nQGFtZC5jb20iDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiB2aXRhbHkucHJvc3lha0BhbWQuY29tIDx2
aXRhbHkucHJvc3lha0BhbWQuY29tPg0KU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA0LCAyMDI1
IDg6MjAgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFByb3N5YWss
IFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBaaGFuZywgSmVzc2UoSmllKSA8SmVzc2UuWmhhbmdAYW1kLmNvbT4NClN1
YmplY3Q6IFtQQVRDSCAyLzJdIHRlc3RzL2FtZGdwdTogYWRkIENFIHdyaXRlL2ZlbmNlIHN1YnRl
c3QgdXNpbmcgbmV3IFBNNCBob29rcw0KDQpGcm9tOiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnBy
b3N5YWtAYW1kLmNvbT4NCg0KQWRkIGEgbmV3IHN1YnRlc3QgdGhhdCB2YWxpZGF0ZXMgQ0UgKENv
bnN0YW50IEVuZ2luZSkgYmVoYXZpb3Igb24gdGhlIEdGWCByaW5nLiBUaGUgdGVzdCBlbWl0cyBh
biBJQiBjb250YWluaW5nOg0KICAtIDI1NmsgUEFDS0VUMyBOT1BzIHRvIGNyZWF0ZSBtZWFzdXJh
YmxlIGxhdGVuY3kNCiAgLSBvbmUgUEFDS0VUMyBXUklURV9EQVRBIChlbmdpbmVfc2VsPUNFKSB0
aGF0IHdyaXRlcyAweGRlYWRiZWVmIHRvIGENCiAgICBHVFQgYnVmZmVyIHdpdGggV1JfQ09ORklS
TQ0KDQpUaGUgSUIgaXMgc3VibWl0dGVkIHdpdGggQU1ER1BVX0lCX0ZMQUdfQ0UuIFRoZSB0ZXN0
IHdhaXRzIHRoZSBDUyBmZW5jZSwgdGhlbiBwb2xscyB0aGUgZGVzdGluYXRpb24gYnVmZmVyIChv
cHRpb25hbGx5IGZsdXNoaW5nIENQVSBjYWNoZSB2aWEgYSB3ZWFrIHdyYXBwZXIgYXJvdW5kIGFt
ZGdwdV9ib19jcHVfY2FjaGVfZmx1c2goKSkgdW50aWwgdGhlIHNlbnRpbmVsIHZhbHVlIGFwcGVh
cnMuIEl0IGxvZ3MgdGhlIHRpbWUgZnJvbSBzdWJtaXNzaW9uIHRvIGZlbmNlLCBhbmQgZnJvbSBz
dWJtaXNzaW9uIHRvIHZpc2liaWxpdHkuDQoNClRoZSB0ZXN0IGNhbGxzIG5ld2x5IGFkZGVkIGhv
b2tzOg0KICAtIGdmeF9lbWl0X25vcHMoKQ0KICAtIGdmeF93cml0ZV9kYXRhX21lbSgpDQoNCnNv
IFBNNCBlbmNvZGluZ3MgcmVtYWluIGhpZGRlbiBmcm9tIHRoZSB0ZXN0LCBhbmQgZmFtaWx5LXNw
ZWNpZmljIGRpZmZlcmVuY2VzIGNhbiBiZSBoYW5kbGVkIGNlbnRyYWxseS4NCg0KQ2M6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQpDYzogSmVzc2UgWmhhbmcgPGplc3NlLnpoYW5n
QGFtZC5jb20+DQoNClNpZ25lZC1vZmYtYnk6IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lh
a0BhbWQuY29tPg0KLS0tDQogdGVzdHMvYW1kZ3B1L2FtZF9iYXNpY19leC5jIHwgNjMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHRlc3RzL2FtZGdwdS9tZXNvbi5idWls
ZCAgICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdHMvYW1kZ3B1L2FtZF9iYXNpY19leC5jDQoNCmRpZmYgLS1naXQgYS90
ZXN0cy9hbWRncHUvYW1kX2Jhc2ljX2V4LmMgYi90ZXN0cy9hbWRncHUvYW1kX2Jhc2ljX2V4LmMg
bmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwLi5mZjhlNzVhMGINCi0tLSAvZGV2
L251bGwNCisrKyBiL3Rlc3RzL2FtZGdwdS9hbWRfYmFzaWNfZXguYw0KQEAgLTAsMCArMSw2MyBA
QA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCisvKg0KKyAqIENvcHlyaWdodCAy
MDI1IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVkZSAibGli
L2FtZGdwdS9hbWRfbWVtb3J5LmgiDQorI2luY2x1ZGUgImxpYi9hbWRncHUvYW1kX3NkbWEuaCIN
CisjaW5jbHVkZSAibGliL2FtZGdwdS9hbWRfUE00LmgiDQorI2luY2x1ZGUgImxpYi9hbWRncHUv
YW1kX2NvbW1hbmRfc3VibWlzc2lvbi5oIg0KKw0KKw0KK3N0YXRpYyB2b2lkDQorYW1kZ3B1X2Nl
X3dyaXRlX2FmdGVyX2ZlbmNlKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmljZV9oYW5kbGUpIHsN
CisgICAgICAgaW50IHI7DQorICAgICAgIGFtZGdwdV9jb250ZXh0X2hhbmRsZSBjb250ZXh0X2hh
bmRsZTsNCisNCisgICAgICAgciA9IGFtZGdwdV9jc19jdHhfY3JlYXRlKGRldmljZV9oYW5kbGUs
ICZjb250ZXh0X2hhbmRsZSk7DQorICAgICAgIGlndF9hc3NlcnRfZXEociwgMCk7DQorICAgICAg
IGFtZGdwdV9jb21tYW5kX2NlX3dyaXRlX2ZlbmNlKGRldmljZV9oYW5kbGUsIGNvbnRleHRfaGFu
ZGxlKTsNCisgICAgICAgYW1kZ3B1X2NzX2N0eF9mcmVlKGNvbnRleHRfaGFuZGxlKTsNCit9DQor
DQoraWd0X21haW4NCit7DQorICAgICAgIGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmljZTsNCisg
ICAgICAgc3RydWN0IGFtZGdwdV9ncHVfaW5mbyBncHVfaW5mbyA9IHswfTsNCisgICAgICAgaW50
IGZkID0gLTE7DQorICAgICAgIGludCByOw0KKyAgICAgICBib29sIGFycl9jYXBbQU1EX0lQX01B
WF0gPSB7MH07DQorDQorICAgICAgIGlndF9maXh0dXJlIHsNCisgICAgICAgICAgICAgICB1aW50
MzJfdCBtYWpvciwgbWlub3I7DQorICAgICAgICAgICAgICAgaW50IGVycjsNCisNCisgICAgICAg
ICAgICAgICBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfQU1ER1BVKTsNCisNCisgICAgICAg
ICAgICAgICBlcnIgPSBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUoZmQsICZtYWpvciwgJm1pbm9y
LCAmZGV2aWNlKTsNCisgICAgICAgICAgICAgICBpZ3RfcmVxdWlyZShlcnIgPT0gMCk7DQorDQor
ICAgICAgICAgICAgICAgaWd0X2luZm8oIkluaXRpYWxpemVkIGFtZGdwdSwgZHJpdmVyIHZlcnNp
b24gJWQuJWRcbiIsDQorICAgICAgICAgICAgICAgICAgICAgICAgbWFqb3IsIG1pbm9yKTsNCisN
CisgICAgICAgICAgICAgICByID0gYW1kZ3B1X3F1ZXJ5X2dwdV9pbmZvKGRldmljZSwgJmdwdV9p
bmZvKTsNCisgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0X2VxKHIsIDApOw0KKyAgICAgICAgICAg
ICAgIHIgPSBzZXR1cF9hbWRncHVfaXBfYmxvY2tzKG1ham9yLCBtaW5vciwgICZncHVfaW5mbywg
ZGV2aWNlKTsNCisgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0X2VxKHIsIDApOw0KKyAgICAgICAg
ICAgICAgIGFzaWNfcmluZ3NfcmVhZG5lc3MoZGV2aWNlLCAxLCBhcnJfY2FwKTsNCisgICAgICAg
fQ0KKw0KKyAgICAgICBpZ3RfZGVzY3JpYmUoIkNFIG1lbW9yeSB3cml0ZSB2aXNpYmlsaXR5IGFm
dGVyIGZlbmNlIik7DQorICAgICAgIGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiY29tbWFuZF9j
ZV93cml0ZV9mZW5jZSIpIHsNCisgICAgICAgICAgICAgICBpZiAoYXJyX2NhcFtBTURfSVBfR0ZY
XSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgaWd0X2R5bmFtaWNfZigiY2Vfd3JpdGVfZmVu
Y2UiKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2NlX3dyaXRlX2FmdGVyX2ZlbmNl
KGRldmljZSk7DQorICAgICAgICAgICAgICAgfQ0KKyAgICAgICB9DQorDQorICAgICAgIGlndF9m
aXh0dXJlIHsNCisgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2RlaW5pdGlhbGl6ZShkZXZp
Y2UpOw0KKyAgICAgICAgICAgICAgIGRybV9jbG9zZV9kcml2ZXIoZmQpOw0KKyAgICAgICB9DQor
fQ0KZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9tZXNvbi5idWlsZCBiL3Rlc3RzL2FtZGdwdS9t
ZXNvbi5idWlsZCBpbmRleCAyZDJhNjBhZWYuLjRjM2FmMjRmZCAxMDA2NDQNCi0tLSBhL3Rlc3Rz
L2FtZGdwdS9tZXNvbi5idWlsZA0KKysrIGIvdGVzdHMvYW1kZ3B1L21lc29uLmJ1aWxkDQpAQCAt
NSw2ICs1LDcgQEAgaWYgbGliZHJtX2FtZGdwdS5mb3VuZCgpDQogICAgICAgIGFtZGdwdV9wcm9n
cyArPSBbICdhbWRfYWJtJywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgJ2FtZF9hc3NyJywN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgJ2FtZF9iYXNpYycsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICdhbWRfYmFzaWNfZXgnLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAnYW1k
X2Jhc2ljX211bHRpX2dwdScsDQogICAgICAgICAgICAgICAgICAgICAgICAgICdhbWRfYm8nLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAnYW1kX2J5cGFzcycsDQotLQ0KMi4zNC4xDQoNCg==
