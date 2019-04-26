Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1588941E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 19:14:09 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190418194043.5184-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190418194043.5184-1-ville.syrjala@linux.intel.com>
Message-ID: <155630604509.22472.18100588096800599228@skylake-alporthouse-com>
Date: Fri, 26 Apr 2019 20:14:05 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib/igt_fb: Fix the cairo shadow
 buffer stride
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTA0LTE4IDIwOjQwOjM5KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gV2UncmUgY3Vy
cmVudGx5IG92ZXJhbGxvY2F0aW5nIHRoZSBzaGFkb3cgYnVmZmVyIHN0cmlkZSBieSBhCj4gZmFj
dG9yIG9mIDguIFRoaXMgZGlkbid0IGdvIGRvd24gc28gd2VsbCB3aGVuIEkgdHJpZWQgdG8gdXNl
Cj4gYSAxNmt4MTZrIGZsb2F0IGZyYW1lYnVmZmVyLgo+IAo+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IEZpeGVzOiBiMDAzM2Q5MzEw
YzEgKCJsaWIvY29sb3JfZW5jb2Rpbmc6IFByZXBhcmUgc3VwcG9ydCBmb3IgSERSIG1vZGVzLCB2
Mi4iKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
