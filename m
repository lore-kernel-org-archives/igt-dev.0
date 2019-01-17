Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFD66F3A0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 11:14:46 +0000 (UTC)
Date: Thu, 17 Jan 2019 13:14:41 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190117111441.i2qctgwjz2zulr5o@ahiler-desk1.fi.intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-7-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190116112050.27647-7-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 06/21] lib: Avoid memcpying 0 bytes from
 NULL
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDE6MjA6MzVQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBUaGUgYmVoYXZpb3VyIG9mIG1lbWNweWluZyAwIGJ5dGVzIGZyb20gTlVMTCBpcyBz
ZW1hbnRpY2FsbHkgc291bmQsCj4gYnV0IHN0aWxsIHVuZGVmaW5lZCBiZWhhdmlvdXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4g
Q2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
