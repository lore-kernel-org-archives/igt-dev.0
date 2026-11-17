Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115C8606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 03:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y8jEImiD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A1510E048;
	Tue, 17 Nov 2026 03:15:04 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB210E02B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 03:14:00 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1b0739d31b9so2707c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 19:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885239; cv=none;
 d=google.com; s=arc-20260327;
 b=i86Of1uPMHNoem1sYGHShzns6czel8HsMbiYR+qi49P7QN8P4RRDJAV+6utwOCvz+G
 jQTS0BuGSHjrk0tfZNz4pfkXjevdWEFxy1eEmJPIBNLkzOhP/15LC6z2AduMJg7v0Fn4
 Wlx6UtSWsWmSHDPncopME4mlf6gv1CpIRpB9ZY/aJG9ii8i2TSGkxqbu1Rq10wTPLXZN
 sHStCtCnnHYPVl/YdiCVk9YDG3IThfolj3KScdtJdbbF8OddKO1EAzNw88xPDyF06gbo
 xgP3wBYHZNCeSrn8IUXwyG+utBxEAOPc1X6eOXYysbBDviK3d6maWaDFmmqG7iywgCFn
 P91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:references
 :in-reply-to:dkim-signature;
 bh=OnPSfVI84dTjgH/E2+Eefm5rPSTGeKhRlgAElLLOEL0=;
 fh=w5SOG8pOH27nbLRCN3G9gwC5f9AW41RuIOdwh85G6zo=;
 b=KMDEW4MWO+jCi8bgJ13JEtp5loICgYdJXkCLmx9CgWzlt/fPKIY8NypSjrnu519i3T
 zpSmECqjCZRJ7/peoLEl/u1KUdQMcWo6aEM0iSYe+A7Tu1X/FnD4eW/eePdIRvZvv/XS
 oaJx5wfxdHuqq0/LjaK+ZZi/azRumka9fREs31yeZQ28L4LZrag3pG2kkJHjIVIb54RK
 45oJb82HT2TfhIflpf/N2Pd2H4DytYTDbHdq4nd2TcgINdrqIaG5lgxEWnh6Xtr8zqU7
 5SWwMZnLsAcchfCunOXpo22YbqWiQtYJfcpqTDZ+rSMK/emuTd7nhCo7Xfq5XBDvDmXd
 clyA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794885239; x=1795490039;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OnPSfVI84dTjgH/E2+Eefm5rPSTGeKhRlgAElLLOEL0=;
 b=Y8jEImiDSJp3ay0lJBFalfLvpBHTChRTpEuEX15pG+kDIk7QJ1vzrZ3eudNpFZZa5m
 4zYVqKoRq/urjMJiw6S7AxWBMTxxH9rUE2Ndisv/6agxsj20834cXZuX0kUnfGHZJ+Fb
 3Vvbjbw067xk5SPf5RAEEHl12GimXXOwp5pU2IGMJvmEBJjqQzsLCMzQIBeUCoMk/TlY
 NYecgDEReVCK8jCSHHGdoB8W+BYAQ3yWUcvcSvl+Luwdn7Adic0uYBf31F4GASH9bJ5R
 3ilIBe5UpZWY7jOLn5wGIABOS87q3MJ2INIXRGqx0rxg3v6suqOYk2aVaTyVgcRXXbty
 BRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794885239; x=1795490039;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OnPSfVI84dTjgH/E2+Eefm5rPSTGeKhRlgAElLLOEL0=;
 b=EMuinKv8mYSncWZgTOryzLOJQOttoQbLQMcxLeHaWr9J3TFlgSP6MOh7L3hbsQzgxe
 dclKX1PD5cwly2JDVQjcoeyYfnOqHIo6OQOPlRkTy4stLRasHaLXPExWqD/6p7c8eCHn
 ChXvYvQ8JLDjIIYkW0AvyH8xAw3QvJ//8mVqNwwBAgWKU4UblY1oG5xKtV0hGus25LL/
 UbHXsXe820SY+SoF+tFR0xgPs6VxACnJTv+nw5ZNWQZogFfp3WcesUr6gITd5D3QC9mU
 gSTD2sEZ0GEnr889pxDXm8hRZ1jRSSHgwwfgqMdXQMFBeVfsSYNMhwVWvR3DjhnBdoZZ
 s4UA==
X-Forwarded-Encrypted: i=1;
 AL+hErH2dhEKbYxl1bZvZwVESBMF1JYvUJTiq3Mz/XL0mDSWTuKjFrhrbNuWsJRpBZaqt3kq92WMv/nv@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9QV2UldAuD3pJrMyb1QyYlf/xe3jTaRY4qzDdXXCrlNSCcWXBy
 Vtu3zHUA8c3G5fLSc8qPdcJupTn5YV6oU5S7g+KsMeKvKBxuH1ifVbqxxR/TLtznvQV92QL3qpV
 jV+ypUhP9ii3mPFxFXhhiX9dO7q8Qq7IP1fbP/1uC
X-Gm-Gg: AYBFou3J65ifgiryGw0MXfA9HB0s19Ka9mcNcGS8OMJkc1RT9xCkrOT8moEkfJgsNxi
 4NX0WiV0as9snNXSdhdVj4wSwHS9qyPxDaMHAwqSnZ0MGkq5We30TKn6rSBFRIs9+DUw01bcjkp
 hl4Yh94MSa64Cx3Mui0TEYr3pjfLE7lxHRVnWYYxl98SJ6OPEH0YIrWgG0UCQbOg2ZEptpqCF0B
 +npTr+CTp7JOGyey+KZKyiXAhichk+fBgGz93xLWT721UbkroVzWumVDyE0D2dsEO1aFbxiqAB+
 9hq3OqiLL28k6llnbSibSx4cklnbQA2pUurReoyq9gBQ7Qd4fat+lyCdEPhx93DQOEV/v41cN+4
 SUwvbNzxn/gbYcJBNeNaQMUQu7NLQnudD2+ySciap21i06vOd4ZGhzZGn3Yfst2v0UBc=
X-Received: by 2002:a05:701b:4354:b0:17f:fbc9:996a with SMTP id
 a92af1059eb24-1b53a932516mr185631c88.3.1794885238609; Mon, 16 Nov 2026
 19:13:58 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 22:13:56 -0500
In-Reply-To: <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
References: <20261114222911.1405626-1-gildekel@google.com>
 <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Gil Dekel <gildekel@google.com>
Date: Mon, 16 Nov 2026 22:13:56 -0500
X-Gm-Features: AclHuK_2Rmf-tgvJkoXm3khWbehobbsGdKAPTSCAzzL0Gelsn-vhc_FiO45IPyg
Message-ID: <CA++eeRP3m6kv-zu-Ea9WQOcyWZay77rjmut4R=5+twRpRETcrw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>, kunal1.joshi@intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jani,

On Mon, Nov 16, 2026 at 11:40:12AM +0200, Jani Nikula wrote:
> I suggested using libdisplay-info in IGT in April [1]. Has anything
> happened in that front?
>
> The more EDID parsing gets added to IGT, the harder it will be to
> migrate, and the cost of maintaining the local parser increases.

Nothing I am aware of, and I agree libdisplay-info is the right
long-term direction for IGT. Driving a tree-wide migration (build/CI
dependencies and converting existing lib/igt_edid callers) is beyond
what I can take on right now, though.

I kept the parser delta here minimal so it won't get in the way of that
migration:
- 1/3 isolates the check behind igt_is_edid_hdr(data, size), fixes two
  OOB/overwrite bugs in the CTA loop, and adds unit tests in
  lib/tests/igt_hdr - leaving a single tested function to swap over
  when libdisplay-info lands.
- 2/3 is ~38 net lines reusing lib/igt_edid.h's edid_dispid structs to
  pass DisplayID 0x81 CTA blocks into the same CTA helper, unblocking
  kms_hdr on DisplayID 2.0 eDP OLED panels today.
- 3/3 switches kms_hdr invalid-hdr to /dev/kmsg (no EDID changes).

Would you be open to landing this series in the meantime so DisplayID
HDR panels aren't blocked while IGT figures out its libdisplay-info
path?

BR,
Gil
