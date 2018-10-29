Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA18589DFB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 13:22:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w19-v6so7256713eds.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 06:22:12 -0700 (PDT)
Date: Mon, 29 Oct 2018 14:22:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181029132207.GU21967@phenom.ffwll.local>
References: <20181029085204.14547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181029085204.14547-1-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: restore
 for real before failing
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDk6NTI6MDRBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBOb3RoaW5nIGhhcHBlbnMgaWYgeW91IGRvbid0IGNvbW1pdCAuLi4KPiAKPiB2Mjog
cmViYXNlZCE/CgpTZWVtcyB0byBoYXZlIHdvcmtlZCBub3csIEkgZ3Vlc3MgSSBoYWQgYSBzdG9y
ZWQgY29uZmxpY3QgcmVzb2x1dGlvbgpsb2NhbGx5IHRoYXQgSSB3YXNudGVkIGF3YXJlIG9mLiBB
cHBsaWVkLgotRGFuaWVsCgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Au
b3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg1NTAKPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4NTQ5Cj4gQ2M6IFJhbWFsaW5nYW0gQyA8cmFt
YWxpbmdhbS5jQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGlu
Z2FtLmNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMg
fCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyBiL3Rl
c3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwo+IGluZGV4IDFlN2QyYjllNGU2OS4uODAxZWZm
NjZjMjcyIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwo+ICsr
KyBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwo+IEBAIC0xNzUsMTIgKzE3NSwxMSBA
QCB0ZXN0X2NwX2VuYWJsZV9kaXNhYmxlKGNvbnN0IGVudW0gcGlwZSBwaXBlLCBpZ3Rfb3V0cHV0
X3QgKm91dHB1dCwKPiAgCSAqICJjb250ZW50IHByb3RlY3Rpb24iIGF0ICJVTkRFU0lSRUQiLgo+
ICAJICovCj4gIAlpZ3Rfb3V0cHV0X3NldF9wcm9wX3ZhbHVlKG91dHB1dCwgSUdUX0NPTk5FQ1RP
Ul9DT05URU5UX1BST1RFQ1RJT04sIDApOwo+IC0KPiAtCWlndF9hc3NlcnRfZihyZXQsICJDb250
ZW50IFByb3RlY3Rpb24gbm90IGVuYWJsZWRcbiIpOwo+IC0KPiAgCWlndF9wbGFuZV9zZXRfZmIo
cHJpbWFyeSwgJnJlZCk7Cj4gIAlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIHMpOwo+ICAK
PiArCWlndF9hc3NlcnRfZihyZXQsICJDb250ZW50IFByb3RlY3Rpb24gbm90IGVuYWJsZWRcbiIp
Owo+ICsKPiAgCS8qIFdhaXQgZm9yIEhEQ1AgdG8gYmUgZGlzYWJsZWQsIGJlZm9yZSBjcnRjIG9m
ZiAqLwo+ICAJd2FpdF9mb3JfcHJvcF92YWx1ZShvdXRwdXQsIDAsIDEwMDApOwo+ICAKPiAtLSAK
PiAyLjE5LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
