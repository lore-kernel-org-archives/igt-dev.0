Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE536E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2019 13:52:46 +0000 (UTC)
Date: Fri, 24 May 2019 16:52:42 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190524135242.c4czps2zyqeh2d3d@ahiler-desk1.fi.intel.com>
References: <20190523104908.29176-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523104908.29176-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_audio: fix uninitialized
 variable
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6NDk6MDhQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFNlZW1zIGxpa2UgSSdtIG5vdCB1c2VkIHRvIHRoZSBDODkgc3R5bGUgeWV0LCBhbmQgQVNh
biBjYXVnaHQgaXQgYnV0IHdpdGggYQo+IGNvbXBsZXRlbHkgdW5yZWxhdGVkIHN0YWNrIHRyYWNl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KClJl
dmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
