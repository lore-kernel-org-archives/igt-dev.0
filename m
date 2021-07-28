Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB336E0C1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 20:06:28 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 f9-20020a05622a1a09b02902615523e725so1592799qtb.21
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 13:06:26 -0700 (PDT)
Message-ID: <4ba5bb1e9fe08cbd9a6c43fc0e6e7eabc3d6520e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Wed, 28 Jul 2021 16:06:23 -0400
MIME-Version: 1.0
Subject: [igt-dev] Testing s2idle/S0?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Porygon Solomon <jsolomon@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi! Recently one of my coworkers from QA (cc'd here) asked me about whether we
had any tests for s2idle in igt - to which I looked, didn't see anything that
looked like a match, and suggested that they consider contributing some tests
for it. Note that when I mention s2idle here, I'm thinking about systems which
support both s2idle and S3 - as I know that s2idle is already being used by
default for suspend/resume by igt on s2idle only systems.

This made me realize that we don't actually have any explicit suspend/resume
tests - we only have tests which handle testing other functionality across
suspend/resume. This seems like it makes sense for the most part, which brings
me to my real question here - would it be worth it to try adding s2idle
support for most igt tests, so that on s2idle/S3 hybrid systems both suspend
modes are tested individually for each suspend/resume test? 
-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
