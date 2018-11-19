Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2489861
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Nov 2018 13:41:40 +0000 (UTC)
References: <20181119110528.12877-1-maarten.lankhorst@linux.intel.com>
 <20181119110528.12877-2-maarten.lankhorst@linux.intel.com>
 <154262911851.24263.4715261876810617834@skylake-alporthouse-com>
 <154262930387.24263.15805233795880904500@skylake-alporthouse-com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <dbc09f70-d9df-a449-cdd6-4e9a2abd3171@linux.intel.com>
Date: Mon, 19 Nov 2018 14:41:37 +0100
MIME-Version: 1.0
In-Reply-To: <154262930387.24263.15805233795880904500@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_render_tiled_blits:
 Make sure igt_buf is initially zero'd
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTktMTEtMTggb20gMTM6MDggc2NocmVlZiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTgtMTEtMTkgMTI6MDU6MTgpCj4+IFF1b3RpbmcgTWFhcnRlbiBMYW5raG9y
c3QgKDIwMTgtMTEtMTkgMTE6MDU6MjgpCj4+PiBnZW44X2JpbmRfYnVmIGxvb2tzIGF0IGJ1Zi0+
YXV4LnN0cmlkZS9vZmZzZXQsIHdoaWNoIGlzIG5vdCBzZXQgYnkgdGhlCj4+PiB0ZXN0LiBXaGVu
IEkgYWRkZWQgdGhlIGJwcCBmaWVsZCwgaXQgd2FzIGVub3VnaCB0byBtYWtlIHRoZSB0ZXN0IGZh
aWwsCj4+PiBmaXggdGhpcyBieSBtYWtpbmcgc3VyZSB0aGF0IHRoZSBidWYgaXMgaW5pdGlhbGx5
IHplcm8nZCBleHBsaWNpdGx5LAo+Pj4gd2hpY2ggZml4ZXMgdGhlIHRlc3QgdG8gcnVuIHJlbGlh
Ymx5IDEwMCUgb2YgdGhlIHRpbWUuCj4+IFdoYXQ/Cj4gTm90IGdlbV90aWxlZF9mZW5jZV9ibGl0
cywgd2hpY2ggZG9lc24ndCB1c2UgbGliZHJtLgo+IC1DaHJpcwoKWWVhaCBidXQgZ2VtX3JlbmRl
cl90aWxlZF9ibGl0cyBkb2VzLCBwdXNoZWQgd2l0aCBQZXRyaSdzIGlyYyByLWIuIDopCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
