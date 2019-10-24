Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896F6E2B1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2019 11:23:19 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191024112010.qqdtrlv6awnp4u4o@ahiler-desk1.fi.intel.com>
References: <20191024110515.11741-1-arkadiusz.hiler@intel.com>
 <20191024110515.11741-2-arkadiusz.hiler@intel.com>
 <157191579157.2725.10000770507183685898@skylake-alporthouse-com>
 <20191024112010.qqdtrlv6awnp4u4o@ahiler-desk1.fi.intel.com>
Message-ID: <157191619085.2725.860784965527524464@skylake-alporthouse-com>
Date: Thu, 24 Oct 2019 12:23:10 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_list: Update,
 clean-up and document igt_list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTktMTAtMjQgMTI6MjA6MTApCj4gT24gVGh1LCBP
Y3QgMjQsIDIwMTkgYXQgMTI6MTY6MzFQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTktMTAtMjQgMTI6MDU6MTIpCj4gPiA+IFdlIGhh
dmUgZGl2ZXJnZWQgZnJvbSBob3cgV2F5bGFuZCBpbXBsZW1lbnRzIGxpc3QgYm90aCBpbiBwYXJh
bWV0ZXIKPiA+ID4gb3JkZXJpbmcgYW5kIGZ1bmN0aW9uIG5hbWluZy4KPiA+IAo+ID4gTmFrLgo+
ID4gIAo+ID4gPiBMZXQncyBtYWtlIG91ciBzaWRlIGNvbnNpc3RlbnQgdG8gZWFzZSB0aGUgY29n
bml0aXZlIGRpc3NvbmFuY2UgZm9yCj4gPiA+IGRldmVsb3BlcnMgd29ya2luZyBvbiBib3RoIHBy
b2plY3RzLgo+ID4gCj4gPiBQcmltYXJ5IHRhcmdldCBhdWRpZW5jZSBpcyBrZXJuZWwgZGV2ZWxv
cGVycy4KPiA+IC1DaHJpcwo+IAo+IFdlIGNhbiBhbHdheXMgZ28gdGhlIG90aGVyIHdheSBhcm91
bmQgYW5kIG1ha2UgaXQgYXMga2VybmVsLWxpa2UgYXMKPiBwb3NzaWJsZSwgYnV0IHRoZSBpbXBs
ZW1lbnRhdGlvbiB3YXMgYWR2ZXJ0aXNpbmcgaXRzZWxmIGFzIGEgd2F5bGFuZAo+IGNvcHkuCgpJ
IHdvbmRlciB3aHkgSSB0b2xkIHRoYXQgZmliLiBUYWtlIGEgZ3Vlc3MuLi4KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
