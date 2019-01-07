Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6216EE43
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jan 2019 20:42:06 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190107191056.22759-7-jose.souza@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
 <20190107191056.22759-7-jose.souza@intel.com>
Message-ID: <154689371427.27300.17200738894983499973@skylake-alporthouse-com>
Date: Mon, 07 Jan 2019 20:41:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] tests/fbcon_fbt: Add and use
 psr_long_wait_exit() to test updates in PSR
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKb3PDqSBSb2JlcnRvIGRlIFNvdXphICgyMDE5LTAxLTA3IDE5OjEwOjU1KQo+IEFm
dGVyIGdldHRpbmcgYmFjayB0byBmYmNvbiBpdCB0ZXN0cyBpZiBQU1IgaGFkIGEgdXBkYXRlIGJ1
dCBzaW5jZQo+IGZiY29uIGNhbiB0YWtlIGEgd2hpbGUgaXQgaGF2ZSBzb21lIGJpZyBzbGVlcCBp
biBwbGFjZSwgc28gd2hhdCBpdAo+IGlzIGFjdHVhbHkgdGVzdGluZyBpcyBpZiBmYmNvbiBpcyB1
cGRhdGluZyB0aGUgc2NyZWVuLgo+IEluIHRoaXMgdGVzdCB0aGUgdXBkYXRlIG9mIHRoZSBzY3Jl
ZW4gY29tZXMgZnJvbSB0aGUgZmJjb24gY3Vyc29yCj4gYmxpbmtpbmcsIHRoZSBwcm9ibGVtIGlz
IHRoYXQgNDBtcyBpcyBhIHNtYWxsIGludGVydmFsIHRvIGRldGVjdAo+IGN1cnNvciBibGlua2lu
ZyBhbmQgdGhlIHRlc3QgY2FuIGZhaWwgc29tZSB0aW1lcywgc28gYSBiaWdnZXIgdGltZW91dAo+
IHRvIHdhaXQgZm9yIGV4aXQgaXMgbmVlZC4KClNvIHdoYXQgaGFwcGVucyBpZiB5b3UgZGlzYWJs
ZSB0aGUgY3Vyc29yIGJsaW5rPyBEbyB5b3UgYWN0dWFsbHkgbmVlZCB0bwpvcGVuIHRoZSBmYmRl
diBhbmQgZHJhdyBzb21ldGhpbmcgdG8gZW5zdXJlIHRoZSBwYXRoIHlvdSB3YW50IGV4ZXJjaXNl
ZAppcz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
